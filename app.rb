require('sinatra')
require('sinatra/reloader')
require('./lib/volunteer')
require('./lib/project')
require('pry')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "volunteer_tracker"})


get('/') do
  @projects = Project.all
  erb(:projects)
end

get('/projects') do
  @projects = Project.all 
  erb(:projects)
end

get('/projects/new') do
  erb(:new_project) 
end

get('/projects/:id') do
  @project = Project.find(params[:id].to_i()) 
  erb(:project)
end

get('/projects/:id/edit') do
  @project = Project.find(params[:id].to_i()) 
  erb(:edit_project)
end

post('/projects') do
  title = params[:project_title]
  project = Project.new({:title => title,:id => nil})
  project.save()
  @projects = Project.all()
  redirect to('/projects')
end

patch('/projects/:id') do
  @project = Project.find(params[:id].to_i()) 
  @project.update(params[:title])
  @projects = Project.all
  redirect to('/projects')
end

delete('/projects/:id') do
  @project = Project.find(params[:id].to_i()) 
  @project.delete()
  @projects = Project.all
  redirect to('/projects')
end

get('/results') do
  erb(:project_results)
end

post('/results') do
  name = params[:search]
  @projects = Project.search(name)
  erb(:project_results)
end

get('/projects/:id/volunteers/:volunteer_id') do
  @volunteer = Volunteer.find(params[:volunteer_id].to_i())
  erb(:volunteer)
end

post('/projects/:id/volunteers') do
  @project = Project.find(params[:id].to_i())
  name = params[:volunteer_name]
  project_id = @project.id
  volunteer = Volunteer.new({:name => name, :project_id => project_id, :id => nil})
  volunteer.save()
  erb(:project)
end

patch('/projects/:id/volunteers/:volunteer_id') do
  @project = Project.find(params[:id].to_i())
  volunteer = Volunteer.find(params[:volunteer_id].to_i())
  volunteer.update(params[:name], @project.id)
  erb(:project)
end

delete('/projects/:id/volunteers/:volunteer_id') do
  volunteer = Volunteer.find(params[:volunteer_id].to_i())
  volunteer.delete
  @project = Project.find(params[:id].to_i())
  erb(:project)
end

get('/results/volunteers') do
  erb(:volunteer_results)
end

post('/results/volunteers') do
  name = params[:search]
  @volunteers = Volunteer.search(name)
  erb(:volunteer_results)
end