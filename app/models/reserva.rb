class Reserva < ActiveRecord::Base
  belongs_to :pessoas
  belongs_to :livros
end
