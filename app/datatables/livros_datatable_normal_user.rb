class LivrosDatatableNormalUser
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: Livro.count,
        iTotalDisplayRecords: livros.total_entries,
        aaData: data
    }
  end

  private

  def data
    livros.map do |livro|
      [
          livro.id,
          livro.titulo,
          livro.ano,
          livro.prateleira,
          livro.estante,
          livro.author.nome_author,
          livro.editora.nome_editora,
          '<button type="button" id="buttoninfolivro" class="btn btn-info glyphicon glyphicon-info-sign"></button>
                    <div class="btn-group" role="group" aria-label="...">
                      <button type="button" id="buttonalocuser" class="btn btn-success glyphicon glyphicon-user"></button>
                    </div>'
      ]
    end
  end

  def livros
    @livros ||= fetch_livros
  end

  def fetch_livros
    livros = Livro.joins(:editora, :author).order("#{sort_column} #{sort_direction}")
    livros = livros.page(page).per_page(per_page)
    if params[:sSearch].present?
      livros = livros.where("livros.titulo like :search or livros.ano like :search or livros.id like :search or livros.prateleira like :search or livros.estante like :search", search: "%#{params[:sSearch]}%")
    end
    livros
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[id titulo ano prateleira estante autor editora]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end