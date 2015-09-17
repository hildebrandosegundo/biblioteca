class CreateReservas < ActiveRecord::Migration
  def change
    create_table :reservas do |t|
      t.references :pessoas, index: true, foreign_key: true
      t.references :livros, index: true, foreign_key: true
      t.string :status
      t.date :data

      t.timestamps null: false
    end
  end
end
