class AddGreeterToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :greeter, :boolean
  end
end
