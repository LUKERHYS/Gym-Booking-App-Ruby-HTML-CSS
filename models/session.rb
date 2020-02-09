require_relative('../db/sql_runner')

class Session
  attr_accessor :type, :trainer, :room
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @type = options['type']
    @trainer = options['trainer']
    @room = options['room']
end

  def save()
    sql = "INSERT INTO sessions WHERE (
    type, trainer, room
    ) VALUES (
      $1, $2, $3
      ) RETURNING id"
    values = [@type, @trainer, @room]
    results = SqlRunner.run(sql, values)
    @id = results[0]['ids'].to_i()
  end

  def self.delete_all
    sql = "DELETE FROM sessions"
    SqlRunner.run(sql)
  end

end
