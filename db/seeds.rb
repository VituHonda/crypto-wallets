# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

spinner = TTY::Spinner.new("[:spinner] Cadastrando moedas ...")
spinner.auto_spin

coins = [
  {
    description: "Bitcoin",
    acronym: "BTC",
    url_img:"https://static.vecteezy.com/system/resources/previews/008/505/801/original/bitcoin-logo-color-illustration-png.png"
  },
  {
    description: "Ethereum",
    acronym: "ETH",
    url_img:"https://cryptologos.cc/logos/ethereum-eth-logo.png"
  },
  {
    description: "Bitcoin",
    acronym: "BTC",
    url_img:"https://cryptologos.cc/logos/dash-dash-logo.png"
  }
]

coins.each do |coin|
  Coin.find_or_create_by!(coin)
end

spinner.success("Concluido")