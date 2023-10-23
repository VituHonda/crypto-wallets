# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Coin.create!(
  description: "Bitcoin",
  acronym: "BTC",
  url_img:"https://static.vecteezy.com/system/resources/previews/008/505/801/original/bitcoin-logo-color-illustration-png.png"
)

Coin.create!(
  description: "Ethereum",
  acronym: "ETH",
  url_img:"https://cryptologos.cc/logos/ethereum-eth-logo.png"
)

Coin.create!(
  description: "Bitcoin",
  acronym: "BTC",
  url_img:"https://cryptologos.cc/logos/dash-dash-logo.png"
)