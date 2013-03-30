//
//  CCButton.m
//  Empous
//
//  Created by Ryan Hurley on 3/26/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "CCButton.h"

@implementation CCButton

@synthesize target = _target;
@synthesize selector = _selector;
@synthesize spriteFile = _spriteFile;
@synthesize pressedSpriteFile = _pressedSpriteFile;
@synthesize touchRectScale = _touchRectScale;

#pragma mark - Node methods for use with cocos2d


+(id)spriteWithFile:(NSString *)filename withPressedFile:(NSString*)pressedFilename target:(id)object method:(SEL)callback
{
    return [[[self alloc]initWithWithFile:filename withPressedFile:pressedFilename touchAreaScale:1.0 target:object method:callback] autorelease];
}


+(id)spriteWithFile:(NSString *)filename withPressedFile:(NSString*)pressedFilename touchAreaScale:(float)scale target:(id)object method:(SEL)callback;
{
    return [[[self alloc]initWithWithFile:filename withPressedFile:pressedFilename touchAreaScale:scale target:object method:callback] autorelease];
}

-(id)initWithWithFile:(NSString *)filename withPressedFile:(NSString*)pressedFilename touchAreaScale:(float)scale target:(id)object method:(SEL)callback
{
    //Use the parent constructor but store the strings for later use
    self = [super initWithFile:filename];
    if(self)
    {
        self.target = object;
        self.selector = callback;
        self.spriteFile = filename;
        self.pressedSpriteFile = pressedFilename;
        self.touchRectScale = scale;
    }
    return self;
}

-(void)dealloc
{
    [_spriteFile release];
    [_pressedSpriteFile release];
    [super dealloc];
}

#pragma mark - Register/Deregister with Touch Dispatcher

- (void) onEnter
{
    [super onEnter];
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
}

- (void) onExit
{
    [[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
    [super onExit];
}

#pragma mark - Touch Methods

//Checks if touch is within an extended touch area
- (BOOL)containsTouchLocation:(UITouch *)touch
{
    //Translate into COCOA coordinates
    CGPoint touchLocation = [self.parent convertTouchToNodeSpace:touch];
    
    //Get the size of the sprite then create a new rect scaled appropriately (skip the scaling if set to 1.0)
    CGRect spriteArea = self.boundingBox;
    if (self.touchRectScale != 1.0)
    {
        float newWidth = spriteArea.size.width * self.touchRectScale;
        float newHeight = spriteArea.size.height * self.touchRectScale;
        
        float differenceInWidth = newWidth - spriteArea.size.width;
        float differenceInHeight = newHeight - spriteArea.size.height;
        
        spriteArea = CGRectMake(spriteArea.origin.x - (0.5 * differenceInWidth),
                              spriteArea.origin.y - (0.5 * differenceInHeight),
                              spriteArea.size.width * self.touchRectScale,
                              spriteArea.size.height * self.touchRectScale);
    }
    
    return CGRectContainsPoint(spriteArea, touchLocation);
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    BOOL isSpriteTouched = [self containsTouchLocation:touch];
    if(isSpriteTouched)
    {
        [self setTexture:[[CCTextureCache sharedTextureCache] addImage:self.pressedSpriteFile]];
    }
    return isSpriteTouched;
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
    //Always reset the sprite image
    [self setTexture:[[CCTextureCache sharedTextureCache] addImage:self.spriteFile]];
    
    //If the touch didn't end in the sprite, return
    if(![self containsTouchLocation:touch])
        return;
    [self.target performSelector:self.selector withObject:self];
}

@end
