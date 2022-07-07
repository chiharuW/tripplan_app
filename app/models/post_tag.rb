class PostTag < ApplicationRecord
  belongs_to :plan
  belongs_to :tag
  validates :plan_id, presence: true
  validates :tag_id, presence: true
end
