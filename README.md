# A-trace-map-generator
A trace map generator for an alternative to convolutional neural networks.


FPC Lazarus

The first input line is an angle of 0-45 degrees.
The second is the width, the third is the height.


The column and line headings are now filled in.
Works now at any size.
For a given range of angles, it is read from the lower left cell, columns and rows are numbered, each contains the coordinates of the following, 1 after the coordinates means the end of the line, 0 - the line continues.
What remains is the change of pointers to the variables x,y from the angle of 45 to 90 degrees and "mirroring" for the angles of the range of 90-180 degrees.
The final touches were reduced to the calculation of a field smaller in height than in width. The reverse was debugged a little earlier, I actually copied the formula to another part of the code and slightly corrected it.
I comment on the lines of filling in the table and the calculation by this engine of the trace generator for a field of 10,000 by 10,000 (100,000,000 cells) on a Ryzen 7 5800H processor is 0.1 seconds.
For a cell of this field (this is a life hack, of course, but how could it be without it, but ... everything is honest - no fraud) the time is 1e-9 seconds.
FPC programming language Lazarus.
Linux runtime.


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


It seems that the formula has been completed. Next is an automated test.

Works for maps no smaller than 3 pixels in y-axis.

04.06.2023

Made to 0-90

