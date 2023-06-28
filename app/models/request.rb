class Request < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  enum status: {pending: 0, accepted: 1, rejected: 2}
end
