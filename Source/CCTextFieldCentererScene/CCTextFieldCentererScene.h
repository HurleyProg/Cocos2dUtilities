//
//  CCTextFieldCentererScene.h
//  Empous
//
//  Created by Ryan Hurley on 5/29/13.
//  Copyright (c) 2013 HurleyProg. All rights reserved.
//

#import "CCScene.h"

/**
 A subclass of CCScene which implements the UITextFieldDelegate
 When any UITextField is touched, (assuming this class is assigned as the delegate)
 CCTextFieldCentererScene will automatically center the field above the keyboard.
 
 NOTE: Only tested in cocos2d applications that are always in landscape mode.
 */
@interface CCTextFieldCentererScene : CCScene <UITextFieldDelegate>

@end
