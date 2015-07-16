class Locacao < ActiveRecord::Base
  belongs_to :livro
  belongs_to :pessoa
end
