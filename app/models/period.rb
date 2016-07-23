class Period < ApplicationRecord
  belongs_to :project
  belongs_to :stage
  belongs_to :member

  after_initialize :set_default, if: :new_record?
  def set_default
    self.start_at ||= DateTime.now
  end

  validates :project,  presence: true, on: :create
  validates :stage,    presence: true, on: :create
  validates :member,   presence: true, on: :create
  validates :start_at, presence: true, on: :create
end
