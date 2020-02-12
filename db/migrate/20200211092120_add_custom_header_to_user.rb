class AddCustomHeaderToUser < ActiveRecord::Migration[6.0]
  def change
  	add_column :users, :custom_header, :string
  end
end
