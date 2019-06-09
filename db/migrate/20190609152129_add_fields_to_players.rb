class AddFieldsToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :mcuuid, :string
    add_column :players, :admin, :boolean
    add_column :players, :name, :string
  end
end
