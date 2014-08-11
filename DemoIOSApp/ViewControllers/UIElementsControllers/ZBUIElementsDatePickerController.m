//
//  ZBUIElementsDatePickerController.m
//  DemoIOSApp
//
//  Created by Igor Bezpaliy on 5/20/14.
//  Copyright (c) 2014 com.zeo. All rights reserved.
//

#import "ZBUIElementsDatePickerController.h"

@interface ZBUIElementsDatePickerController ()

@property (nonatomic, weak) IBOutlet UIDatePicker* datePicker;
@property (nonatomic, weak) IBOutlet UILabel* dateLabel;
@property (nonatomic, strong) NSDateFormatter* dateFormatter;

@end

@implementation ZBUIElementsDatePickerController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Create a date formatter to be used to format the "date" property of "datePicker".
    self.dateFormatter = [[NSDateFormatter alloc] init];
    self.dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    self.dateFormatter.timeStyle = NSDateFormatterShortStyle;

    [self configureDatePicker];
}

#pragma mark - Configuration

- (void)configureDatePicker
{
    self.datePicker.datePickerMode = UIDatePickerModeDateAndTime;

    // Set min/max date for the date picker.
    // As an example we will limit the date between now and 7 days from now.
    NSDate* now = [NSDate date];
    self.datePicker.minimumDate = now;

    NSCalendar* currentCalendar = [NSCalendar currentCalendar];

    NSDateComponents* dateComponents = [[NSDateComponents alloc] init];
    dateComponents.day = 7;

    NSDate* sevenDaysFromNow = [currentCalendar dateByAddingComponents:dateComponents toDate:now options:0];
    self.datePicker.maximumDate = sevenDaysFromNow;

    // Display the "minutes" interval by increments of 1 minute (this is the default).
    self.datePicker.minuteInterval = 1;

    [self.datePicker addTarget: self action: @selector(updateDatePickerLabel) forControlEvents: UIControlEventValueChanged];

    [self updateDatePickerLabel];
}

#pragma mark - Actions

- (void)updateDatePickerLabel
{
    self.dateLabel.text = [self.dateFormatter stringFromDate: self.datePicker.date];
}

@end
