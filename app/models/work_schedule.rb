class WorkSchedule < ApplicationRecord
  belongs_to :task

  acts_as_list
  validates :name, presence: true

  enum status: { pending: 0, done: 1 }
end
