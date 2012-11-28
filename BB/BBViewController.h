//
//  MCViewController.h
//  blah
//
//  Created by Jeff LaMarche on 9/6/11.
//  Copyright (c) 2011 MartianCraft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import "BBGameController.h"

@interface BBViewController : GLKViewController


@property (nonatomic, retain) BBGameController *gameController;

- (EAGLContext *)getGLContext;


@end
