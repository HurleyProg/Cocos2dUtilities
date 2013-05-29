//
//  CCFadableLayer.h
//  Empous
//
//  Created by Ryan Hurley on 5/28/13.
//  Copyright (c) 2013 HurleyProg. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"

/**
 A subclass of CCLayer where the setOpacity method has been changed so the entire layer
 and any of its children that support the CCRGBAProtocol can be faded.
 */
@interface CCFadableLayer : CCLayer <CCRGBAProtocol>

/**
 Initializes the layer and sets the opacity to 255.
 */
+(id)node;

/**
 This does nothing. Any color set here is ignored.
 If you want a layer with color see CCLayerColor
 */
-(void) setColor:(ccColor3B)color;

/**
 This will always return black.
 This method should not be used but is required by the protocol.
 If you want a layer with color see CCLayerColor.
 */
-(ccColor3B) color;

/**
 Returns the current opacity of the layer
 */
-(GLubyte) opacity;

/**
 Sets the opacity of the layer. In reality it is setting the opacity of all the children. The layer is always transparent.
 */
-(void) setOpacity: (GLubyte) opacity;

@end
