class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  before_validation { email.downcase! }
  has_secure_password
  has_many :tasks, dependent: :destroy
  has_many :labels
  def self.admins
    @users = User.all
  @admins=0
    @users.each do |user|
      if user.admin?
        @admins += 1
      end
    end
    return @admins
  end
end
