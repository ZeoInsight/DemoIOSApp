//
//  ZBAnalyticsPinchGestureViewController.m
//  DemoIOSApp
//
//  Created by Igor Bezpaliy on 5/21/14.
//  Copyright (c) 2014 com.zeo. All rights reserved.
//

#import "ZBAnalyticsPinchGestureViewController.h"

@interface ZBAnalyticsPinchGestureViewController ()

@property (nonatomic, weak) IBOutlet UILabel* label;

- (IBAction) onAction: (id) sender;

@end

@implementation ZBAnalyticsPinchGestureViewController

- (IBAction) onAction: (id) sender
{
	UIPinchGestureRecognizer* gesture = (UIPinchGestureRecognizer*)sender;
	[self.label setText: [NSString stringWithFormat: @"Scale: %f", gesture.scale]];
}

@end
