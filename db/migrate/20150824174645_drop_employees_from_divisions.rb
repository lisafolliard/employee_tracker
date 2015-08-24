class DropEmployeesFromDivisions < ActiveRecord::Migration
  def change
    remove_column(:divisions, :employees, :string)
  end
end
