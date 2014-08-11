//
//  ZBAnalyticsTapGestureViewController.m
//  DemoIOSApp
//
//  Created by Igor Bezpaliy on 5/21/14.
//  Copyright (c) 2014 com.zeo. All rights reserved.
//

#import "ZBAnalyticsTapGestureViewController.h"

@interface ZBAnalyticsTapGestureViewController ()

@property (nonatomic, weak) IBOutlet UIImageView* imageView;

- (IBAction) onAction: (id) sender;

@end

@implementation ZBAnalyticsTapGestureViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self.imageView setUserInteractionEnabled: YES];
	UITapGestureRecognizer* tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(onAction:)];
	[self.imageView addGestureRecognizer: tapGestureRecognizer];
}

- (IBAction) onAction: (id) sender
{
	NSLog(@"%@ : %@ : %@", NSStringFromSelector(_cmd), NSStringFromClass([sender class]), NSStringFromClass([[(UIGestureRecognizer*)sender view] class]));
}

@end
