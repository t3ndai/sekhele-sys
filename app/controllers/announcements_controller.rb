class AnnouncementsController < ApplicationController
  def index
    all_company_posts = @current_employee.organization.channels.all_company.channel_posts.order(created_at: :desc).limit(100)
    render inertia: 'Announcements/Index', props: { posts: all_company_posts }
  end
end
