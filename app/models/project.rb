class Project < ActiveRecord::Base
  validates :name, presence: true, on: :create
end
