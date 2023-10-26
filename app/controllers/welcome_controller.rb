class WelcomeController < ApplicationController
  def index
    session[:hi] = "Oi eu sou uma session"
    cookies[:alou] = "Oi eu sou um cookie"
    @teste =  "Olá estou testando, sou uma variável de instância do controller welcome"
    @nome = params[:nome]
  end
end
