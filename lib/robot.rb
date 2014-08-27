class Robot
  COMMANDS = ["MOVE", "LEFT", "RIGHT", "REPORT"]
  
  def self.command(command = nil)
    print "Write your command\n"
    if gets.nil?
      input = gets.strip
    else
      input = command
    end
    
    if self.validates_input?(input)
      self.execute_command(input)
    else
      abort("Invalid Input")
    end
  end
  
  protected
  def self.execute_command(command)
    if /PLACE,[0-9],[0-9],(NORTH|EAST|WEST|SOUTH)/.match(command) && @x.nil? && @y.nil? && @f.nil?
      self.set_place(command)
    end
    if command == "MOVE"
      move_forward
      self.command
    end
    if command == "LEFT"
      self.move_left
      self.command
    end
    if command == "RIGHT"
      self.move_right
      self.command
    end
    if command == "REPORT"
      print "#{@x},#{@y},#{@f}\n"
      exit
    end
  end

  def self.set_place(command)
    if @x.nil? || @y.nil? || @f.nil?
      @x = command.split(',')[1].to_i
      @y = command.split(',')[2].to_i
      @f = command.split(',')[3]
    else
      print "You have set the place\n"
    end
    self.command
  end

  def self.move_left
    if @x.nil? || @y.nil? || @f.nil?
      self.place_alert
    else
      case @f
      when "NORTH"
        @f = "WEST"
      when "SOUTH"
        @f = "WEST"
      when "EAST"
        @f = "NORTH"
      when "WEST"
        @f = "SOUTH"
      end
    end
  end

  def self.move_right
    if @x.nil? || @y.nil? || @f.nil?
      self.place_alert
    else
      case @f
      when "NORTH"
        @f = "EAST"
      when "SOUTH"
        @f = "EAST"
      when "EAST"
        @f = "SOUTH"
      when "WEST"
        @f = "NORTH"
      end
    end
  end

  def self.move_forward
    if @x.nil? || @y.nil? || @f.nil?
      self.place_alert
    else
      case @f
      when "NORTH"
        @y = @y+1 unless @y >= 4
        @f = "NORTH"
      when "SOUTH"
        @y -= 1 unless @y <= 0
        @f = "SOUTH"
      when "EAST"
        @x += 1 unless @x >= 4
        @f = "EAST"
      when "WEST"
        @x -= 1 unless @x <= 0
        @f = "WEST"
      end
    end
  end

  def self.place_alert
    print "Please set the place first!\n"
    self.command
  end

  def self.validates_input?(command)
    COMMANDS.include?(command) ||  (/PLACE,[0-9],[0-9],(NORTH|EAST|WEST|SOUTH)/.match(command))
  end 
end