//
//  ZBUIElementsSwitchViewController.m
//  DemoIOSApp
//
//  Created by Igor Bezpaliy on 5/20/14.
//  Copyright (c) 2014 com.zeo. All rights reserved.
//

#import "ZBUIElementsSwitchViewController.h"
#import "UIColor+ZBUIElements.h"

@interface ZBUIElementsSwitchViewController ()

@property (nonatomic, weak) IBOutlet UISwitch* defaultSwitch;
@property (nonatomic, weak) IBOutlet UISwitch* tintedSwitch;

@end

@implementation ZBUIElementsSwitchViewController

- (void) viewDidLoad
{
    [super viewDidLoad];

    [self configureDefaultSwitch];
    [self configureTintedSwitch];
}

#pragma mark - Configuration

- (void) configureDefaultSwitch
{
    [self.defaultSwitch setOn: YES animated: YES];

    [self.defaultSwitch addTarget: self action: @selector(switchValueDidChange:) forControlEvents: UIControlEventValueChanged];
}

- (void)configureTintedSwitch
{
    self.tintedSwitch.tintColor = [UIColor uiElementBlueColor];
    self.tintedSwitch.onTintColor = [UIColor uiElementGreenColor];
    self.tintedSwitch.thumbTintColor = [UIColor uiElementPurpleColor];

    [self.tintedSwitch addTarget: self action: @selector(switchValueDidChange:) forControlEvents: UIControlEventValueChanged];
}

#pragma mark - Actions

- (void)switchValueDidChange: (UISwitch*) aSwitch
{
    NSLog(@"A switch changed its value: %@.", aSwitch);
}

@end
