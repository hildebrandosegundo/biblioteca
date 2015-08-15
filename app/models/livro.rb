class Livro < ActiveRecord::Base
  belongs_to :author
  belongs_to :editora
end
