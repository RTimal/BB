//
//  BBGameController.h
//  blah
//
//  Created by Rajiev Timal on 11/27/12.
//  Copyright (c) 2012 Bleep . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BBEventHandler.h"
#import "BBAssetManager.h"
#import "BBCollisionDetector.h"
#import "BBPhysics.h"

@interface BBGameController : NSObject

@property (nonatomic, retain) BBEventHandler *eventHandler;
@property (nonatomic, retain) BBAssetManager *assetManager;
@property (nonatomic, retain) BBCollisionDetector *collisionDetector;
@property (nonatomic, retain) BBPhysics *physics;
@property (nonatomic) float deltaTime;
@property (nonatomic) float lastTime;

- (void)updateWithDeltaTime:(NSNumber *)deltaTime;

@end
