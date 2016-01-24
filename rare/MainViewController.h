//
//  MainViewController.h
//  rare
//
//  Created by MANJUNATH AMARESH on 1/23/16.
//  Copyright © 2016 MANJUNATH AMARESH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Google/SignIn.h>

@interface MainViewController : UIViewController <GIDSignInUIDelegate>

- (instancetype)init;

@end