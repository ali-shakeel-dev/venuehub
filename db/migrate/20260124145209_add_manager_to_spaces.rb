class AddManagerToSpaces < ActiveRecord::Migration[7.2]
  def change
    add_reference :spaces, :manager, null: false, foreign_key: true
  end
end
