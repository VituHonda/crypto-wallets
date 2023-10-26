class WelcomeController < ApplicationController
  def index
    cookies[:alou] = "Oi eu sou um cookie"
    @teste =  "Olá estou testando, sou uma variável de instância do controller welcome"
    @nome = params[:nome]
  end
end
