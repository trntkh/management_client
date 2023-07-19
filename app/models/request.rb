class Request < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  enum status: {pending: 0, accepted: 1, rejected: 2}
  enum shift_time: {'full day': 0, morning: 1, afternoon: 2}

  def start_time
    "#{self.start_date}"
  end
end
