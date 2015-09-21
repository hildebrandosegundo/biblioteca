class PessoasController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: PessoasDatatable.new(view_context) }
    end
  end
  def show

  end
  def new
    @pessoas = Pessoa.new
    authorize @pessoas
  end
  def create
    @pessoas = Pessoa.new(pessoa_params)
    authorize @pessoas
    respond_to do |format|
      if @pessoas.save
        #format.html { redirect_to @pessoas, notice: 'Post was successfully created.' }
        data = {:message => "Cadastro realizado com sucesso!"}
        format.json{render :json => data, :status => :ok}
      else
        #format.html { render :new }
        format.json { render :json => "erro ao cadastrar ou !" }
      end
    end
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_pessoa
    @pessoas = Pessoa.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def pessoa_params
    params.permit(:nome, :matricula, :cpf, :status, :instituicao_id)
  end

end
