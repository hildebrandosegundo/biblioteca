class Livro < ActiveRecord::Base
  belongs_to :author
  belongs_to :editora
  belongs_to :locacao
end
