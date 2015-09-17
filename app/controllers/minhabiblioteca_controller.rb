class MinhabibliotecaController < ApplicationController
  before_action :authenticate_user!
  def index
    @livros = Livro.all
  end
end
