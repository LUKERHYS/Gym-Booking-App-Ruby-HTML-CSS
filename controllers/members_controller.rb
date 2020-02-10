require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/booking')
require_relative('../models/member')
require_relative('../models/session')
also_reload( './models/*' )

get "/members" do
  @members = Member.all()
  erb(:"members/index")
end

get "/members/:id" do
  @member = Member.find(params['id'])
  erb(:"members/show")
end
