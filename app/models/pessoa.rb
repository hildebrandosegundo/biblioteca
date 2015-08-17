class Pessoa < ActiveRecord::Base
  belongs_to :instituicao
  belongs_to :locacao
end
