//
//  MainViewController.m
//  Navigator
//
//  Created by MANJUNATH AMARESH on 8/9/15.
//  Copyright (c) 2015 MANJUNATH AMARESH. All rights reserved.
//

#import "MainViewController.h"
#import "UIColor+Additions.h"
#import "UIButton+Additions.h"
#import "UIView+Additions.h"
#import "UIFont+Additions.h"

static NSString * const kClientId = @"37425592525-9okgn1qudboli7v2bm4i4qiprf3p7p58.apps.googleusercontent.com";

@interface MainViewController()

@property(strong, nonatomic, readwrite) UIImageView *backgroundView;

@property (strong, nonatomic, readwrite) UILabel *logo;

@property (strong, nonatomic, readwrite) UITextField *phoneNumberPicker;
@property (strong, nonatomic, readwrite) UITextField *phoneNumberField;
@property (strong, nonatomic, readwrite) GIDSignInButton *signInButton;
@property (strong, nonatomic, readwrite) UIButton *testButton;

@end

@implementation MainViewController

- (instancetype) init
{
    if (self = [super init])
    {
        
    }
    return self;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    GIDSignIn* signIn = [GIDSignIn sharedInstance];
    signIn.shouldFetchBasicProfile = YES;
    signIn.clientID = kClientId;
    signIn.scopes = @[ @"profile",
                       @"email",
                       @"https://www.googleapis.com/auth/plus.login",
                       @"https://www-opensocial.googleusercontent.com/api/people/@me" ];
    [GIDSignIn sharedInstance].uiDelegate = self;
    
    self.view.backgroundColor = [UIColor clearColor];
    [self.view addSubview: self.backgroundView];
    [self.view addSubview: self.logo];
    [self.view addSubview: self.phoneNumberPicker];
    [self.view addSubview: self.phoneNumberField];
    [self.view addSubview: self.signInButton];
    [self.view addSubview: self.testButton];
    
}

- (void) viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.backgroundView.frame = self.view.bounds;
    
    CGFloat screenWidth = self.view.bounds.size.width;
    CGFloat screenHeight = self.view.bounds.size.height;
    CGFloat logoLabelHeight = 100.0;
    CGFloat phoneNumberFieldHeight = 40.0;
    
    self.logo.frameSize = CGSizeMake((0.9 * screenWidth), logoLabelHeight);
    
    self.phoneNumberPicker.frameSize = CGSizeMake( (0.1 * screenWidth), phoneNumberFieldHeight);
    self.phoneNumberField.frameSize = CGSizeMake( (0.8 * screenWidth), phoneNumberFieldHeight);
    
    [self.logo positionFrameOriginX:( 0.05 * screenWidth )
                            originY:( (screenHeight - self.logo.frameHeight) * 0.25 )];
    [self.phoneNumberPicker positionFrameOriginX:( 0.05 * screenWidth )
                                         originY:( (screenHeight - self.phoneNumberPicker.frameHeight) / 2.0 )];
    [self.phoneNumberField positionFrameOriginX:self.phoneNumberPicker.frameRight
                                        originY:( (screenHeight - self.phoneNumberPicker.frameHeight) / 2.0 )];
    
    [self.signInButton positionFrameOriginX:((0.5 * screenWidth) - ((self.signInButton.frameWidth)/2.0))
                                    originY:((screenHeight - self.signInButton.frameHeight) * 0.75)];
    
    self.testButton.frame = CGRectMake(self.signInButton.frameX,
                                       self.signInButton.frameBottom,
                                       self.signInButton.frameWidth,
                                       self.signInButton.frameHeight);
}

- (UIImageView *) backgroundView
{
    if (_backgroundView == nil)
    {
        _backgroundView = [[UIImageView alloc] initWithFrame: CGRectZero];
        _backgroundView.image = [UIImage imageNamed: @"mainBackground.jpg"];
    }
    return _backgroundView;
}

- (UILabel *) logo
{
    if (_logo == nil)
    {
        _logo = [[UILabel alloc] initWithFrame: CGRectZero];
        _logo.backgroundColor = [UIColor clearColor];
        _logo.text = @"r a r e";
        _logo.textColor = [[UIColor whiteColor] colorWithAlphaComponent: 0.80];
        _logo.textAlignment = NSTextAlignmentCenter;
        _logo.font = [UIFont appFontOfSize: 80.0];
    }
    return _logo;
}

- (UITextField *) phoneNumberPicker
{
    if (_phoneNumberPicker == nil)
    {
        _phoneNumberPicker = [[UITextField alloc] init];
        _phoneNumberPicker.backgroundColor = [UIColor clearColor];
        _phoneNumberPicker.layer.borderColor = [[UIColor whiteColor] CGColor];
        _phoneNumberPicker.layer.borderWidth = 1.0;
    }
    return _phoneNumberPicker;
}

- (UITextField *) phoneNumberField
{
    if (_phoneNumberField == nil)
    {
        _phoneNumberField = [[UITextField alloc] init];
        _phoneNumberField.backgroundColor = [UIColor clearColor];
        _phoneNumberField.layer.borderColor = [[UIColor whiteColor] CGColor];
        _phoneNumberField.layer.borderWidth = 1.0;
    }
    return _phoneNumberField;
}

- (GIDSignInButton *) signInButton
{
    if (_signInButton == nil)
    {
        _signInButton = [[GIDSignInButton alloc] init];
    }
    return _signInButton;
}

- (UIButton *) testButton
{
    if (_testButton == nil)
    {
        _testButton = [[UIButton alloc] init];
        _testButton.backgroundColor = [UIColor whiteColor];
        UILabel *testLabel = _testButton.titleLabel;
        testLabel.text = @"Sign-in";
        testLabel.font = [UIFont appFontOfSize: 10.0];
        testLabel.textAlignment = NSTextAlignmentCenter;
        testLabel.textColor = [UIColor redColor];
        [_testButton addTarget: self
                        action: @selector(loginPressed:)
              forControlEvents: UIControlEventTouchUpInside];
    }
    return _testButton;
}

- (void) loginPressed:(id) sender
{
    [self gid_signInWithGoogle];
}


@end

