class AddEnabledToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :enabled, :boolean
  end
end
