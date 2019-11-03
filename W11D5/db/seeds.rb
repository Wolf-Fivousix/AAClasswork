# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Bench.destroy_all
Bench.create(description: "Aaa", lat: 37.783239, lng: -122.475554)
Bench.create(description: "Nice bench", lat: 37.757865, lng: -122.456685)
Bench.create(description: "Twin Picks bench", lat: 37.779764, lng: -122.405122)
Bench.create(description: "Soma bench", lat: 37.798674, lng: -122.417288)
Bench.create(description: "App Academy bench", lat: 37.797327, lng: -122.466564)
Bench.create(description: "Floating in Ocean", lat: 37.784550, lng: -122.558306)