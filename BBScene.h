//
//  BBScene.h
//  BB
//
//  Created by Rajiev Timal on 11/27/12.
//  Copyright (c) 2012 Bleep. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBScene : NSObject

@property (nonatomic, retain) NSArray *gameObjects;

- (void)addObjectToScene:(id)object;

@end
