//
//  CustomView.h
//  CustomViewDemo
//
//  Created by Will Chilcutt on 2/8/12.
//  Copyright (c) 2012 ETSU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomView : UIView
{
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    BOOL userIsTouchingView;
}

@property (nonatomic) CGFloat red;
@property (nonatomic) CGFloat green;
@property (nonatomic) CGFloat blue;
@property (nonatomic) BOOL userIsTouchingView;

- (void) randomizeBackgroundColor;

@end
