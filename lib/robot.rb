class Robot
  COMMANDS = ["MOVE", "LEFT", "RIGHT", "REPORT"]
  
  def self.command
    print "Write your command\n"
    input = gets.strip
    if self.validates_input?(input)
      self.execute_command(input)
    else
      abort("Invalid Input")
    end
  end
  
  protected
  def self.execute_command(command)
    if /PLACE,[0-9],[0-9],(NORTH|EAST|WEST|SOUTH)/.match(command)
      @x = command.split(',')[1]
      @y = command.split(',')[2]
      @f = command.split(',')[3]
      self.command
    end
  end

  def self.validates_input?(command)
    COMMANDS.include?(command) ||  (/PLACE,[0-9],[0-9],(NORTH|EAST|WEST|SOUTH)/.match(command))
  end 

  def set_output(command)
    print command
  end
end