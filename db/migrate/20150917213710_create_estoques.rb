class CreateEstoques < ActiveRecord::Migration
  def change
    create_table :estoques do |t|
      t.references :livro, index: true, foreign_key: true
      t.integer :reservdos
      t.integer :locados

      t.timestamps null: false
    end
  end
end
