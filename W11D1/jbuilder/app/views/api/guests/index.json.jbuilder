# json.array! @guests do |guest|
  # json.name guest.name
  # json.age guest.age
  # json.favoriteColor guest.favorite_color
# json.guests do
  # @guests.each do |guest|
  json.array! @guests do |guest|
    json.partial! 'guest', guest: guest
  end
# end
# end