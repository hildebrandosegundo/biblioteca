class AddStatusToLocacaos < ActiveRecord::Migration
  def change
    add_column :locacaos, :status, :string
  end
end
