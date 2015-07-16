class CreateAutors < ActiveRecord::Migration
  def change
    create_table :autors do |t|
      t.string :nome_autor

      t.timestamps null: false
    end
  end
end
