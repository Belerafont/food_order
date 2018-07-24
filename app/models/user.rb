class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orders

  validates :name, presence: true

  enum role: [:client, :admin]

  has_secure_token :public_key
  has_secure_token :secret_key

  before_create :create_admin_if_first_user

  private

  def create_admin_if_first_user
    self.role = User.roles['admin'] if User.count == 0
  end
end