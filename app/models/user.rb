class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  enum role: [:client, :admin]

  before_create :create_admin_if_first_user

  private

  def create_admin_if_first_user
    self.role = User.roles['admin'] if User.all.count == 0
  end
end
