//
//  CCButton.h
//  Empous
//
//  Created by Ryan Hurley on 3/26/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "CCSprite.h"
#import "cocos2d.h"

/**
 A subclass of CCSprite which adds itself to the touch dispatcher. When touched it will call specified selector on the supplied target. Can also increase/decrease the touchable area which is helpful when making small images into buttons. This class has only been tested in landscape mode.
 */
@interface CCButton : CCSprite <CCTargetedTouchDelegate>
{
    /**
     The selector to call when the button is pressed
     */
    SEL _selector;
    
    /**
     The object which the selector will be called on
     */
    id<NSObject> _target;
    
    /**
     The file to be used for the button
     */
    NSString* _spriteFile;
    
    /**
     The file to be used when the button is being pressed/touched
     */
    NSString* _pressedSpriteFile;
    
    /**
     The scale to use for the touch area. A value of '1.0' implies the touch area is equal to the button's bounding box.
     */
    float _touchRectScale;
}

@property (nonatomic, assign) id<NSObject> target;
@property (nonatomic) SEL selector;
@property (nonatomic, copy) NSString* spriteFile;
@property (nonatomic, copy) NSString* pressedSpriteFile;
@property (nonatomic, assign) float touchRectScale;

/**
 Initialzes the sprite and sets the sprite's touch area equal to the bounding box
 @param filename - The file to be used as the button's initial image.
 @param pressedFilename - The file to be used as the button's pressed image
 @param target - The object that the selector will be called on
 @param callback - The selector to be called on the target
 @returns returns an autoreleased object for use with cocos2d objects
 */
+(id)spriteWithFile:(NSString *)filename withPressedFile:(NSString*)pressedFilename target:(id)object function:(SEL)callback;

/**
 Initialzes the sprite but allows the user to scale the touch area based on the bounding box of the button.
 @param filename - The file to be used as the button's initial image.
 @param pressedFilename - The file to be used as the button's pressed image
 @param scale - Scales the touch area by the amount specified. A value of '1.0' makes the touch area the same size as the button bounding box.
 @param target - The object that the selector will be called on
 @param callback - The selector to be called on the target
 @returns returns an autoreleased object for use with cocos2d objects
 */
+(id)spriteWithFile:(NSString *)filename withPressedFile:(NSString*)pressedFilename touchAreaScale:(float)scale target:(id)object function:(SEL)callback;

@end
