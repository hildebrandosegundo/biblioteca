class PessoasDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: Pessoa.count,
        iTotalDisplayRecords: pessoas.total_entries,
        aaData: data
    }
  end

  private

  def data
    pessoas.map do |pessoa|
      [
          pessoa.id,
          pessoa.matricula,
          pessoa.cpf,
          pessoa.nome,
          pessoa.status,
          pessoa.created_at.strftime("%B %e, %Y"),
          pessoa.updated_at.strftime("%B %e, %Y")
      ]
    end
  end

  def pessoas
    @pessoas ||= fetch_pessoas
  end

  def fetch_pessoas
    pessoas = Pessoa.order("#{sort_column} #{sort_direction}")
    pessoas = pessoas.page(page).per_page(per_page)
    if params[:sSearch].present?
      pessoas = pessoas.where("nome like :search or cpf like :search or matricula like :search", search: "%#{params[:sSearch]}%")
    end
    pessoas
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[id matricula cpf nome]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end