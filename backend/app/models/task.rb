class Task < ApplicationRecord
  belongs_to :workspace
  belongs_to :user

  enum status: {
    not_started: 'not_started',
    in_progress: 'in_progress',
    completed: 'completed'
  }

  validates :title, presence: true, length: { maximum: 50 }
  validates :status, presence: true, inclusion: { in: statuses.keys }
end