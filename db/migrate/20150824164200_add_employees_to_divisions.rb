class AddEmployeesToDivisions < ActiveRecord::Migration
  def change
    add_column(:divisions, :employees, :string)
  end
end
