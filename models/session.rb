require_relative('../db/sql_runner')

class Session
  attr_accessor :type, :trainer, :room
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @type = options['type']
    @trainer = options['trainer']
    @room = options['room'].to_i()
end

  def save()
    sql = "INSERT INTO sessions (
    type, trainer, room
    ) VALUES (
      $1, $2, $3
      ) RETURNING id"
    values = [@type, @trainer, @room]
    results = SqlRunner.run(sql, values)
    @id = results[0]['ids'].to_i()
  end

  def update()
    sql = "UPDATE sessions SET (
    type, trainer, room
    ) = (
      $1, $2, $3
    ) WHERE id = $4"
    values = [@type, @trainer, @room, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM sessions"
    sessions = SqlRunner.run(sql)
    result = sessions.map{|session| Session.new(session)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM sessions"
    SqlRunner.run(sql)
  end

end
