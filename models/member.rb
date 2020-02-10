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
    sql = "INSERT INTO members (
    first_name, last_name, goal
    ) VALUES (
      $1, $2, $3
      ) RETURNING id"
    values = [@first_name, @last_name, @goal]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i()
  end

  def update()
    sql = "UPDATE members SET (
    first_name, last_name, goal
    ) = (
      $1, $2, $3
      ) WHERE id = $4"
    values = [@first_name, @last_name, @goal, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM members
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM members WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values).first()
    member = Member.new(results)
    return member
  end

  def self.all()
    sql = "SELECT * FROM members"
    members = SqlRunner.run(sql)
    result = members.map{|member| Member.new(member)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM members"
    SqlRunner.run(sql)
  end
end
