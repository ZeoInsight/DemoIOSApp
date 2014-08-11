//
//  ZBUIElementsDetailsTableViewController.m
//  DemoIOSApp
//
//  Created by Igor Bezpaliy on 5/22/14.
//  Copyright (c) 2014 com.zeo. All rights reserved.
//

#import "ZBUIElementsDetailsTableViewController.h"

@interface ZBUIElementsDetailsTableViewController ()

@end

@implementation ZBUIElementsDetailsTableViewController

- (void) viewDidLoad
{
    [super viewDidLoad];

	[self configureView];
}


- (void) setItem: (id) newItem
{
    if (_item != newItem)
	{
		_item = newItem;

        // Update the view.
        [self configureView];
    }
}

- (void) configureView
{
	if (self.item != nil)
	{
		self.label.text = [self.item objectForKey: @"text"];
		self.imageView.image = [UIImage imageNamed: [self.item objectForKey: @"iconName"]];
	}
}

@end
