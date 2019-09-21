# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShortenedUrl < ApplicationRecord
  validates :long_url, presence: true
  validates :short_url, presence: true, uniqueness: true
  validates :user_id, presence: true

  def self.random_code
    new_code = SecureRandom::urlsafe_base64
    while ShortenedUrl.where(short_url: new_code).exists?
      new_code = SecureRandom::urlsafe_base64
    end
    new_code
  end

  def self.create_short_url(user, long_url_str)
    ShortenedUrl.create!(long_url: long_url_str, short_url: self.random_code, user_id: user.id) 
  end
end