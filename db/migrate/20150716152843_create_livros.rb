class CreateLivros < ActiveRecord::Migration
  def change
    create_table :livros do |t|
      t.string :titulo
      t.string :ano
      t.string :estante
      t.string :prateleira
      t.references :autor, index: true, foreign_key: true
      t.references :editora, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
