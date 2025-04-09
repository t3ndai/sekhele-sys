desc "Seed Development Database with EmployeeJobs"
task seed_employee_jobs: :environment do
p "Assign all sample Org Employees to Job"
organization = Organization.find(1)
organization.employees.each do |employee|
  EmployeeJob.create(employee: employee, job_function: JobFunction.all.sample(1).first, job_level: JobLevel.all.sample(1).first, started_on: employee.hire_date)
end
p "Assigned All Employees Jobs"
end
