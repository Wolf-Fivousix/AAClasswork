# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  COLOR = %w(Black White Blue Yellow Red Green Brown Purple)
  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: { in: COLOR, message: "%{value} is not a valid color" }
  validates :sex, inclusion: { in: %w(M F), message: "%{value} not a valid sex" }

end
