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

end
