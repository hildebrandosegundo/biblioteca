class PessoasController < ApplicationController
  def index
    @pessoas = Pessoa.all
  end
  def show

  end
  def new
    @pessoas = Pessoa.new
  end
  def create
    @pessoas = Pessoa.new(pessoa_params)
    respond_to do |format|
      if @pessoas.save
        #format.html { redirect_to @pessoas, notice: 'Post was successfully created.' }
        data = {:message => "Cadastro com sucesso!"}
        format.json{render :json => data, :status => :ok}
      else
        #format.html { render :new }
        format.json { render :json => "erro ao cadastrar!" }
      end
    end
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_pessoa
    @pessoas = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def pessoa_params
    params.permit(:nome, :matricula, :cpf, :login, :senha, :status)
  end

end