//
//  ZBUIElementsPickerViewController.m
//  DemoIOSApp
//
//  Created by Igor Bezpaliy on 5/20/14.
//  Copyright (c) 2014 com.zeo. All rights reserved.
//

#import "ZBUIElementsPickerViewController.h"

typedef NS_ENUM(NSInteger, ZBUIPickerViewControllerColorComponent)
{
    ZBUIColorComponentRed = 0,
    ZBUIColorComponentGreen,
    ZBUIColorComponentBlue,
    ZBUIColorComponentCount
};

// The maximum RGB color
#define RGB_MAX 255.0

@interface ZBUIElementsPickerViewController () <UIPickerViewDataSource, UIPickerViewDelegate, UIPickerViewAccessibilityDelegate>

@property (nonatomic, weak) IBOutlet UIPickerView* pickerView;
@property (nonatomic, weak) IBOutlet UIView* colorSwatchView;

@property (nonatomic) CGFloat redColorComponent;
@property (nonatomic) CGFloat greenColorComponent;
@property (nonatomic) CGFloat blueColorComponent;

@end

@implementation ZBUIElementsPickerViewController

- (void) viewDidLoad
{
    [super viewDidLoad];

    // Show that a given row is selected. This is off by default.
    self.pickerView.showsSelectionIndicator = YES;

    [self configurePickerView];
}

// The offset of each color value (from 0 to 255) for red, green, and blue.
- (NSInteger) colorValueOffset
{
    return 5;
}

- (NSInteger) numberOfColorValuesPerComponent
{
    return (NSInteger)ceil(RGB_MAX / (CGFloat)[self colorValueOffset]) + 1;
}

- (void) updateColorSwatchViewBackgroundColor {
    self.colorSwatchView.backgroundColor = [UIColor colorWithRed:self.redColorComponent green:self.greenColorComponent blue:self.blueColorComponent alpha:1];
}

#pragma mark - Configuration

- (void)configurePickerView
{
    // Set the default selected rows (the desired rows to initially select will vary by use case).
    [self selectRowInPickerView: 13 withColorComponent: ZBUIColorComponentRed];
    [self selectRowInPickerView: 41 withColorComponent: ZBUIColorComponentGreen];
    [self selectRowInPickerView: 24 withColorComponent: ZBUIColorComponentBlue];
}

- (void) selectRowInPickerView: (NSInteger) row withColorComponent: (ZBUIPickerViewControllerColorComponent) colorComponent
{
    // Note that the delegate method on UIPickerViewDelegate is not triggered when manually calling -[UIPickerView selectRow:inComponent:animated:].
    // To do this, we fire off the delegate method manually.
    [self.pickerView selectRow:row inComponent: (NSInteger)colorComponent animated:YES];
    [self pickerView: self.pickerView didSelectRow:row inComponent:(NSInteger)colorComponent];
}

#pragma mark - RGB Color Setter Overrides

- (void) setRedColorComponent: (CGFloat) redColorComponent
{
    if (_redColorComponent != redColorComponent)
	{
        _redColorComponent = redColorComponent;
        [self updateColorSwatchViewBackgroundColor];
    }
}

- (void)setGreenColorComponent: (CGFloat) greenColorComponent
{
    if (_greenColorComponent != greenColorComponent)
	{
        _greenColorComponent = greenColorComponent;
        [self updateColorSwatchViewBackgroundColor];
    }
}

- (void)setBlueColorComponent: (CGFloat) blueColorComponent
{
    if (_blueColorComponent != blueColorComponent)
	{
        _blueColorComponent = blueColorComponent;
        [self updateColorSwatchViewBackgroundColor];
    }
}

#pragma mark - UIPickerViewDataSource

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return ZBUIColorComponentCount;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self numberOfColorValuesPerComponent];
}


#pragma mark - UIPickerViewDelegate

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSInteger colorValue = row * [self colorValueOffset];
	
    CGFloat colorComponent = (CGFloat)colorValue / RGB_MAX;
    CGFloat redColorComponent = 0;
    CGFloat greenColorComponent = 0;
    CGFloat blueColorComponent = 0;
	
    switch (component) {
        case ZBUIColorComponentRed:
            redColorComponent = colorComponent;
            break;
        case ZBUIColorComponentGreen:
            greenColorComponent = colorComponent;
            break;
        case ZBUIColorComponentBlue:
            blueColorComponent = colorComponent;
            break;
        default:
            NSLog(@"Invalid row/component combination for picker view.");
            break;
    }
	
    UIColor *foregroundColor = [UIColor colorWithRed:redColorComponent green:greenColorComponent blue:blueColorComponent alpha:1];

    NSString *titleText = [NSString stringWithFormat:@"%ld", (long)colorValue];

    // Set the foreground color for the attributed string.
    NSDictionary *attributes = @{NSForegroundColorAttributeName: foregroundColor};
    NSAttributedString *title = [[NSAttributedString alloc] initWithString:titleText attributes:attributes];

    return title;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    CGFloat colorComponentValue = ((CGFloat)[self colorValueOffset] * row)/RGB_MAX;

    switch (component)
	{
        case ZBUIColorComponentRed:
            self.redColorComponent = colorComponentValue;
            break;

        case ZBUIColorComponentGreen:
            self.greenColorComponent = colorComponentValue;
            break;

        case ZBUIColorComponentBlue:
            self.blueColorComponent = colorComponentValue;
            break;

        default:
            NSLog(@"Invalid row/component combination selected for picker view.");
            break;
    }
}

#pragma mark - UIPickerViewAccessibilityDelegate

- (NSString*) pickerView:(UIPickerView *)pickerView accessibilityLabelForComponent:(NSInteger)component
{
	NSString* accessibilityLabel = nil;

    switch (component)
	{
        case ZBUIColorComponentRed:
            accessibilityLabel = @"Red color component value";
            break;

        case ZBUIColorComponentGreen:
            accessibilityLabel = @"Green color component value";
            break;

        case ZBUIColorComponentBlue:
            accessibilityLabel = @"Blue color component value";
            break;

        default:
            NSLog(@"Invalid row/component combination for picker view.");
            break;
    }

    return accessibilityLabel;
}


@end
