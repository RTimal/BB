//
//  BBGameController.m
//  blah
//
//  Created by Rajiev Timal on 11/27/12.
//  Copyright (c) 2012 Bleep. All rights reserved.
//

#import "BBGameController.h"

@implementation BBGameController

@synthesize assetManager;
@synthesize eventHandler;
@synthesize collisionDetector;
@synthesize physics;

- (id)init {
    if (self = [super init]) {
        self.assetManager = [[BBAssetManager alloc] init];
        self.eventHandler = [[BBEventHandler alloc] init];
        self.collisionDetector = [[BBCollisionDetector alloc] init];
        self.physics = [[BBPhysics alloc] init];
    }
    return self;
}

-(void)updateWithDeltaTime:(NSNumber *)deltaTime {
    
    //iterate through events and update objects accordingly using opengl
    
}



@end
