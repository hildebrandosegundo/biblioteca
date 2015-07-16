class CreateLocacaos < ActiveRecord::Migration
  def change
    create_table :locacaos do |t|
      t.references :livro, index: true, foreign_key: true
      t.references :pessoa, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
