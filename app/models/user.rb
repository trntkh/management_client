class User < ApplicationRecord
  has_many :requests
  has_many :comments
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.filter_user_by(params)
    if params[:key].present?
      users = User.where('first_name ILIKE ?', "%#{params[:key]}")
                  .or(User.where('last_name ILIKE ?', "%#{params[:key]}"))
    else
      all
    end
  end
end
