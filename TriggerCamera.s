// ***********************
//  Camera acquisition triggering using the creation of a trigger file in an external application.
//  Written by Jason C. Myers
//  The original framework is based on a script written by Bernhard Schaffer and posted to Stack Overflow.
// ************************

void AcquireImage(number exposure, number binning) 
{
	number processing = 3
	image newImage
	
	try
	{
		Object camera = CM_GetCurrentCamera()
		Object params = CM_CreateAcquisitionParameters_FullCCD(camera, processing, exposure, binning, binning)
		newImage = CM_AcquireImage(camera, params)
		showimage(newImage);
	}
	catch
	{
		showalert("Could not interact with camera",2)
		exit(0)
	}
}

class WaitForExternal
{
    string triggerFilePath
    number taskID
    void WaitOnTrigger( object self )
    {
        if ( DoesFileExist( triggerFilePath ) )
        {
            DeleteFile( triggerFilePath )
            AcquireImage(0.5, 1)
        }
        else
        {
        }
    }

    object Init( object self, string triggerPath, number waitSec ) 
    { 
        triggerFilePath = triggerPath
        taskID = self.AddMainThreadPeriodicTask( "WaitOnTrigger", waitSec )
		Result("Camera trigger script started with task ID: " + taskID + "\n")
        return self
    }
}



// Main script
{
    string triggerPath = "C:\\Trigger.txt"
    number pollingWait = 0.01
    Alloc(WaitForExternal).Init( triggerPath, pollingWait )
    //TODO: does not currently clean up the task it creates.  This probably needs a non-blocking 
    // dialog with a "stop" button, but the documentation on how to create those is a little opagque.
}

