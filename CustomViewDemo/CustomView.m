//
//  CustomView.m
//  CustomViewDemo
//
//  Created by Will Chilcutt on 2/8/12.
//  Copyright (c) 2012 ETSU. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

@synthesize red = _red;
@synthesize green = _green;
@synthesize blue = _blue;
@synthesize userIsTouchingView = _userIsTouchingView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) 
    {
        self.userIsTouchingView = NO;
        [self randomizeBackgroundColor];
    }
    return self;
}

- (void) randomizeBackgroundColor
{
    self.red = (CGFloat)(arc4random()%256)/255.0;
    self.green = (CGFloat)(arc4random()%256)/255.0;
    self.blue = (CGFloat)(arc4random()%256)/255.0;
    
    UIColor *bgColor = [[UIColor alloc] initWithRed:self.red 
                                              green:self.green
                                               blue:self.blue 
                                              alpha:1.0];
    
    self.backgroundColor = bgColor;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.userIsTouchingView = YES;
    [self setNeedsDisplay];
    self.alpha = 0.5;
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.userIsTouchingView = NO;
    [self setNeedsDisplay];
    self.alpha = 1.0;
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touchInfo = [touches anyObject];
    
    if(touchInfo.view == self)
    {
        CGPoint touchStart = [touchInfo previousLocationInView:self];
        CGPoint touchEnd = [touchInfo locationInView:self];
        CGFloat xDifference = touchEnd.x - touchStart.x;
        CGFloat yDifference = touchEnd.y - touchStart.y;
        CGPoint newCenter = CGPointMake(self.center.x + xDifference, self.center.y + yDifference);
        [self setCenter:newCenter];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.*/


- (void)drawRect:(CGRect)rect
{
    if(self.userIsTouchingView)
    {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGPoint topLeftCorner = self.bounds.origin;
        CGPoint bottomRightCorner = CGPointMake(topLeftCorner.x + self.bounds.size.width, topLeftCorner.y + self.bounds.size.height);

        CGContextBeginPath(context);
        CGContextMoveToPoint(context, topLeftCorner.x, topLeftCorner.y);
        CGContextAddLineToPoint(context, bottomRightCorner.x, bottomRightCorner.y);
        CGContextAddLineToPoint(context, topLeftCorner.x, bottomRightCorner.y);
        CGContextAddLineToPoint(context, bottomRightCorner.x, topLeftCorner.y);
        CGContextClosePath(context);

        [[UIColor whiteColor] setStroke];
        CGContextSetLineWidth(context, 4.0);
        CGContextDrawPath(context, kCGPathStroke);
    }
}

@end












