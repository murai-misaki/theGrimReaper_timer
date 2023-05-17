class OneDayTime < ApplicationRecord
  belongs_to :user

  validates :count_up, :exercise, :shortened_lifespan, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
end
