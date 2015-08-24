require('sinatra/activerecord')
require './lib/division.rb'
require './lib/employee.rb'
require 'sinatra/reloader'
require 'sinatra'
also_reload '../lib/**/*.rb'
require 'pg'
require 'pry'

get('/') do
  erb(:index)
end
