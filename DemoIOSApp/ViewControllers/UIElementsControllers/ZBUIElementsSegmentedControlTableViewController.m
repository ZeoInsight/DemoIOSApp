//
//  ZBUIElementsSegmentedControlTableViewController.m
//  DemoIOSApp
//
//  Created by Igor Bezpaliy on 5/20/14.
//  Copyright (c) 2014 com.zeo. All rights reserved.
//

#import "ZBUIElementsSegmentedControlTableViewController.h"
#import "UIColor+ZBUIElements.h"

@interface ZBUIElementsSegmentedControlTableViewController ()

@property (nonatomic, weak) IBOutlet UISegmentedControl* defaultSegmentedControl;
@property (nonatomic, weak) IBOutlet UISegmentedControl* tintedSegmentedControl;
@property (nonatomic, weak) IBOutlet UISegmentedControl* customSegmentsSegmentedControl;
@property (nonatomic, weak) IBOutlet UISegmentedControl* customBackgroundSegmentedControl;

@end

@implementation ZBUIElementsSegmentedControlTableViewController

- (void) viewDidLoad
{
    [super viewDidLoad];

    [self configureDefaultSegmentedControl];
    [self configureTintedSegmentedControl];
    [self configureCustomSegmentsSegmentedControl];
    [self configureCustomBackgroundSegmentedControl];
}

#pragma mark - Configuration

- (void) configureDefaultSegmentedControl
{
    self.defaultSegmentedControl.momentary = YES;

    [self.defaultSegmentedControl setEnabled: NO forSegmentAtIndex: 0];

    [self.defaultSegmentedControl addTarget: self action: @selector(selectedSegmentDidChange:) forControlEvents: UIControlEventValueChanged];
}

- (void)configureTintedSegmentedControl
{
    self.tintedSegmentedControl.tintColor = [UIColor uiElementBlueColor];

    self.tintedSegmentedControl.selectedSegmentIndex = 1;

    [self.tintedSegmentedControl addTarget:self action:@selector(selectedSegmentDidChange:) forControlEvents:UIControlEventValueChanged];
}

- (void)configureCustomSegmentsSegmentedControl
{
    NSDictionary* imageToAccesssibilityLabelMappings = @{ @"checkmark_icon": @"Done",
														  @"search_icon": @"Search",
														  @"tools_icon": @"Settings" };

    // Guarantee that the segments show up in the same order.
    NSArray* sortedSegmentImageNames = [[imageToAccesssibilityLabelMappings allKeys] sortedArrayUsingSelector: @selector(localizedCaseInsensitiveCompare:)];

    [sortedSegmentImageNames enumerateObjectsUsingBlock: ^(NSString* segmentImageName, NSUInteger idx, BOOL* stop)
	{
        UIImage *image = [UIImage imageNamed:segmentImageName];

        image.accessibilityLabel = imageToAccesssibilityLabelMappings[segmentImageName];
	
        [self.customSegmentsSegmentedControl setImage: image forSegmentAtIndex: idx];
    }];

    self.customSegmentsSegmentedControl.selectedSegmentIndex = 0;

    [self.customSegmentsSegmentedControl addTarget: self action: @selector(selectedSegmentDidChange:) forControlEvents: UIControlEventValueChanged];
}

- (void) configureCustomBackgroundSegmentedControl
{
    self.customBackgroundSegmentedControl.selectedSegmentIndex = 2;

    [self.customBackgroundSegmentedControl setBackgroundImage: [UIImage imageNamed: @"stepper_and_segment_background"] forState: UIControlStateNormal barMetrics: UIBarMetricsDefault];

    [self.customBackgroundSegmentedControl setBackgroundImage: [UIImage imageNamed: @"stepper_and_segment_background_disabled"] forState: UIControlStateDisabled barMetrics: UIBarMetricsDefault];

    [self.customBackgroundSegmentedControl setBackgroundImage: [UIImage imageNamed: @"stepper_and_segment_background_highlighted"] forState: UIControlStateHighlighted barMetrics: UIBarMetricsDefault];

    [self.customBackgroundSegmentedControl setDividerImage: [UIImage imageNamed: @"stepper_and_segment_segment_divider"] forLeftSegmentState: UIControlStateNormal rightSegmentState: UIControlStateNormal barMetrics:UIBarMetricsDefault];

    UIFontDescriptor *captionFontDescriptor = [UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleCaption1];
    UIFont* font = [UIFont fontWithDescriptor:captionFontDescriptor size:0];

    NSDictionary* normalTextAttributes = @{ NSForegroundColorAttributeName : [UIColor uiElementPurpleColor],
											NSFontAttributeName : font};
    [self.customBackgroundSegmentedControl setTitleTextAttributes: normalTextAttributes forState: UIControlStateNormal];

    NSDictionary* highlightedTextAttributes = @{ NSForegroundColorAttributeName : [UIColor uiElementGreenColor],
												  NSFontAttributeName : font };
    [self.customBackgroundSegmentedControl setTitleTextAttributes: highlightedTextAttributes forState: UIControlStateHighlighted];

    [self.customBackgroundSegmentedControl addTarget: self action: @selector(selectedSegmentDidChange:) forControlEvents:UIControlEventValueChanged];
}

#pragma mark - Actions

- (void) selectedSegmentDidChange: (UISegmentedControl*) segmentedControl
{
    NSLog(@"The selected segment changed for: %@.", segmentedControl);
}

@end
