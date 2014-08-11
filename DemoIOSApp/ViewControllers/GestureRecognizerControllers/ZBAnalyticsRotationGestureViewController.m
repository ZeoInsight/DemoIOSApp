//
//  ZBAnalyticsRotationGestureViewController.m
//  DemoIOSApp
//
//  Created by Igor Bezpaliy on 5/21/14.
//  Copyright (c) 2014 com.zeo. All rights reserved.
//

#import "ZBAnalyticsRotationGestureViewController.h"

@interface ZBAnalyticsRotationGestureViewController ()

@property (nonatomic, weak) IBOutlet UILabel* label;

- (IBAction) onAction: (id) sender;

@end

@implementation ZBAnalyticsRotationGestureViewController

- (IBAction) onAction: (id) sender
{
	UIRotationGestureRecognizer* gesture = (UIRotationGestureRecognizer*)sender;
	[self.label setText: [NSString stringWithFormat: @"Rotation: %f", gesture.rotation]];
}

@end
