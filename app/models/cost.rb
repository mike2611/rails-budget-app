class Cost < ApplicationRecord
  belongs_to :user
  has_many :cost_groups
  has_many :groups, through: :cost_groups
end
