describe(Division) do

  describe("#employees") do
    it('tells which employees belong to which division') do
      new_division = Division.create({:name => "HR"})
      new_employee1 = Employee.create({:name => 'Tom', :division_id => new_division.id})
      new_employee2 = Employee.create({:name => 'Bill', :division_id => new_division.id})
      expect(new_division.employees()).to(eq([new_employee1, new_employee2]))
    end
  end  
end
