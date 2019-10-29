# json.extract! @guest, :name, :age, :favorite_color 

json.partial! 'guest', guest: @guest
json.gifts do
  @guest.gifts.each do |gift|
    # json.set! gift.id do
      json.extract! gift, :title, :description
    # end
  end
  # json.array! @guest.gifts do |gift|
  #   json.extract! gift, :title, :description
  # end
end