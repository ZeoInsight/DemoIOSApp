//
//  ZBAnalyticsPanGestureViewController.m
//  DemoIOSApp
//
//  Created by Igor Bezpaliy on 5/21/14.
//  Copyright (c) 2014 com.zeo. All rights reserved.
//

#import "ZBAnalyticsPanGestureViewController.h"

@interface ZBAnalyticsPanGestureViewController ()

@property (nonatomic, weak) IBOutlet UILabel* label;

- (IBAction) onAction: (id) sender;

@end

@implementation ZBAnalyticsPanGestureViewController

- (IBAction) onAction: (id) sender
{
	UIPanGestureRecognizer* gesture = (UIPanGestureRecognizer*)sender;
	CGPoint location = [gesture locationInView: nil];
	[self.label setText: [NSString stringWithFormat: @"Location x = %ld    y = %ld", lround(location.x), lround(location.y)]];
}

@end
