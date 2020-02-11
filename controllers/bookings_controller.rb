require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/booking')
require_relative('../models/member')
require_relative('../models/session')
also_reload( '../models/*' )


get "/bookings" do
  @bookings = Booking.all()
  erb( :"bookings/index" )
end

get "/bookings/new" do
  @members = Member.all()
  @sessions = Session.all()
  erb(:"bookings/new")
end

post "/bookings" do
  new_booking = Booking.new(params).save()
  redirect to '/bookings'
end

get "/bookings/:id" do
  @booking = Booking.find(params['id'])
  erb(:"/bookings/show")
end

get "/bookings/:id/edit" do
  @booking = Booking.find(params['id'])\erb(:"bookings/edit")
end
