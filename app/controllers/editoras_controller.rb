class EditorasController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: EditorasDatatable.new(view_context) }
      end
  end
  def show
    @editoras = Editora.find(params[:id])
  end
  def new
    @editoras = Editora.new
  end
  def create
    @editoras = Editora.new(editora_params)
    respond_to do |format|
      if @editoras.save
        #format.html { redirect_to @editoras, notice: 'Post was successfully created.' }
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
  def set_editoras
    @editoras = Editora.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def editora_params
    params.permit(:nome_editora)
  end
end
