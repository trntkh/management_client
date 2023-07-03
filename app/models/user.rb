class User < ApplicationRecord
  has_many :requests, dependent: :destroy
  has_many :comments
  mount_uploader :avatar, AvatarUploader
  enum user_type: {employee: 0, manager: 1, admin: 2}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  def self.filter_user_by(params)
    if params[:key].present?
      users = User.where('first_name ILIKE ?', "%#{params[:key]}")
                  .or(User.where('last_name ILIKE ?', "%#{params[:key]}"))
    else
      all
    end
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
