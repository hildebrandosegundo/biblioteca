class InstituicaosController < ApplicationController
  def index
    @instuicaos = Instituicao.all
  end

  def show

  end

  def new
    @instuicaos = Instituicao.new
  end

  def create
    @instuicaos = Instituicao.new(instituicao_params)
    respond_to do |format|
      if @instuicaos.save
        #format.html { redirect_to @instuicaos, notice: 'Post was successfully created.' }
        data = {:message => "Cadastro realizado com sucesso!"}
        format.json { render :json => data, :status => :ok }
      else
        #format.html { render :new }
        format.json { render :json => "erro ao cadastrar!" }
      end
    end
  end

  private
# Use callbacks to share common setup or constraints between actions.
  def set_instituicao
    @instuicaos = Instituicao.find(params[:id])
  end

# Never trust parameters from the scary internet, only allow the white list through.
  def instituicao_params
    params.permit(:nome, :endereco, :responsavel)
  end
end
