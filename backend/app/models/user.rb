class User < ApplicationRecord
  has_secure_password

  has_many :user_workspaces, dependent: :destroy
  has_many :workspaces, through: :user_workspaces

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, on: :create

  def member_of?(workspace)
    workspaces.exists?(id: workspace.id)
  end

end