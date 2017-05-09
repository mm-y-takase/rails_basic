class Robot
	def initialize(name)
		@name = name
		@x = 0
		@y = 0
	end
	def move(x, y)
		@x += x; @y += y
	end

	def to_s
		"#{@name} : #{@x}, #{@y}"
	end
end

RobotMaster = Robot.new('robot_master')
RobotCopy = Robot.new('copy')
puts RobotMaster
RobotCopy.move(10, 20)
RobotMaster
puts RobotCopy

lead_test_1 = "hello"
lead_test_2 = lead_test_1
puts lead_test_1.object_id
puts lead_test_2.object_id

lead_test_1.upcase!
puts lead_test_1
puts lead_test_2

