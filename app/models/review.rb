class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :business

  validates :rating, numericality: {greater_than_or_equal_to: 0}
  validates :rating, numericality: {less_than_or_equal_to: 5}
  validates_presence_of :review, :rating
end
