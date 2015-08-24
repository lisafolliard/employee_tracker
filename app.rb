require('sinatra/activerecord')
require './lib/division.rb'
require './lib/employee.rb'
require 'sinatra/reloader'
require 'sinatra'
also_reload '../lib/**/*.rb'
require 'pg'
require 'pry'

get('/') do
  @divisions=Division.all()
  erb(:index)
end

post('/') do
  name= params.fetch("name")
  Division.create({:name => name})
  @divisions=Division.all()
  erb(:index)
end

get('/division/:id') do
  @division = Division.find(params.fetch("id").to_i())
  erb(:division)
end

patch('/division/:id/update') do
  @division = Division.find(params.fetch("id").to_i())
  new_name = params.fetch("update_division")
  @division.update({:name => new_name})
  @divisions = Division.all()
  redirect("/division/#{@division.id()}")
end

delete('/division/:id/delete') do
  @divisions = Division.all()
  @division = Division.find(params.fetch("id").to_i())
  @divisions.delete(@division)
  erb(:index)
end

post('/employees') do
  employee = params.fetch('name')
  division_id = params.fetch('division_id').to_i()
  @division = Division.find(division_id)
  Employee.create({:name => employee, :division_id => division_id})
  erb(:division)
end

get('/employee/:id') do
  @employee = Employee.find(params.fetch("id").to_i())
  erb(:employee)
end

#Still not clear about how this works in entirety

delete('/employee/:id/delete') do
  @employee = Employee.find(params.fetch('id').to_i())
  @division_id = @employee.division.id.to_i
  @division = Division.find(@division_id)
  @employee.delete
  erb(:division)
end
