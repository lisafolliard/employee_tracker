require('spec_helper')

describe(Employee) do
  describe('#division') do
    it('determines what division employees belong to') do
      new_division = Division.create({:name => "HR"})
      test_employee = Employee.create({:name => 'Bill', :division_id => new_division.id})
      expect(test_employee.division()).to(eq(new_division))
    end
  end
end
