//
//  ZBUIElementsStepperViewController.m
//  DemoIOSApp
//
//  Created by Igor Bezpaliy on 5/20/14.
//  Copyright (c) 2014 com.zeo. All rights reserved.
//

#import "ZBUIElementsStepperViewController.h"
#import "UIColor+ZBUIElements.h"

@interface ZBUIElementsStepperViewController ()

@property (nonatomic, weak) IBOutlet UIStepper* defaultStepper;
@property (nonatomic, weak) IBOutlet UIStepper* tintedStepper;
@property (nonatomic, weak) IBOutlet UIStepper* customStepper;

@property (nonatomic, weak) IBOutlet UILabel* defaultStepperLabel;
@property (nonatomic, weak) IBOutlet UILabel* tintedStepperLabel;
@property (nonatomic, weak) IBOutlet UILabel* customStepperLabel;

@end

@implementation ZBUIElementsStepperViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self configureDefaultStepper];
    [self configureTintedStepper];
    [self configureCustomStepper];
}

#pragma mark - Configuration

- (void) configureDefaultStepper
{
    self.defaultStepper.value = 0;
    self.defaultStepper.minimumValue = 0;
    self.defaultStepper.maximumValue = 10;
    self.defaultStepper.stepValue = 1;

    self.defaultStepperLabel.text = [NSString stringWithFormat: @"%ld", (long) self.defaultStepper.value];
    [self.defaultStepper addTarget: self action: @selector(stepperValueDidChange:) forControlEvents: UIControlEventValueChanged];
}

- (void)configureTintedStepper
{
    self.tintedStepper.tintColor = [UIColor uiElementBlueColor];

    self.tintedStepperLabel.text = [NSString stringWithFormat: @"%ld", (long)self.tintedStepper.value];
    [self.tintedStepper addTarget: self action: @selector(stepperValueDidChange:) forControlEvents: UIControlEventValueChanged];
}

- (void)configureCustomStepper
{
    // Set the background image states.
    [self.customStepper setBackgroundImage: [UIImage imageNamed:@"stepper_and_segment_background"] forState: UIControlStateNormal];
    [self.customStepper setBackgroundImage: [UIImage imageNamed:@"stepper_and_segment_background_highlighted"] forState: UIControlStateHighlighted];
    [self.customStepper setBackgroundImage: [UIImage imageNamed:@"stepper_and_segment_background_disabled"] forState: UIControlStateDisabled];

    // Set the image which will be painted in between the two stepper segments (depends on the states of both segments).
    [self.customStepper setDividerImage: [UIImage imageNamed:@"stepper_and_segment_divider"] forLeftSegmentState: UIControlStateNormal rightSegmentState: UIControlStateNormal];

    // Set the image for the + button.
    [self.customStepper setIncrementImage: [UIImage imageNamed:@"stepper_increment"] forState: UIControlStateNormal];

    // Set the image for the - button.
    [self.customStepper setDecrementImage: [UIImage imageNamed:@"stepper_decrement"] forState: UIControlStateNormal];

    self.customStepperLabel.text = [NSString stringWithFormat: @"%ld", (long)self.customStepper.value];
    [self.customStepper addTarget: self action: @selector(stepperValueDidChange:) forControlEvents: UIControlEventValueChanged];
}

#pragma mark - Actions

- (void) stepperValueDidChange: (UIStepper*) stepper
{
    NSLog(@"A stepper changed its value: %@.", stepper);

    // Figure out which stepper was selected and update its associated label.
    UILabel *stepperLabel = nil;
    if (self.defaultStepper == stepper)
	{
        stepperLabel = self.defaultStepperLabel;
    }
    else if (self.tintedStepper == stepper)
	{
        stepperLabel = self.tintedStepperLabel;
    }
    else if (self.customStepper == stepper)
	{
        stepperLabel = self.customStepperLabel;
    }

    stepperLabel.text = [NSString stringWithFormat:@"%ld", (long)stepper.value];
}

@end
