desc "Create Sample Departments | Job Function Titles & Job Levels"
task seed_department_jobs: :environment do
p "Create Departments, JobFunctions & JobLevels"
5.times do
organization = Organization.find(1)
  department = Department.find_or_create_by(name: Faker::Company.department, organization: organization)
  3.times do
    levels = [ "D1", "D2", "D3", "D4", "D5" ]
    job_function = JobFunction.find_or_create_by(department: department, organization: organization, title: Faker::Job.title, salary_range: (rand(500..2000)..rand(2000..7000)))
    JobLevel.find_or_create_by(name: levels.sample, job_function: job_function, salary_range: (rand(500..2000)..rand(2000..7000)))
  end
end
p "Now have #{Department.all.count} departments & #{JobFunction.all.count} Job Functions & #{JobLevel.all.count} JobLevels"
end
