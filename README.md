Cocos2dUtilities
================

Contains utility class for use with Cocos2d applications. 
These classes were developed by HurleyProg. 
Feel free to use and modify the class to fit your needs.

Classes
----------------
All classes are in Source folder with documentation in the -- Documentation folder. 
You can find a brief description of the classes below.

### CCButton
This is a subclass of CCSprite which is to be used when a button is desired. 
You can specify both a pressed and unpressed image. 
These images will be changed automatically as the user interacts with the button.

CCButton also requires a selector and object to act as a callback.
The supplied selector is called on the object when the button is pressed.

Optionally, the CCButton touch area can be scaled larger (or smaller) than the supplied images. 
This is very useful when you want to increase the touch area of small images to make UX better.
