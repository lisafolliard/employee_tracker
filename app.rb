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
  new_division = Division.new({:name => name})
  new_division.save()
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

post('/employees') do
  employee = params.fetch('name')
  division_id = params.fetch('division_id').to_i()
  @division = Division.find(division_id)
  @employee = Employee.new({:name => employee, :division_id => division_id})
  @employee.save()
  erb(:division)
end
