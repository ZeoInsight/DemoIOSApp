//
//  AppDelegate.m
//  DemoIOSApp
//
//  Created by Igor Bezpaliy on 5/14/14.
//  Copyright (c) 2014 com.zeo. All rights reserved.
//

#import "AppDelegate.h"
#import "ZBAnalytics.iOS/ZBAnalytics.h"

NSString * const kZBAnalyticsCustomVariable1Name = @"Test Dimensions 1";
NSString * const kZBAnalyticsCustomVariable2Name = @"Test Dimensions 2";
NSString * const kZBAnalyticsCustomVariable3Name = @"Test Dimensions 3";
NSString * const kZBAnalyticsCustomVariable4Name = @"Test Dimensions 4";
NSString * const kZBAnalyticsCustomVariable5Name = @"Test Dimensions 5";

#warning Please enter your productKey. Go to the ZeoInsight.com, navigate to Manage Project and select yout product.
NSString * const kZBAnalyticsProductKey = @"00000000-0000-0000-0000-000000000000";

@implementation AppDelegate

- (BOOL)application: (UIApplication*) application didFinishLaunchingWithOptions: (NSDictionary*) launchOptions
{
	[ZBAnalytics setProductKey: kZBAnalyticsProductKey];
	[ZBAnalytics setPrimaryProcess: YES];
	[ZBAnalytics setEnabled: YES];

	[[ZBAnalytics analytics] setName: kZBAnalyticsCustomVariable1Name forCustomVariable: kZBAnalyticsCustomVariable1];
	[[ZBAnalytics analytics] setName: kZBAnalyticsCustomVariable2Name forCustomVariable: kZBAnalyticsCustomVariable2];
	[[ZBAnalytics analytics] setName: kZBAnalyticsCustomVariable3Name forCustomVariable: kZBAnalyticsCustomVariable3];
	[[ZBAnalytics analytics] setName: kZBAnalyticsCustomVariable4Name forCustomVariable: kZBAnalyticsCustomVariable4];
	[[ZBAnalytics analytics] setName: kZBAnalyticsCustomVariable5Name forCustomVariable: kZBAnalyticsCustomVariable5];

    return YES;
}

@end
