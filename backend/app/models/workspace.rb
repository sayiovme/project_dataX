class Workspace < ApplicationRecord
  has_many :user_workspaces, dependent: :destroy
  has_many :users, through: :user_workspaces
  has_many :tasks, dependent: :destroy
  validates :name, presence: true, length: { maximum: 50 }
end