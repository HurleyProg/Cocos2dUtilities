//
//  CCButton.m
//  Empous
//
//  Created by Ryan Hurley on 3/26/13.
//  Copyright (c) 2013 HurleyProg. All rights reserved.
//

#import "CCButton.h"

@implementation CCButton
{
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
    
    /**
     Tells the button whether it's enabled or not
     */
    BOOL _enabled;
    
    /**
     Priority to be used with the touch dispatcher
     */
    int _priority;
    
}

@synthesize target = _target;
@synthesize selector = _selector;

#pragma mark - Node methods for use with cocos2d


+(id)spriteWithFile:(NSString *)filename withPressedFile:(NSString*)pressedFilename target:(id)object function:(SEL)callback
{
    return [[[self alloc]initWithWithFile:filename withPressedFile:pressedFilename touchAreaScale:1.0 priority:0 target:object method:callback] autorelease];
}


+(id)spriteWithFile:(NSString *)filename withPressedFile:(NSString*)pressedFilename touchAreaScale:(float)scale target:(id)object function:(SEL)callback;
{
    return [[[self alloc]initWithWithFile:filename withPressedFile:pressedFilename touchAreaScale:scale priority:0 target:object method:callback] autorelease];
}

+(id)spriteWithFile:(NSString *)filename withPressedFile:(NSString*)pressedFilename touchAreaScale:(float)scale priority:(int)priority target:(id)object function:(SEL)callback;
{
    return [[[self alloc]initWithWithFile:filename withPressedFile:pressedFilename touchAreaScale:scale priority:priority target:object method:callback] autorelease];
}

-(id)initWithWithFile:(NSString *)filename withPressedFile:(NSString*)pressedFilename touchAreaScale:(float)scale priority:(int)priority target:(id)object method:(SEL)callback
{
    self = [super initWithFile:filename];
    if(self)
    {
        _target = object;
        _selector = callback;
        _spriteFile = [filename copy];
        _pressedSpriteFile = [pressedFilename copy];
        _touchRectScale = scale;
        _enabled = YES;
        _priority = priority;
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
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:_priority swallowsTouches:YES];
}

- (void) onExit
{
    [[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
    [super onExit];
}

-(void)disable
{
    if(_enabled == true)
    {
        [[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
        [self setColor:ccc3(102, 102, 102)];
        _enabled = NO;
    }
}

-(void)enable
{
    if(_enabled == false)
    {
        [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:_priority swallowsTouches:YES];
        [self setColor:ccc3(255,255,255)];
        _enabled = YES;
    }
}

#pragma mark - Touch Methods

- (BOOL)containsTouchLocation:(UITouch *)touch
{
    //Translate into COCOA coordinates - Assumes that the parent is a layer and spans the whole screen (Untested with further nesting)
    CGPoint touchLocation = [self.parent convertTouchToNodeSpace:touch];
    
    //Only scale the boundingBox when touchRectScale not set to 1.0
    CGRect spriteArea = self.boundingBox;
    if (_touchRectScale != 1.0)
    {
        float newWidth = spriteArea.size.width * _touchRectScale;
        float newHeight = spriteArea.size.height * _touchRectScale;
        
        float differenceInWidth = newWidth - spriteArea.size.width;
        float differenceInHeight = newHeight - spriteArea.size.height;
        
        spriteArea = CGRectMake(spriteArea.origin.x - (0.5 * differenceInWidth),
                              spriteArea.origin.y - (0.5 * differenceInHeight),
                              spriteArea.size.width * _touchRectScale,
                              spriteArea.size.height * _touchRectScale);
    }
    
    return CGRectContainsPoint(spriteArea, touchLocation);
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    BOOL isSpriteTouched = [self containsTouchLocation:touch];
    if(isSpriteTouched)
    {
        [self setTexture:[[CCTextureCache sharedTextureCache] addImage:_pressedSpriteFile]];
    }
    return isSpriteTouched;
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
    //Always reset the sprite image
    [self setTexture:[[CCTextureCache sharedTextureCache] addImage:_spriteFile]];
    
    if(![self containsTouchLocation:touch])
        return;
    [self.target performSelector:self.selector withObject:self];
}



@end
