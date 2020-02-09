require_relative('../models/booking')
require_relative('../models/member')
require_relative('../models/session')
require('pry-byebug')

Booking.delete_all()
Member.delete_all()
Session.delete_all()

member1 = Member.new({
  "first_name" => "Luke",
  "last_name" => "melvin",
  "goal" => "weight loss"
  })
member2 = Member.new({
  "first_name" => "Adam",
  "last_name" => "Reed",
  "goal" => "strength"
  })
member1.save()
member2.save()



binding.pry
nil
