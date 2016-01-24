//
//  UIView+Additions.h
//  rare
//
//  Created by MANJUNATH AMARESH on 1/23/16.
//  Copyright © 2016 MANJUNATH AMARESH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Additions)

///> Thanks, Tyler Neylon
@property (nonatomic) CGPoint frameOrigin;
@property (nonatomic) CGSize frameSize;

@property (nonatomic) CGFloat frameX;
@property (nonatomic) CGFloat frameY;

// Setting these modifies the origin but not the size.
@property (nonatomic) CGFloat frameRight;
@property (nonatomic) CGFloat frameBottom;

@property (nonatomic) CGFloat frameWidth;
@property (nonatomic) CGFloat frameHeight;

- (void) applyAntialisingBorder;

- (void) positionFrameOriginX:(CGFloat) x originY:(CGFloat) y;
///>

@end