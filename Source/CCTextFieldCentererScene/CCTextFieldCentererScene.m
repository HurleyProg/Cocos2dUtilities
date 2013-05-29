//
//  CCTextFieldCentererScene.m
//  Empous
//
//  Created by Ryan Hurley on 5/29/13.
//  Copyright (c) 2013 HurleyProg. All rights reserved.
//

#import "CCTextFieldCentererScene.h"

@implementation CCTextFieldCentererScene

//This is 3/4 of the screen height on all current iPhones
const int SCREEN_HEIGHT = 320;
const double IDEAL_TEXT_FIELD_LOCATION = 3*SCREEN_HEIGHT/4;

/**
 The centering effect is accomplished by sliding the whole UIView up
*/
 - (void)textFieldDidBeginEditing:(UITextField *)textField
{
    //Get the y location of the center of the text field
    double centerYOfField = textField.frame.origin.y - (textField.frame.size.height/2);
    
    //Translate to cocos2d coordinates (0,0 is the top left of Apple coordinates).
    double centerYOfFieldCocos = SCREEN_HEIGHT - centerYOfField;
    
    //This is the distance we need to move the UIView
    double moveDistance = IDEAL_TEXT_FIELD_LOCATION - centerYOfFieldCocos;
    
    if(moveDistance > 0)
    {
        //Perform the move animation
        UIView* cocosView = [[CCDirector sharedDirector] openGLView];
        [UIView beginAnimations: @"anim" context: nil];
        [UIView setAnimationBeginsFromCurrentState: YES];
        [UIView setAnimationDuration: .2f];
        cocosView.frame = CGRectOffset(cocosView.frame, moveDistance, 0);
        [UIView commitAnimations];
    }
}

/**
 Slide the UIView back down to (0,0)
 */
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    UIView* cocosView = [[CCDirector sharedDirector] openGLView];
    
    //Get the current location of the UIView and determine how far off it is from the origin
    double moveDistance = 0 - cocosView.frame.origin.x;
    
    //Slide it back down
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: .2f];
    cocosView.frame = CGRectOffset(cocosView.frame, moveDistance, 0);
    [UIView commitAnimations];
}

/**
 Resigns the keyboard when the 'Done' key is pressed
 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
