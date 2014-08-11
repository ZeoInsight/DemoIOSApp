//
//  ZBAnalyticsCustomEventsViewController.m
//  DemoIOSApp
//
//  Created by Igor Bezpaliy on 5/14/14.
//  Copyright (c) 2014 com.zeo. All rights reserved.
//

#import "ZBAnalyticsCustomEventsViewController.h"
#import "ZBAnalytics.iOS/ZBAnalytics.h"

@implementation ZBAnalyticsCustomEventsViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
}

- (BOOL) textFieldShouldReturn: (UITextField*) textField
{
	NSString* eventName = textField.text;

	if (textField == _sendCustomEvent)
	{
		[[ZBAnalytics analytics] addCustomEventWithName: eventName];
	}
	else if (textField == _sendCustomEventSynchronously)
	{
		[[ZBAnalytics analytics] addCustomEventAndSendSynchronouslyWithName: eventName];
	}
	[textField resignFirstResponder];
    return YES;
}

@end
