require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/booking')
require_relative('../models/member')
require_relative('../models/session')
also_reload( '../models/*' )


get '/bookings' do
  @bookings = Booking.all()
  erb( :'/bookings/index' )
end
