# == Schema Information
#
# Table name: sessions
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  user_agent :string
#  ip_address :string
#  sudo_at    :datetime         not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_sessions_on_user_id  (user_id)
#

class Session < ApplicationRecord
  belongs_to :user

  before_create do
    self.user_agent = Current.user_agent
    self.ip_address = Current.ip_address

    self.sudo_at = Time.current
  end

  after_create  { user.events.create! action: "signed_in" }
  after_destroy { user.events.create! action: "signed_out" }


  def sudo?
    sudo_at > 30.minutes.ago
  end
end
