//
//  ZBUIElementsMenuItemsViewController.m
//  DemoIOSApp
//
//  Created by Igor Bezpaliy on 5/28/14.
//  Copyright (c) 2014 com.zeo. All rights reserved.
//

#import "ZBUIElementsMenuItemsViewController.h"

@implementation ZBUIElementsMenuItemsViewController

- (BOOL) canBecomeFirstResponder
{
	return YES;
}

- (void) touchesBegan: (NSSet*) touches withEvent: (UIEvent*) event
{
	CGPoint tabPoint = [[touches anyObject] locationInView: self.view];
	[self becomeFirstResponder];
	UIMenuItem* item2 = [[UIMenuItem alloc] initWithTitle: @"Gray" action: @selector(grayBackgroundColor)];
	UIMenuItem* item1 = [[UIMenuItem alloc] initWithTitle: @"White" action: @selector(whiteBackgroundColor)];
	UIMenuItem* item3 = [[UIMenuItem alloc] initWithTitle: @"Orange" action: @selector(orangeBackgroundColor)];
	
	UIMenuController* menuController = [UIMenuController sharedMenuController];
	[menuController setMenuItems: @[ item1, item2, item3 ] ];
	[menuController setTargetRect: CGRectMake(tabPoint.x, tabPoint.y, 1, 1) inView: self.view];
	[menuController setMenuVisible: YES animated: YES];
}

- (void) whiteBackgroundColor
{
	[self.view setBackgroundColor: [UIColor whiteColor]];
}

- (void) grayBackgroundColor
{
	[self.view setBackgroundColor: [UIColor grayColor]];
}

- (void) orangeBackgroundColor
{
	[self.view setBackgroundColor: [UIColor orangeColor]];
}

@end
