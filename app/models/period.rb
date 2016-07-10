class Period < ActiveRecord::Base
  belongs_to :project
  belongs_to :stage
  belongs_to :member
end
