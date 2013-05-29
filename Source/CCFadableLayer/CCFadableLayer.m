//
//  CCFadableLayer.m
//  Empous
//
//  Created by Ryan Hurley on 5/28/13.
//  Copyright (c) 2013 HurleyProg. All rights reserved.
//

#import "CCFadableLayer.h"

@implementation CCFadableLayer
{
    /**
     The current opacity of the layer
     */
    GLubyte _opacity;
}

+(id)node
{
    return [[[self alloc]init]autorelease];
}

-(id)init
{
    self = [super init];
    if(self)
    {
        _opacity = 255;
    }
    return self;
}

-(void) setColor:(ccColor3B)color
{
    return;
}

-(ccColor3B) color
{
    return ccc3(0, 0, 0);
}

-(GLubyte)opacity
{
    return _opacity;
}

-(void) setOpacity: (GLubyte) opacity
{
    _opacity = opacity;
    
	for( CCNode *node in [self children] )
	{
		if( [node conformsToProtocol:@protocol( CCRGBAProtocol)] )
		{
			[(id<CCRGBAProtocol>) node setOpacity: opacity];
		}
	}
}

@end
