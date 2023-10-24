namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando DB ... ") {%x(rails db:drop)}

      show_spinner("Criando DB ... ") {%x(rails db:create)}

      show_spinner("Migrando DB ... ") {%x(rails db:migrate)}

      show_spinner("Populando DB ... ") {%x(rails db:seed)}
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
  end




  def show_spinner(msg_start,msg_end = "Concluido")

    spinner = TTY::Spinner.new("[:spinner] #{msg_start} ...")
    spinner.auto_spin
    yield
    spinner.success("#{msg_end}")
  end

end

