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
@synthesize deltaTime;
@synthesize currentScene;
@synthesize glkVC;

- (id)initWithGLKViewController:(id)GLKViewController {
    
    if (self = [super init]) {
        self.assetManager = [[BBAssetManager alloc] init];
        self.eventHandler = [[BBEventHandler alloc] init];
        self.collisionDetector = [[BBCollisionDetector alloc] init];
        self.physics = [[BBPhysics alloc] init];
        self.glkVC = GLKViewController;
        self.currentScene = [[BBScene alloc] initWithGLKViewController:GLKViewController];
    }
    
    return self;
}

- (void)updateWithDeltaTime:(NSNumber *)deltaTime {
    
}

- (void)glkViewControllerUpdate:(GLKViewController *)controller {
    [self updateState];
}

- (void) updateState {
    [self.currentScene update];
}

-(void)drawScene {
    [self.currentScene draw];
}


@end
