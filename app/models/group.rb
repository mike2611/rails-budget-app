class Group < ApplicationRecord
  belongs_to :user
  has_many :cost_groups
  has_many :costs, through: :cost_groups
end
