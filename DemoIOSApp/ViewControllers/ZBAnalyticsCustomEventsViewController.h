//
//  ZBAnalyticsCustomEventsViewController.h
//  DemoIOSApp
//
//  Created by Igor Bezpaliy on 5/14/14.
//  Copyright (c) 2014 com.zeo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZBAnalyticsCustomEventsViewController : UITableViewController
{
@private
	IBOutlet UITextField* _sendCustomEvent;
	IBOutlet UITextField* _sendCustomEventSynchronously;
}
@end
