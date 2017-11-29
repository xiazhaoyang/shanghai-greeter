class CreateUsersExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :users_experiences do |t|
      t.integer :experience_id
      t.integer :user_id
    end

    add_index :users_experiences, :experience_id
    add_index :users_experiences, :user_id
  end
end
