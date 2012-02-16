//
//  customViewDemoViewController.m
//  CustomViewDemo
//
//  Created by Will Chilcutt on 2/8/12.
//  Copyright (c) 2012 ETSU. All rights reserved.
//

#import "customViewDemoViewController.h"
#import "CustomView.h"

@implementation customViewDemoViewController

- (IBAction)newViewRequested:(id)sender 
{
    CGRect viewRectangle = CGRectMake(20, 20, 140, 100);
    CustomView *newView = [[CustomView alloc] initWithFrame:viewRectangle];
    
    [self.view addSubview:newView];
    
    NSLog(@"Subview count = %d", self.view.subviews.count);
    
}
- (IBAction)newColor:(id)sender {
    CustomView *topView = self.view.subviews.lastObject;
    if ([topView isMemberOfClass:[CustomView class]]) {
        [[self.view.subviews objectAtIndex:(self.view.subviews.count-1)]randomizeBackgroundColor];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if (touch.view == self.view) {
        CustomView *topView = self.view.subviews.lastObject;
        if ([topView isMemberOfClass:[CustomView class]]) {
            CGPoint touchPoint = [touch locationInView:self.view];
            topView.center = touchPoint;
        }
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
