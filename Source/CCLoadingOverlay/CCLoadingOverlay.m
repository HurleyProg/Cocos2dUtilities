//
//  LoadingOverlay.m
//  Empous
//
//  Created by Ryan Personal on 3/10/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "CCLoadingOverlay.h"

@implementation CCLoadingOverlay
{
    /**
     A black layer (that is slightly transparent) which covers the screen
     */
    CCLayerColor* overlay;
    
    /**
     An apple UI spinner to show loading
     */
    UIActivityIndicatorView* spinner;
    
    /**
     The message to show on the screen
     */
    CCLabelTTF* message;
}

+(id)nodeWithFont:(NSString*)fontName;
{
    return [[[self alloc]initWithMessage:@"Loading" withFont:fontName]autorelease];
}

+(id)nodeWithMessage:(NSString*)spinnerMessage withFont:(NSString *)fontName
{
    return [[[self alloc]initWithMessage:spinnerMessage withFont:fontName]autorelease];
}

-(id)initWithMessage:(NSString*)spinnerMessage withFont:(NSString*)fontName
{
    if ((self = [super init])){
        //Get screensize
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        CGPoint center = ccp(winSize.width/2,winSize.height/2);
        
        //Create overlay - black but not completely opaque
        overlay = [CCLayerColor layerWithColor:ccc4(0,0,0,180)];
        [overlay changeHeight:winSize.height];
        [overlay changeWidth:winSize.width];
        [self addChild:overlay];
        
        //Set the message
        message = [CCLabelTTF labelWithString:spinnerMessage fontName:fontName fontSize:20];
        message.position = ccp(center.x, center.y - 30);
        [self addChild:message];
        
        //Create an indicator view
        spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        spinner.center = center;
        [[[CCDirector sharedDirector] openGLView] addSubview:spinner];
        
        [spinner startAnimating];
    }
    return self;
}

-(void)dealloc 
{
    [spinner stopAnimating];
    [spinner removeFromSuperview];
    [self removeChild:overlay cleanup:YES];
    [super dealloc];
}

@end
