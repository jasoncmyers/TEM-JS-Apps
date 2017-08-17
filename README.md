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

 * `BeamBlankAssign.html` - a simple program that allows a beam blanker function to be assigned
 to one of the L/R shortcut buttons on the microscope interface
 * `DarkField.html` - this allows hollow-cone dark field imaging on microscopes that do not
 normally have this capability.  Because of the low bandwidth of the beam-shift coil
 drivers, which are not originally intended for scanning, relatively slow cone rotation
 rates are necessary to avoid problems with discontinuities between angles.
 * `ImageMontage.html` - takes a wide field-of-view series of images by moving the microscope stage
 a specified amount between exposures.  This is a bit klunky at present: the delays for stage
 movement, stage stabilization, and image collection must be manually set to match the instrument
 requirements in the script file. This also requires the `TriggerCamera.s` DigitalMicrograph plugin (see below).
 
 ## Digital Micrograph Camera Plugin: ##
 Applets that collect images must make use of a rather arcane method of triggering the external camera control. 
 Since the microscope software and scripting contains no direct method of accessing the camera, and the Digital
 Micrograph camera control system has no direct way of receiving messages, the file system is used as a work-around. 
 In order to use the camera, the `TriggerCamera.s` script file must be installed in DigitalMicrograph and run there
 first.  Because any applets that use this require access to the file system, Internet Explorer must be configured
 to allow this (low security settings). The user account must also have write access to the C drive, where a `Trigger.txt`
 file will be created when an image is to be collected.  The DM script will check for this file every 0.1 sec, and if
 found it will delete the file and begin image acquisition.
 