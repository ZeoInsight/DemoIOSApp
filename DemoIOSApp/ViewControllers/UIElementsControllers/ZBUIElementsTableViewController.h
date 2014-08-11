//
//  ZBUIElementsTableViewController.h
//  DemoIOSApp
//
//  Created by Igor Bezpaliy on 5/22/14.
//  Copyright (c) 2014 com.zeo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBUIElementsDetailsTableViewController.h"

@interface ZBUIElementsTableViewController : UITableViewController
{
@private
	NSMutableArray* _tableData;
}

@property (strong, nonatomic) ZBUIElementsDetailsTableViewController* detailViewController;

@end
