class LivrosController < ApplicationController
  def index
  end

  def new
    @livros = Livro.new
  end
  def create
    @livros = Livro.new(livro_params)
    respond_to do |format|
      if @livros.save
        #format.html { redirect_to @pessoas, notice: 'Post was successfully created.' }
        data = {:message => "Cadastro realizado com sucesso!"}
        format.json{render :json => data, :status => :ok}
      else
        #format.html { render :new }
        format.json { render :json => "erro ao cadastrar!" }
      end
    end
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_livro
    @livros = Livro.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def livro_params
    params.permit(:titulo, :ano, :estante, :prateleira)
  end
end
