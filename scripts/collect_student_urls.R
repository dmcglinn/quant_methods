year = 2018
student_path = paste0('./student_', year)
students = dir(student_path)
git_urls = list()
for(i in seq_along(students)) {
    git_urls[i] = system(paste0('cd ', student_path, '/', students[i],
                         ' ; git remote -v'), intern=TRUE)
}
    

git_urls = unlist(git_urls)
git_urls = sub('origin\t', '', git_urls, fixed=T)
git_urls = sub(' (fetch)', '', git_urls, fixed=T)
write.csv(git_urls, file='./student_git_repos.csv', row.names=F)
