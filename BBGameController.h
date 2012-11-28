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
#import "BBScene.h"
#import <GLKit/GLKit.h>

@interface BBGameController : NSObject<GLKViewControllerDelegate>

@property (nonatomic, retain) BBEventHandler *eventHandler;
@property (nonatomic, retain) BBAssetManager *assetManager;
@property (nonatomic, retain) BBCollisionDetector *collisionDetector;
@property (nonatomic, retain) BBPhysics *physics;
@property (nonatomic, retain) BBScene *currentScene;
@property (nonatomic) float deltaTime;
@property (nonatomic) float lastTime;
@property (nonatomic) GLKViewController *glkVC;

- (id)initWithGLKViewController:(id)GLKViewController;
- (void)updateWithDeltaTime:(NSNumber *)deltaTime;
- (void)setupGL;
- (void)drawScene;
- (void)updateState;

@end
