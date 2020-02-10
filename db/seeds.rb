require_relative('../models/booking')
require_relative('../models/member')
require_relative('../models/session')
require('pry')

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


session1 = Session.new({
  "type" => "strength",
  "trainer" => "John",
  "room" => 2
  })
session2 = Session.new({
  "type" => "weight loss",
  "trainer" => "Malcolm",
  "room" => 3
  })
  session1.save()
  session2.save()


booking1 = Booking.new({
  "member_id" => member1.id,
  "session_id" => session1.id,
  })
booking1.save()

binding.pry
nil
