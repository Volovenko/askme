class AddIndexToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :index, :integer
  end
end
