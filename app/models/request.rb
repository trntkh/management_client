class Request < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  enum status: {pending: 0, accepted: 1, rejected: 2}

  def total_days
    (end_date.to_date - start_date.to_date).to_i
  end
end
