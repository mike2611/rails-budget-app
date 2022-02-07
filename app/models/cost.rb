class Cost < ApplicationRecord
  belongs_to :user
  has_many :cost_groups
  has_many :groups, through: :cost_groups
  validates :name, presence: true
  validates :user_id, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 1}
end
