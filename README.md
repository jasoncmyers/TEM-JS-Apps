# Tecnai TEM Web Scripts

This is a collection of application scripts for use with the FEI Tecnai family of
microscopes, written in the form of JavaScript functions in basic HTML pages.  

Many of these microscopes run on Windows 2000 machines, with upgrades to even XP being
prohibatively expensive.  Although the microscopes themselves provide a fairly rich API for
custom functionality, the lack of .NET framework, Java runtimes, and other similar amenities
makes GUI development needlessly time consuming.  To work around this, basic HTML functions
have been used to create UIs, and the functionality has been implemented using JavaScript and
ActiveX to interface with the microscope.  For the same reasons, thse pages must be viewable
in IE5.50, so many of these functions will not work at all or raise security alerts on modern
browsers.

## Applications: ##

 * BeamBlankAssign.html - a simple program that allows a beam blanker function to be assigned
 to one of the L/R shortcut buttons on the microscope interface
 * DarkField.html - this allows hollow-cone dark field imaging on microscopes that do not
 normally have this capability.  Because of the low bandwidth of the beam-shift coil
 drivers, which are not originally intended for scanning, relatively slow cone rotation
 rates are necessary to avoid problems with discontinuities between angles.
 