class AddColToExperiences < ActiveRecord::Migration[5.1]
  def change
    add_column :experiences, :expectation_one, :string
    add_column :experiences, :expectation_two, :string
    add_column :experiences, :expectation_three, :string
    add_column :experiences, :notice, :string

  end
end
