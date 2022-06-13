class AddStatustoPassengers < ActiveRecord::Migration[5.2]
  def change
    add_column :passengers, :status, :integer, default: 0
  end
end
