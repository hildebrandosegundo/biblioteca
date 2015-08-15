class AuthorsDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: Author.count,
        iTotalDisplayRecords: authors.total_entries,
        aaData: data
    }
  end

  private

  def data
    authors.map do |author|
      [
          author.id,
          author.nome_author,
          author.created_at.strftime("%B %e, %Y"),
          author.updated_at.strftime("%B %e, %Y")
      ]
    end
  end

  def authors
    @authors ||= fetch_authors
  end

  def fetch_authors
    authors = Author.order("#{sort_column} #{sort_direction}")
    authors = authors.page(page).per_page(per_page)
    if params[:sSearch].present?
      authors = authors.where("nome_author like :search", search: "%#{params[:sSearch]}%")
    end
    authors
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[id nome_author released_on price]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end