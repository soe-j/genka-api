class Period < ActiveRecord::Base
  belongs_to :project
  belongs_to :stage
  belongs_to :member

  validates :project,  presence: true, on: :create
  validates :stage,    presence: true, on: :create
  validates :member,   presence: true, on: :create
  validates :start_at, presence: true, on: :create
end
