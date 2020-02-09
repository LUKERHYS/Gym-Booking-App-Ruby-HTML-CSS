require_relative('../db/sql_runner')

class Booking
  attr_reader :id, :member_id, :session_id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @member_id = options['member_id'].to_i()
    @session_id = options['session_id'].to_i()
end

  def save()
    sql = "INSERT INTO bookings WHERE (
    member_id, session_id
    ) VALUES (
      $1, $2
      ) RETURNING id"
    values = [@member_id, @session_id]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM bookings"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM bookings"
    SqlRunner.run(sql)
  end

end
