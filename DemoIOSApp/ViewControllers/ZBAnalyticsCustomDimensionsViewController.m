//
//  ZBAnalyticsCustomDimensionsViewController.m
//  DemoIOSApp
//
//  Created by Igor Bezpaliy on 5/14/14.
//  Copyright (c) 2014 com.zeo. All rights reserved.
//

#import "ZBAnalyticsCustomDimensionsViewController.h"
#import "ZBAnalytics.iOS/ZBAnalytics.h"
#import "AppDelegate.h"

@implementation ZBAnalyticsCustomDimensionsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (BOOL) textFieldShouldReturn: (UITextField*) textField
{
	ZBAnalyticsCustomVariable customVariableName = kZBAnalyticsCustomVariable1;

	if (textField == _customVariable2Field)
	{
		customVariableName = kZBAnalyticsCustomVariable2;
	}
	else if (textField == _customVariable3Field)
	{
		customVariableName = kZBAnalyticsCustomVariable3;
	}
	else if (textField == _customVariable4Field)
	{
		customVariableName = kZBAnalyticsCustomVariable4;
	}
	else if (textField == _customVariable5Field)
	{
		customVariableName = kZBAnalyticsCustomVariable5;
	}

	[[ZBAnalytics analytics] setValue: [textField text] forCustomVariable: customVariableName];

	[textField resignFirstResponder];
    return YES;
}

@end
