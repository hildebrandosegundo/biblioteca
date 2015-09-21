class MinhabibliotecaController < ApplicationController
  before_action :authenticate_user!
  def index
    @livros = Livro.new
  end
end
