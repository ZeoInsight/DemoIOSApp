//
//  ZBAnalyticsSettingsViewControllers.h
//  DemoIOSApp
//
//  Created by Igor Bezpaliy on 5/14/14.
//  Copyright (c) 2014 com.zeo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZBAnalyticsSettingsViewControllers : UITableViewController
{
@private
	IBOutlet UISwitch* _enableAnalyticsSwitch;
	IBOutlet UISwitch* _enableRunTimeSwitch;
	IBOutlet UISwitch* _enableCelluarNetworkSwitch;
	IBOutlet UISwitch* _enableAnyGestureTrackingSwitch;
}

- (IBAction) onEnableChanged: (id)sender;
- (IBAction) onRuntimeChanged: (id)sender;
- (IBAction) onNetworkChanged: (id)sender;
- (IBAction) onGestureTargetChanged: (id)sender;

@end
