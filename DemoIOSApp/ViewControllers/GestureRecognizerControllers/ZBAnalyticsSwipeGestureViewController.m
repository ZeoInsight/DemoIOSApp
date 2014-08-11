//
//  ZBAnalyticsSwipeGestureViewController.m
//  DemoIOSApp
//
//  Created by Igor Bezpaliy on 5/21/14.
//  Copyright (c) 2014 com.zeo. All rights reserved.
//

#import "ZBAnalyticsSwipeGestureViewController.h"

@interface ZBAnalyticsSwipeGestureViewController ()

- (IBAction) leftSwipeAction: (id) sender;
- (IBAction) rightSwipeAction: (id) sender;
- (IBAction) upSwipeAction: (id) sender;
- (IBAction) downSwipeAction: (id) sender;

@end

@implementation ZBAnalyticsSwipeGestureViewController

- (IBAction) leftSwipeAction: (id) sender
{
	NSLog(@"Left Swipe : %@ : %@", NSStringFromClass([sender class]), NSStringFromClass([[(UIGestureRecognizer*)sender view] class]));
}

- (IBAction) rightSwipeAction: (id) sender
{
	NSLog(@"Right Swipe : %@ : %@", NSStringFromClass([sender class]), NSStringFromClass([[(UIGestureRecognizer*)sender view] class]));
}

- (IBAction) upSwipeAction: (id) sender
{
	NSLog(@"Up Swipe : %@ : %@", NSStringFromClass([sender class]), NSStringFromClass([[(UIGestureRecognizer*)sender view] class]));
}

- (IBAction) downSwipeAction: (id) sender
{
	NSLog(@"Down Swipe : %@ : %@", NSStringFromClass([sender class]), NSStringFromClass([[(UIGestureRecognizer*)sender view] class]));
}

@end
