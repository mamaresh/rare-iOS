//
//  UIButton+Additions.h
//  rare
//
//  Created by MANJUNATH AMARESH on 1/23/16.
//  Copyright © 2016 MANJUNATH AMARESH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Additions)

// Properties
@property (assign, nonatomic, readwrite) BOOL viewVisible;
@property (assign, nonatomic, readwrite) CGFloat cornerRadius;

// Methods
- (UIViewController *) firstAvailableUIViewController;
- (void) applyAntialisingBorder;
- (void) positionFrameOriginX:(CGFloat) x originY:(CGFloat) y;

- (void) setTitleForAllStates:(NSString *)title;
- (void) setAttributedTitleForAllStates:(NSAttributedString *)title;
- (void) setTitleColorForAllStates:(UIColor *)color;
- (void) setTitleShadowColorForAllStates:(UIColor *)color;
- (void) setImageForAllStates:(UIImage *)image;
- (void) setBackgroundImageForAllStates:(UIImage *)image;
- (void) centerAlignImageAndText;

@end
