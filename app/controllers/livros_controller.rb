class LivrosController < ApplicationController
  before_action :set_livro, only: [:edit, :show, :update, :destroy]

  def index
    respond_to do |format|
      format.html
      format.json { render json: LivrosDatatable.new(view_context) }
    end
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
        format.json { render :json => data, :status => :ok }
      else
        #format.html { render :new }
        format.json { render :json => "erro ao cadastrar!" }
      end
    end
  end

  def edit
    respond_to do |format|
      data = {:titulo => @livros.titulo, :ano => @livros.ano, :estante => @livros.estante, :prateleira => @livros.prateleira}
      format.json { render :json => data, :status => :ok }
    end
  end

  def update
    respond_to do |format|
      if @livros.update_attributes(livro_params)
        data = {:message => "Alteração realizada com sucesso!"}
        format.json { render :json => data, :status => :ok }
      else
        format.json { render :json => "erro ao atualizar!" }
      end
    end
  end
  def destroy
    respond_to do |format|
      @livros.destroy
        data = {:message => "Exclusão realizada com sucesso!"}
        format.json { render :json => data, :status => :ok }
    end
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_livro
    @livros = Livro.find(params[:id])
  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def livro_params
    params.permit(:titulo, :ano, :estante, :prateleira, :editora_id, :author_id)
  end
end
