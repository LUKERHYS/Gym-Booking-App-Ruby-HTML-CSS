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
