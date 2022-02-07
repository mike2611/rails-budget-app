class User < ApplicationRecord
  has_many :groups, :costs
end
