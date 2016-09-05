class Business < ActiveRecord::Base
  has_many :reviews
  has_many :reviewers, through: :reviews, source: :user
end
