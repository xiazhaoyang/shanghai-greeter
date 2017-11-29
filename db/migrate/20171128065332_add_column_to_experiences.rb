class AddColumnToExperiences < ActiveRecord::Migration[5.1]
  def change
    add_column :experiences, :name, :string
    add_column :experiences, :description, :text
    add_column :experiences, :expectation_one, :string
    add_column :experiences, :expectation_two, :string
    add_column :experiences, :expectation_three, :string
  end
end
