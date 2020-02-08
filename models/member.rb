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
