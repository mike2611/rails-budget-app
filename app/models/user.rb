class User < ApplicationRecord
  has_many :groups
  has_many :costs
  validates :name, presence: true
end
