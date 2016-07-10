class Member < ActiveRecord::Base
  validates :name,
    presence: true,
    uniqueness: true,
    format: /\A[0-9A-Za-z]+\z/,
    on: :create
end
