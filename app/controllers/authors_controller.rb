class AuthorsController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: AuthorsDatatable.new(view_context) }
    end
  end
  def show
    @autors = Author.find(params[:id])

  end
  def new
    @autors = Author.new
    authorize @autors
  end
  def create
    @autors = Author.new(author_params)
    authorize @autors
    respond_to do |format|
      if @autors.save
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
  def set_authors
    @autors = Author.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def author_params
    params.permit(:nome_author)
  end
end
