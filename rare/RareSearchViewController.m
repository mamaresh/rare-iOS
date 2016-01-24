//
//  RareSearchViewController.h
//  rare
//
//  Created by MANJUNATH AMARESH on 8/9/15.
//  Copyright (c) 2015 MANJUNATH AMARESH. All rights reserved.
//

#import "RareSearchViewController.h"

@interface RareSearchViewController()

@property (strong, nonatomic, readwrite) UITextField *searchField;

@end

@implementation RareSearchViewController

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
    self.view.backgroundColor = [UIColor redColor];
    
    [self.view addSubview: self.searchField];
}

- (void) viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat pageWidth = self.view.bounds.size.width;
    CGFloat pageHeight = self.view.bounds.size.height;
    
    self.searchField.frame = CGRectMake((0.05 * pageWidth), (0.25 * pageWidth), (0.9 * pageWidth), 40.0);
}

-(UITextField *) searchField
{
    if (_searchField == nil)
    {
        _searchField = [[UITextField alloc] init];
        _searchField.backgroundColor = [UIColor whiteColor];
        _searchField.layer.cornerRadius = 2.0;
        _searchField.textColor = [UIColor yellowColor];
    }
    return _searchField;
}

@end