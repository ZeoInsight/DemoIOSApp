//
//  ZBAnalyticsInfoViewControllers.m
//  DemoIOSApp
//
//  Created by Igor Bezpaliy on 5/14/14.
//  Copyright (c) 2014 com.zeo. All rights reserved.
//

#import "ZBAnalyticsInfoViewControllers.h"
#import "AppDelegate.h"

@implementation ZBAnalyticsInfoViewControllers

- (void)viewDidLoad
{
    [super viewDidLoad];

	[_productKeyLabel setText: kZBAnalyticsProductKey];
	[_deviceIDLabel setText: [[[UIDevice currentDevice] identifierForVendor] UUIDString]];
	NSString* version = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleShortVersionString"];
	[_appVersionLabel setText: (version.length > 0) ? version : @"N/A"];
	[_launchCountLabel setText: [[[NSUserDefaults standardUserDefaults] objectForKey: @"ZBAnalyticsLaunchAppNumberPreference"] stringValue]];
}

@end
