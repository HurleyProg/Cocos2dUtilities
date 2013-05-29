Cocos2dUtilities
================

Contains utility class for use with Cocos2d applications. 
These classes were developed by HurleyProg. 
Feel free to use and modify the class to fit your needs.

Classes
----------------
All classes are in the 'Source' folder with documentation in the 'Documentation' folder. 
Documentation is in Doxygen format and outputed to HTML.
You can find a brief description of the classes below.

### [CCButton](https://github.com/HurleyProg/Cocos2dUtilities/tree/master/Source/CCButton)
This is a subclass of CCSprite which is to be used when a button is desired. 
You can specify both a pressed and unpressed image. 
These images will be changed automatically as the user interacts with the button.

CCButton also requires a selector and object to act as a callback.
The supplied selector is called on the object when the button is pressed.

Optionally, the CCButton touch area can be scaled larger (or smaller) than the supplied images. 
This is very useful when you want to increase the touch area of small images to make UX better.

### [CCLoadingOverlay](https://github.com/HurleyProg/Cocos2dUtilities/tree/master/Source/CCLoadingOverlay)
This is a subclass of CCLayer and is used when there are expensive calculations occurring that must happen syncronously.
You must specify a font to use and can optionally specify a message to display. The default message is "Loading".

![A picture of CCLoadingOverlay](https://raw.github.com/HurleyProg/Cocos2dUtilities/master/Source/Doxygen%20Static%20Pages/CCLoadingOverlay.png "CCloadingOverlay example")

###[CCFadableLayer](https://github.com/HurleyProg/Cocos2dUtilities/tree/master/Source/CCFadableLayer)
This is a subclass of CCLayer that implements the CCRGBAProtocol, and allows you to pass the layer to a Fading animation.
This will only work if all the children of the layer also obey the CCRGBAProtocol.

###[CCTextFieldCentererScene](https://github.com/HurleyProg/Cocos2dUtilities/tree/master/Source/CCTextFieldCentererScene)
This is a subclass of CCScene and is used to center to screen on any active UITextField that is a delegate of this class.
You can either use this class directly as a scene or subclass it inorder to do more impressive interactions with UITextFields.
For more information about this class see my [blog](http://www.hurleyprog.com/empous/using-and-centering-uitextfields-in-cocos2d/).
