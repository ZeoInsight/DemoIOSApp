//
//  ZBUIElementsSliderViewController.m
//  DemoIOSApp
//
//  Created by Igor Bezpaliy on 5/20/14.
//  Copyright (c) 2014 com.zeo. All rights reserved.
//

#import "ZBUIElementsSliderViewController.h"
#import "UIColor+ZBUIElements.h"

@interface ZBUIElementsSliderViewController ()

@property (nonatomic, weak) IBOutlet UISlider* defaultSlider;
@property (nonatomic, weak) IBOutlet UISlider* tintedSlider;
@property (nonatomic, weak) IBOutlet UISlider* customSlider;

@end

@implementation ZBUIElementsSliderViewController

- (void) viewDidLoad
{
    [super viewDidLoad];

    [self configureDefaultSlider];
    [self configureTintedSlider];
    [self configureCustomSlider];
}

#pragma mark - Configuration

- (void) configureDefaultSlider
{
    self.defaultSlider.minimumValue = 0;
    self.defaultSlider.maximumValue = 100;
    self.defaultSlider.value = 42;
    self.defaultSlider.continuous = YES;

    [self.defaultSlider addTarget: self action: @selector(sliderValueDidChange:) forControlEvents: UIControlEventValueChanged];
}

- (void) configureTintedSlider
{
    self.tintedSlider.minimumTrackTintColor = [UIColor uiElementBlueColor];
    self.tintedSlider.maximumTrackTintColor = [UIColor uiElementPurpleColor];

    [self.tintedSlider addTarget:self action:@selector(sliderValueDidChange:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) configureCustomSlider
{
    UIImage* leftTrackImage = [UIImage imageNamed: @"slider_blue_track"];
    [self.customSlider setMinimumTrackImage: leftTrackImage forState: UIControlStateNormal];

    UIImage *rightTrackImage = [UIImage imageNamed: @"slider_green_track"];
    [self.customSlider setMaximumTrackImage: rightTrackImage forState: UIControlStateNormal];

    UIImage *thumbImage = [UIImage imageNamed: @"slider_thumb"];
    [self.customSlider setThumbImage: thumbImage forState: UIControlStateNormal];

    self.customSlider.minimumValue = 0;
    self.customSlider.maximumValue = 100;
    self.customSlider.continuous = NO;
    self.customSlider.value = 84;

    [self.customSlider addTarget:self action:@selector(sliderValueDidChange:) forControlEvents:UIControlEventValueChanged];
}


#pragma mark - Actions

- (void) sliderValueDidChange: (UISlider*) slider
{
    NSLog(@"A slider changed its value: %@", slider);
}

@end
