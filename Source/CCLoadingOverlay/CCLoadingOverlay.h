//
//  LoadingOverlay.h
//  Empous
//
//  Created by Ryan Personal on 3/10/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"

/**
 An subclass of CCLayer that cover the screen, shows a UIActivityIndicatorView, and displays a message to the user. 
 Remove the overlay by removing it from the scene it's a child of.
 */
@interface CCLoadingOverlay : CCLayer

/**
 Default node method. The message shown under the UIActivityIndicatorView will be "Loading"
 */
+(id)nodeWithFont:(NSString*)fontName;

/**
 Optional node method that allows the programmer to set the message.
 */
+(id)nodeWithMessage:(NSString*)spinnerMessage withFont:(NSString*)fontName;

@end
