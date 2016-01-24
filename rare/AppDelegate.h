//
//  AppDelegate.h
//  rare
//
//  Created by MANJUNATH AMARESH on 1/23/16.
//  Copyright © 2016 MANJUNATH AMARESH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Google/SignIn.h>
#import "MainViewController.h"
#import "RareSearchViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, GIDSignInDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong, readonly) MainViewController *mainViewController;

@end

