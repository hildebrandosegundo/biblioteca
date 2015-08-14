class MinhabibliotecaController < ApplicationController
  def index
    @livros = Livro.all
  end
end
