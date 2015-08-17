class InstituicaosDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: Instituicao.count,
        iTotalDisplayRecords: instituicaos.total_entries,
        aaData: data
    }
  end

  private

  def data
    instituicaos.map do |instituicao|
      [
          instituicao.id,
          instituicao.nome_local,
          instituicao.endereco_local,
          instituicao.responsavel_local,
          instituicao.created_at.strftime("%B %e, %Y"),
          instituicao.updated_at.strftime("%B %e, %Y")
      ]
    end
  end

  def instituicaos
    @instituicaos ||= fetch_instituicaos
  end

  def fetch_instituicaos
    instituicaos = Instituicao.order("#{sort_column} #{sort_direction}")
    instituicaos = instituicaos.page(page).per_page(per_page)
    if params[:sSearch].present?
      instituicaos = instituicaos.where("nome_local like :search", search: "%#{params[:sSearch]}%")
    end
    instituicaos
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[id nome_local]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end