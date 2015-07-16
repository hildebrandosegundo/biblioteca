class CreateInstituicaos < ActiveRecord::Migration
  def change
    create_table :instituicaos do |t|
      t.string :nome_local, limit: 80
      t.string :endereco_local, limit: 100
      t.string :responsavel_local, limit:80
      t.timestamps null: false
    end
  end
end
