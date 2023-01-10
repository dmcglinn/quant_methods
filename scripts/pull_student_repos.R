year = 2020
student_path = paste0('./student_', year)
students = dir(student_path)
for(i in seq_along(students)) {
    system(paste0('cd ', student_path, '/', students[i],
                  ' ; git pull origin master'))
}
    