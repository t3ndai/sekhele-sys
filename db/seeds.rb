# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


p "Creating roles"
# p "Removing initial roles - #{Role.all.count}"
# Role.destroy_all
[ "superadmin", "org_admin", "hr_admin", "payroll_admin", "it_admin", "manager", "dept_head" ].each do |role|
  Role.find_or_create_by(name: role)
end
p "Created #{Role.all.count} roles"


p "Creating PerformanceReviewTypes"
[ "downward", "upward", "self", "peer" ].each do |type|
  PerformanceReviewType.find_or_create_by(name: type)
end
p "Created #{PerformanceReviewType.all.count} PerformanceReviewTypes"

p "Creating Questions - PerformanceReviewQuestion"
p "Creating Questions - downward PerformanceReview"
[ "What specific goals or objectives did the employee achieve during the review period?
How did these achievements contribute to the team or organization?",
"What skills or competencies has the employee demonstrated improvement in? Provide examples of how these skills were applied.",
"What significant challenges did the employee face, and how did they overcome them? What strategies or resources did they use?",
"How has the employee contributed to team projects or initiatives? What role did they play, and what impact did their contributions have?",
"Can you identify any instances where the employee demonstrated innovation or creativity in solving problems or improving processes?",
"What feedback have you received from customers or clients regarding the employee's performance? How has this feedback been incorporated into their development plan?",
"What areas of improvement have you identified for the employee? How can they continue to develop their skills and competencies?",
"What training or professional development opportunities has the employee pursued? How have these opportunities enhanced their performance?"
].each do |question|
  downward_review = PerformanceReviewType.find_by(name: "downward")
  PerformanceReviewQuestion.find_or_create_by(title: question, performance_review_type: downward_review)
end

p "Creating Questions - upward PerformanceReview"
[ "How effectively does your manager communicate team goals and expectations?",
"Can you provide an example of how your manager has supported your professional development in the past six months?",
"How well does your manager listen to and address team concerns?",
"How does your manager involve the team in decision-making processes?",
"Can you describe a situation where your manager effectively resolved a conflict within the team?",
"How does your manager respond to new ideas or suggestions from team members?",
"How regularly does your manager provide constructive feedback on your work?",
"In what ways does your manager recognize and acknowledge team achievements?",
"How effectively does your manager help you set and achieve your performance goals?",
"How does your manager foster collaboration within the team?",
"Can you provide an example of how your manager has promoted inclusivity in team interactions?",
"How well does your manager delegate tasks and responsibilities among team members?",
"How effectively does your manager adapt to changes in priorities or work processes?",
"In what ways does your manager encourage innovation and creative problem-solving?",
"How does your manager contribute to a positive work environment?",
"Can you describe how your manager upholds the company's values in their day-to-day actions?"
].each do |question|
  upward_review = PerformanceReviewType.find_by(name: "upward")
  PerformanceReviewQuestion.find_or_create_by(title: question, performance_review_type: upward_review)
end

p "Creating Questions - self PerformanceReview"
[ " What are your most significant accomplishments since your last review? How did these contribute to your role or the organization?",
"What were your primary objectives, and to what extent did you achieve them?",
"What skills or competencies have you developed or improved upon? How have these enhancements benefited your work?",
"Describe a difficult situation you handled effectively. What strengths did you use to resolve it?",
"What job-specific goals do you want to accomplish in the upcoming evaluation period?",
"What skills do you aspire to develop further? How would enhancing these skills benefit your role and the organization?",
"What valuable feedback have you received? How do you plan to use this feedback to improve your performance?",
"Are there any new projects or initiatives you would like to be involved in? Why?",
"How have you embodied the organization’s values in your daily actions and decision-making?",
"In what ways have you contributed to a positive work environment? How have your interactions with colleagues influenced team dynamics?",
"Are there any tasks or processes that you believe could be streamlined to improve efficiency? Provide specific examples.",
"Is there any task or behavior that hinders your productivity? What should you stop doing to eliminate inefficiencies?",
"What new skill or approach would greatly benefit your performance? What should you start doing to enhance your effectiveness?",
"What actions or behaviors have yielded positive results? What should you continue doing to sustain or build upon your achievements?"
].each do |question|
  self_review = PerformanceReviewType.find_by(name: "self")
  PerformanceReviewQuestion.find_or_create_by(title: question, performance_review_type: self_review)
end

p "Creating Questions - peer PerformanceReview"
[ "What has your colleague excelled in?",
"What areas do you think your colleague could improve in?"
].each do |question|
  peer_review = PerformanceReviewType.find_by(name: "peer")
  PerformanceReviewQuestion.find_or_create_by(title: question, performance_review_type: peer_review)
end
p "Created #{PerformanceReviewQuestion.all.count} PerformanceReviewQuestions"
