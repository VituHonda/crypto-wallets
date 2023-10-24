namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando DB ... ") {%x(rails db:drop)}

      show_spinner("Criando DB ... ") {%x(rails db:create)}

      show_spinner("Migrando DB ... ") {%x(rails db:migrate)}

      %x(rails dev:add_mining_types)

      %x(rails dev:add_coins)

    else
      puts "Voce nao esta no ambiente de desenvolvimento"
    end
  end

  task add_coins: :environment do
    spinner = TTY::Spinner.new("[:spinner] Cadastrando moedas ...")
    spinner.auto_spin

    coins = [
      {
        description: "Bitcoin",
        acronym: "BTC",
        url_img:"https://static.vecteezy.com/system/resources/previews/008/505/801/original/bitcoin-logo-color
-illustration-png.png",
        mining_type: MiningType.all.sample
      },
      {
        description: "Ethereum",
        acronym: "ETH",
        url_img:"https://cryptologos.cc/logos/ethereum-eth-logo.png",
        mining_type: MiningType.all.sample
      },
      {
        description: "Bitcoin",
        acronym: "BTC",
        url_img:"https://cryptologos.cc/logos/dash-dash-logo.png",
        mining_type: MiningType.all.sample
      },
      {
        description: "Tether USDt",
        acronym: "USDT",
        url_img:"https://cryptologos.cc/logos/tether-usdt-logo.png",
        mining_type: MiningType.all.sample
      },
      {
        description: "BNB",
        acronym: "BNB",
        url_img:"https://cryptologos.cc/logos/bnb-bnb-logo.png",
        mining_type: MiningType.all.sample
      },
      {
        description: "XRP",
        acronym: "XRP",
        url_img:"https://cryptologos.cc/logos/xrp-xrp-logo.png",
        mining_type: MiningType.all.sample
      }
    ]

    coins.each do |coin|
      Coin.find_or_create_by!(coin)
    end

    spinner.success("Concluido")
  end

  task add_mining_types: :environment do
    spinner = TTY::Spinner.new("[:spinner] Cadastrando tipos de mineração ...")
    spinner.auto_spin

    types = [
      {description: "Proof of Work", acronym: "PoW"},
      {description: "Proof of Stake", acronym: "PoS"},
      {description: "Proof of Capacity", acronym: "PoC"}
    ]

    types.each do |type|
      MiningType.find_or_create_by!(type)
    end
    spinner.success("Concluido")
  end


  def show_spinner(msg_start,msg_end = "Concluido")

    spinner = TTY::Spinner.new("[:spinner] #{msg_start} ...")
    spinner.auto_spin
    yield
    spinner.success("#{msg_end}")
  end

end