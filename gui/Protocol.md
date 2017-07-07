# GUI Protocol

## Summary

All GUI commands sent, in both directions, are five-byte ASCII encodings. This
serves two useful purposes. First, it makes the code easy to statically
allocate, you need space for 5 bytes, end of story. Second, it makes the code
easy to visually debug when running without the GUI.

There is an exception to this, in that the first byte sent by your code should
be the ASCII start of transmission code (value 2). This initializes the GUI and
tells it that it successfully ran your code.

## Configuration

When you run the gui it must have access to the resources directory to load
images from. Upgrading the graphics amounts to simply providing higher quality
versions of the provided images.

The actual execution requires 3 parameters. The first is the string to hard-type
onto the serial port to initialize your program. Since this will often require
newlines it is recommended to use the bash escaped string format. For example:
`$'load -h 10.15.167.5 \"ARM/user/program.elf\"\ngo\n'`. The second parameter is
the title of the GUI window. The final parameter is the port to use. This is
specified as a UNIX file, such as `/dev/ttyS0`. This allows you to test the UI
locally by attaching it to a pseudo-terminal such as `/dev/pts/3` (though this
requires knowledge of pseudo-terminals).

## Data Encoding

Commands to and from the UI use a special encoding of many variables. In general
they are as follows:

 - Sensors: A sensor is a two-byte argument. The first is a capital letter
   indicating the sensor's group (A, B, C, D, or E). The second is a hexadecimal
   encoding of which sensor of that group. This starts at 0 instead of 1.

 - Trains: Trains are encoded across two-bytes in unsigned hexadecimal notation.
   If the id of a train is not known, you may put two question marks instead, to
   indicate an unknown train.

 - Switches: Switches are simply encoded across two-bytes as an unsigned
   hexadecimal number.


## Commands to the UI

These are the commands that can be sent to the UI:

 - `s sensor train`: Indicate that train triggered sensor.
 - `S sensor train`: Indicate that train stopped triggering sensor.
 - `+ sensor train`: Indicate the presence of a new train on the specified
   sensor.
 - `-rm train`: Indicate that train was removed.
 - `n sensor train`: Indicate that train's next sensor is sensor.
 - `d sensor train`: Indicate that train's destination sensor is sensor.
 - `swc switch`: Indicate that switch is now curved.
 - `sws switch`: Indicate that switch is now straight.

## Commands from the UI

These are the commands that can be received from the UI:

 - `swc switch`: Curve switch.
 - `sws switch`: Straighten switch.

