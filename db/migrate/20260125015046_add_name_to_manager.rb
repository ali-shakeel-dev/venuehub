class AddNameToManager < ActiveRecord::Migration[7.2]
  def change
    add_column :managers, :name, :string
  end
end
