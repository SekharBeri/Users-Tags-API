class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true

  has_many :users_tags, dependent: :destroy
  has_many :tags, through: :users_tags

  scope :active_users, -> { where(is_active: true) }

  def user_response
    {
      id: id, first_name: first_name, last_name: last_name, email: email, 
      is_active: is_active, auth_token: auth_token
    }
  end
  
end
