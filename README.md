## Toy Robot Simulator
### Description:
- The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.
- There are no other obstructions on the table surface.
- The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement that would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed.

### Usage

    ruby -r  ./lib/robot.rb -e "Robot.command"

then type the command

### Allowed Commands
- `PLACE,X,Y,F` e.g: `PLACE,1,1,NORTH` (For placing the robot. X[integer], Y[integer], F[NORTH|EAST|WEST|SOUTH])
- `MOVE` (Move the robot forward)
- `LEFT` or `RIGHT` (Rotate the robot 90 degrees in the specified direction without changing the position of the robot.)
- `REPORT` (will announce the X,Y and F of the robot)

### Example
    ruby -r  ./lib/robot.rb -e "Robot.command"
    PLACE 1,2,EAST
    MOVE
    MOVE
    LEFT
    MOVE
    REPORT

The Output is

    3,3,NORTH

### TODO
Write the test