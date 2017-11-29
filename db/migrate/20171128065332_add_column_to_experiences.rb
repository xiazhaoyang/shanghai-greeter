class AddColumnToExperiences < ActiveRecord::Migration[5.1]
  def change
    add_column :experiences, :name, :string
    add_column :experiences, :description, :text
  end
end
