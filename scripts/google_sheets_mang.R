
library(googledrive)

# read in class list
rclass <- read_sheet("https://docs.google.com/spreadsheets/d/1cZYMmzFNHoggn8qBTlcq_Q4srirbv9JK5WyDo2sJ950/edit?gid=0#gid=0")
rclass$last

eval_urls <- NULL
for (i in seq_along(rclass$last)) {
  drive_cp(file = "https://docs.google.com/spreadsheets/d/16An8KUIj_wOS-RZUiTCl82O3gPSHFTZrvr7_Y02ciwY")
  new_file <- drive_get(path = "student_evals_2025/Copy of student_feedback")
  renamed_file <- drive_mv(as_id(new_file), name = paste("student_feedback_", rclass$last[i], sep=''))
  renamed_file %>%
    drive_share(
      role = "writer",
      type = "user", 
      emailAddress = rclass$email[i],
      emailMessage = "Here is your R project sheet"
   )
  eval_urls[i] <- drive_link(renamed_file)
}

eval_urls
