class Bookmark < ApplicationRecord
  validates :customer_id, uniqueness: { scope: :plan_id }
  belongs_to :customer
  belongs_to :plan
  
end
