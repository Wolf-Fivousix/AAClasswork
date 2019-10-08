class PostSub < ApplicationRecord
  validates :sub_id, :post_id, presence: true
  validates :post_id, uniqueness: { scope: :sub_id }

  has_many :subs
  has_many :posts
end
