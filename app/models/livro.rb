class Livro < ActiveRecord::Base
  belongs_to :autor
  belongs_to :editora
end
