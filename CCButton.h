//
//  CCButton.h
//  Empous
//
//  Created by Ryan Hurley on 3/26/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "CCSprite.h"
#import "cocos2d.h"

@interface CCButton : CCSprite <CCTargetedTouchDelegate>
{
    id<NSObject> _target;
    SEL _selector;
    NSString* _spriteFile;
    NSString* _pressedSpriteFile;
    float _touchRectScale;
}

@property (nonatomic, assign) id<NSObject> target;
@property (nonatomic) SEL selector;
@property (nonatomic, copy) NSString* spriteFile;
@property (nonatomic, copy) NSString* pressedSpriteFile;
@property (nonatomic, assign) float touchRectScale;

+(id)spriteWithFile:(NSString *)filename withPressedFile:(NSString*)pressedFilename target:(id)object method:(SEL)callback;
+(id)spriteWithFile:(NSString *)filename withPressedFile:(NSString*)pressedFilename touchAreaScale:(float)scale target:(id)object method:(SEL)callback;

@end
