//
//  BBPhysicsObject.h
//  blah
//
//  Created by Rajiev Timal on 11/27/12.
//  Copyright (c) 2012 Bleep. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBPhysicsObject : NSObject

@property (nonatomic) float accelX;
@property (nonatomic) float accelY;
@property (nonatomic) float accelZ;
@property (nonatomic) float accelGrav;
@property (nonatomic) float posX;
@property (nonatomic) float posY;
@property (nonatomic) float posZ;
@property (nonatomic) float yaw;
@property (nonatomic) float pitch;
@property (nonatomic) float roll;


@end
