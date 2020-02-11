require_relative('../db/sql_runner')

class Booking
  attr_accessor :member_id, :session_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @member_id = options['member_id'].to_i()
    @session_id = options['session_id'].to_i()
end

  def save()
    sql = "INSERT INTO bookings (
    member_id, session_id
    ) VALUES (
      $1, $2
        ) RETURNING id"
    values = [@member_id, @session_id]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i()
  end

  def update()
    sql = "UPDATE bookings SET (
    member_id, session_id
    ) = (
      $1, $2
    ) WHERE id = $3"
    values = [@member_id, @session_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM bookings WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def member()
    sql = "SELECT * FROM members
    WHERE id = $1"
    values = [@member_id]
    results = SqlRunner.run(sql, values)
    return Member.new(results.first)
  end

  def session()
    sql = "SELECT * FROM sessions
    WHERE id = $1"
    values = [@session_id]
    results = SqlRunner.run(sql, values)
    return Session.new(results.first)
  end

  def self.find(id)
    sql = "SELECT * FROM bookings
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values).first()
    booking = Booking.new(results)
    return booking
  end

  def self.all()
    sql = "SELECT * FROM bookings"
    results = SqlRunner.run(sql)
    bookings = results.map{|result| Booking.new(result)}
    return bookings
  end

  def self.delete_all()
    sql = "DELETE FROM bookings"
    SqlRunner.run(sql)
  end

end
