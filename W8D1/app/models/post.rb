class Post < ApplicationRecord
  validates :title, :sub_id, :user_id, presence: true
  validates :url, uniqueness: true

  belongs_to :sub
  belongs_to :author,
    class_name: :User,
    foreign_key: :user_id
  has_many :postsubs
end
