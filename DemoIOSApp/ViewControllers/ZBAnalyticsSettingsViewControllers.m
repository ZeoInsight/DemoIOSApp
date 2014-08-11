//
//  ZBAnalyticsSettingsViewControllers.m
//  DemoIOSApp
//
//  Created by Igor Bezpaliy on 5/14/14.
//  Copyright (c) 2014 com.zeo. All rights reserved.
//

#import "ZBAnalyticsSettingsViewControllers.h"
#import "ZBAnalytics.iOS/ZBAnalytics.h"
#import "AppDelegate.h"

@implementation ZBAnalyticsSettingsViewControllers

- (IBAction) onEnableChanged: (id)sender
{
	if (_enableAnalyticsSwitch.isOn)
	{
		[_enableRunTimeSwitch setOn: YES];
		[_enableCelluarNetworkSwitch setOn: NO];
		[_enableAnyGestureTrackingSwitch setOn: NO];

		[ZBAnalytics setEnabled: YES];

		[[ZBAnalytics analytics] setName: kZBAnalyticsCustomVariable1Name forCustomVariable: kZBAnalyticsCustomVariable1];
		[[ZBAnalytics analytics] setName: kZBAnalyticsCustomVariable2Name forCustomVariable: kZBAnalyticsCustomVariable2];
		[[ZBAnalytics analytics] setName: kZBAnalyticsCustomVariable3Name forCustomVariable: kZBAnalyticsCustomVariable3];
		[[ZBAnalytics analytics] setName: kZBAnalyticsCustomVariable4Name forCustomVariable: kZBAnalyticsCustomVariable4];
		[[ZBAnalytics analytics] setName: kZBAnalyticsCustomVariable5Name forCustomVariable: kZBAnalyticsCustomVariable5];
	}
	else
	{
		[_enableRunTimeSwitch setOn: NO];
		[_enableCelluarNetworkSwitch setOn: NO];
		[_enableAnyGestureTrackingSwitch setOn: NO];
		[ZBAnalytics setEnabled: NO];
	}
}

- (IBAction) onRuntimeChanged: (id)sender
{
	[ZBAnalytics analytics].runtimeIntrusive = _enableRunTimeSwitch.isOn;
}

- (IBAction) onNetworkChanged: (id)sender
{
	[ZBAnalytics setUsesCellularNetwork: _enableCelluarNetworkSwitch.isOn];
}

- (IBAction) onGestureTargetChanged: (id)sender
{
	[ZBAnalytics setTargetTypeForHandlingGestureRecognizer: (_enableAnyGestureTrackingSwitch.isOn) ? kZBAnyTargetType : kZBUIViewControllerTargetType];
}

@end
