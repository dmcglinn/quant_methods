
students = dir('./student')
for(i in seq_along(students)) {
    system(paste('cd ./student/', students[i], ' ; git pull origin master', sep=''))
}
    