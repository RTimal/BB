//
//  MCAppDelegate.h
//  blah
//
//  Created by Jeff LaMarche on 9/6/11.
//  Copyright (c) 2011 MartianCraft. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BBViewController;

@interface BBAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) BBViewController *viewController;

@end
