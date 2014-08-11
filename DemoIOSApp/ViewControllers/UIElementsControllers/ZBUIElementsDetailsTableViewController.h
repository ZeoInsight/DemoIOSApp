//
//  ZBUIElementsDetailsTableViewController.h
//  DemoIOSApp
//
//  Created by Igor Bezpaliy on 5/22/14.
//  Copyright (c) 2014 com.zeo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZBUIElementsDetailsTableViewController : UIViewController

@property (strong, nonatomic) id item;

@property (weak, nonatomic) IBOutlet UILabel* label;
@property (weak, nonatomic) IBOutlet UIImageView* imageView;

@end
