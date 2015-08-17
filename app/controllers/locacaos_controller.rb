class LocacaosController < ApplicationController
  def index
    #@locacaos = Locacao.joins(:livro, :pessoa).where()
  end

  def new
    @locacaos = Locacao.new
  end

  def create
    @locacaos = Locacao.new(locacao_params)
    respond_to do |format|
      if @locacaos.save
        data = {:message => "Locação realizada com sucesso!"}
        format.json { render :json => data, :status => :ok }
      else
        format.json { render :json => "erro ao locar!" }
      end
    end
  end
  private
  def locacao_params
    params.permit(:livro_id, :pessoa_id)
  end
end