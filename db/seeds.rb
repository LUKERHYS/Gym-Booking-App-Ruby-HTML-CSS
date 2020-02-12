require_relative('../models/booking')
require_relative('../models/member')
require_relative('../models/session')
require('pry')

Booking.delete_all()
Member.delete_all()
Session.delete_all()

member1 = Member.new({
  "first_name" => "Luke",
  "last_name" => "Melvin",
  "goal" => "Weight loss"
  })
member2 = Member.new({
  "first_name" => "Adam",
  "last_name" => "Reed",
  "goal" => "Strength"
  })
member3 = Member.new({
  "first_name" => "Lyndsey",
  "last_name" => "Fraser",
  "goal" => "Cardio fitness"
  })
member4 = Member.new({
  "first_name" => "Hollie",
  "last_name" => "Davidson",
  "goal" => "strength"
  })
member1.save()
member2.save()
member3.save()
member4.save()


session1 = Session.new({
  "type" => "HIIT",
  "trainer" => "Mark",
  "room" => 1
  })
session2 = Session.new({
  "type" => "AB Blast",
  "trainer" => "Mathew",
  "room" => 2
  })
session3 = Session.new({
  "type" => "Free Weights",
  "trainer" => "Katie",
  "room" => 1
  })
session4 = Session.new({
  "type" => "PiYo",
  "trainer" => "Katie",
  "room" => 3
  })
  session1.save()
  session2.save()
  session3.save()
  session4.save()


booking1 = Booking.new({
  "member_id" => member1.id,
  "session_id" => session1.id,
  })
booking1.save()

binding.pry
nil
