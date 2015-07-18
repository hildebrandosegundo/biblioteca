class PessoasController < ApplicationController
  def index
    @pessoas = Pessoa.all
  end
  def show

  end
end