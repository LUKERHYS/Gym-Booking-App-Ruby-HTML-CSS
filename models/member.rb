require_relative('../db/sql_runner')

class Member
  attr_accessor :first_name, :last_name, :goal
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @goal = options['goal']
end

  def save()
    sql = "INSERT INTO members WHERE (
    first_name, last_name, goal
    ) VALUES (
      $1, $2, $3
      ) RETURNING id"
    values = [@first_name, @last_name, @goal]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i()
  end


  def self.delete_all()
    sql = "DELETE FROM members"
    SqlRunner.run(sql)
  end
end
