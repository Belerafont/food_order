class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :organization, required: false

  validates :name, presence: true

  enum role: [:client, :admin]

  after_initialize :assign_organization
  before_create :create_admin_if_first_user

  private

  def assign_organization
    self.organization = Organization.first unless organization
  end

  def create_admin_if_first_user
    self.role = User.roles['admin'] if organization.users.count == 0
  end
end
