class Group < ApplicationRecord
  belongs_to :user
  has_many :cost_groups
  has_many :costs, through: :cost_groups
  validates :name, presence: true
  validates :user_id, presence: true
  validates :icon, presence: true
end
