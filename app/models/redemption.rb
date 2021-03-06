class Redemption < ApplicationRecord
  belongs_to :user

  validates :user, presence: true

  def self.user_ids
    pluck(:user_id).uniq
  end

  def self.eligible_users
    user_ids.map do |id|
      User.find(id)
    end
  end
end
