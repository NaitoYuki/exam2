class Picture < ActiveRecord::Base
  validates :comment, presence: true
  belongs_to :user
end
