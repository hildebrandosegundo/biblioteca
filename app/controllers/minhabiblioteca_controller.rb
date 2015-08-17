class MinhabibliotecaController < ApplicationController
  def index
    @livros = Livro.joins(:editora, :author)
  end
end
