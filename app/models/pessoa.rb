class Pessoa < ActiveRecord::Base
  belongs_to :instituicao
  belongs_to :locacao
  belongs_to :reserva
  belongs_to :user
end
