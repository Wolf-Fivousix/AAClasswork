class Sub < ApplicationRecord
  validates :title, :description, :user_id, presence: true
  validates :title, uniqueness: {scope: :user_id}

  belongs_to :moderator,
    class_name: :User,
    foreign_key: :user_id

  has_many :posts
  has_many :postsubs
end
