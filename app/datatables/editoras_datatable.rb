class EditorasDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: Editora.count,
        iTotalDisplayRecords: editoras.total_entries,
        aaData: data
    }
  end

  private

  def data
    editoras.map do |editora|
      [
          editora.id,
          editora.nome_editora,
          editora.created_at.strftime("%B %e, %Y"),
          editora.updated_at.strftime("%B %e, %Y")
      ]
    end
  end

  def editoras
    @editoras ||= fetch_editoras
  end

  def fetch_editoras
    editoras = Editora.order("#{sort_column} #{sort_direction}")
    editoras = editoras.page(page).per_page(per_page)
    if params[:sSearch].present?
      editoras = editoras.where("nome_editora like :search", search: "%#{params[:sSearch]}%")
    end
    editoras
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[id nome_editora released_on price]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end