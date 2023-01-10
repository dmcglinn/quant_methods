# clone repos from data frame

stud <- read.csv('./data/Rclass_spring20.csv')
stud$HW.url
# drop last row
stud <- stud[-nrow(stud), ]

year = 2020
student_path = paste0('./student_', year)

for (i in seq_along(stud$HW.url)) {
  #dir.create(paste0(student_path, '/', stud$Username[i]))
  system(paste0('cd ', student_path, '; git clone ',
                stud$HW.url[i], ' ', stud$Username[i]),
         intern=TRUE)[1]
}

year = 2020
student_path = paste0('./student_', year)
students = dir(student_path)
git_urls = list()
for(i in seq_along(students)) {
    git_urls[i] = system(paste0('cd ', student_path, '/', students[i],
                         ' ; git remote -v'), intern=TRUE)[1]
}
    
## older code useful if you've already cloned all student repos

git_urls = unlist(git_urls)
git_urls = sub('origin\t', '', git_urls, fixed=T)
git_urls = sub(' (fetch)', '', git_urls, fixed=T)

git_handle = sub('https://github.com/','',git_urls) 
git_handle = sub('/.+', '', git_handle)


write.csv(data.frame(git_urls, git_handle),
          file='./student_git_repos.csv', row.names=F)
