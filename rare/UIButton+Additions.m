//
//  UIButton+Additions.m
//  Navigator
//
//  Created by MANJUNATH AMARESH on 8/14/15.
//  Copyright (c) 2015 MANJUNATH AMARESH. All rights reserved.
//

#import "UIButton+Additions.h"

@implementation UIButton (Additions)

- (BOOL) viewVisible
{
    return (NO == self.hidden);
}

- (void) setViewVisible:(BOOL)viewVisible
{
    self.hidden = (NO == viewVisible);
}

- (UIImage *) imageFromCGLayer
{
    UIImage *imageFromCGLayer = nil;
    
    if (NO == CGRectIsEmpty(self.bounds))
    {
        // opaque param needs to be set to NO, otherwise it will generate an image with black background.
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0.0f);
        
        [self.layer renderInContext: UIGraphicsGetCurrentContext()];
        
        imageFromCGLayer = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    return imageFromCGLayer;
}

- (UIViewController *)firstAvailableUIViewController
{
    return (UIViewController *)[self traverseResponderChainForUIViewController];
}

- (id) traverseResponderChainForUIViewController
{
    id nextResponder = [self nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
    {
        return nextResponder;
    }
    else if ([nextResponder isKindOfClass:[UIView class]])
    {
        return [nextResponder traverseResponderChainForUIViewController];
    }
    else
    {
        return nil;
    }
}

- (CGFloat) cornerRadius
{
    return self.layer.cornerRadius;
}

- (void) setCornerRadius:(CGFloat) cornerRadius
{
    if (cornerRadius > 0.0)
    {
        self.layer.cornerRadius = cornerRadius;
        self.layer.masksToBounds = YES;
    }
    else
    {
        self.layer.cornerRadius = 0.0;
        self.layer.masksToBounds = NO;
    }
}

// set a border on the view that will reduce aliasing effects
- (void) applyAntialisingBorder
{
    self.layer.borderWidth = 1;
    self.layer.borderColor = [UIColor clearColor].CGColor;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    self.layer.shouldRasterize = YES;
}

- (void) positionFrameOriginX:(CGFloat) x originY:(CGFloat) y
{
    CGRect frame = self.frame;
    frame = CGRectOffset( frame, -frame.origin.x, -frame.origin.y );
    self.frame = CGRectOffset( frame, x, y );
}

- (void) setTitleForAllStates:(NSString *)title
{
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitle:title forState:UIControlStateHighlighted];
    [self setTitle:title forState:UIControlStateDisabled];
    [self setTitle:title forState:UIControlStateSelected];
}

- (void) setAttributedTitleForAllStates:(NSAttributedString *)title
{
    [self setAttributedTitle:title forState:UIControlStateNormal];
    [self setAttributedTitle:title forState:UIControlStateHighlighted];
    [self setAttributedTitle:title forState:UIControlStateDisabled];
    [self setAttributedTitle:title forState:UIControlStateSelected];
}

- (void) setTitleColorForAllStates:(UIColor *)color
{
    [self setTitleColor:color forState:UIControlStateNormal];
    [self setTitleColor:color forState:UIControlStateHighlighted];
    [self setTitleColor:color forState:UIControlStateDisabled];
    [self setTitleColor:color forState:UIControlStateSelected];
}

- (void) setTitleShadowColorForAllStates:(UIColor *)color
{
    [self setTitleShadowColor:color forState:UIControlStateNormal];
    [self setTitleShadowColor:color forState:UIControlStateHighlighted];
    [self setTitleShadowColor:color forState:UIControlStateDisabled];
    [self setTitleShadowColor:color forState:UIControlStateSelected];
}

- (void) setImageForAllStates:(UIImage *)image
{
    [self setImage: image forState: UIControlStateNormal];
    [self setImage: image forState: UIControlStateHighlighted];
    [self setImage: image forState: UIControlStateDisabled];
    [self setImage: image forState: UIControlStateSelected];
}

- (void) setBackgroundImageForAllStates:(UIImage *)image
{
    [self setBackgroundImage: image forState: UIControlStateNormal];
    [self setBackgroundImage: image forState: UIControlStateHighlighted];
    [self setBackgroundImage: image forState: UIControlStateDisabled];
    [self setBackgroundImage: image forState: UIControlStateSelected];
}

- (void)centerAlignImageAndText
{
    CGSize imageSize = self.imageView.frame.size;
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -imageSize.width, -imageSize.height, 0);
    CGSize titleSize = self.titleLabel.frame.size;
    self.imageEdgeInsets = UIEdgeInsetsMake(-titleSize.height, 0, 0, -titleSize.width);
}

@end