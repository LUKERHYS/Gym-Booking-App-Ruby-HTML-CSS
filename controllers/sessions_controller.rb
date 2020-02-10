require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/booking')
require_relative('../models/member')
require_relative('../models/session')
also_reload( './models/*' )

get "/sessions" do
  @sessions = Session.all()
  erb(:"sessions/index")
end

get "/sessions/new" do
  erb(:"sessions/new")
end

post "/sessions" do
  @session = Session.new(params).save()
  redirect "/sessions"
end

get "/sessions/:id" do
  @session = Session.find(params[:id])
  erb(:"/sessions/show")
end

get "/sessions/:id/edit" do
  @session = Session.find(params[:id])
  erb(:"/sessions/edit")
end

post "/sessions/:id" do
  session = Session.new(params)
  session.update()
  redirect to "/sessions"
end

post "/sessions/:id/delete" do
  session = Session.find(params['id'])
  session.delete()
  redirect to "/sessions"
end
