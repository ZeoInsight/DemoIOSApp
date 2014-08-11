//
//  ZBUIElementsAlertViewController.m
//  DemoIOSApp
//
//  Created by Igor Bezpaliy on 5/14/14.
//  Copyright (c) 2014 com.zeo. All rights reserved.
//

#import "ZBUIElementsAlertViewController.h"

// Corresponds to the row in the alert view section.
typedef NS_ENUM(NSInteger, ZBUIElementsAlertsViewControllerTableRow) {
    ZBUIElementsAlertsViewControllerAlertViewRowSimple = 0,
    ZBUIElementsAlertsViewControllerAlertViewRowOkayCancel,
    ZBUIElementsAlertsViewControllerAlertViewRowOther,
    ZBUIElementsAlertsViewControllerAlertViewRowTextEntry,
    ZBUIElementsAlertsViewControllerActionSheetRowTextEntrySecure
};

@interface ZBUIElementsAlertViewController() <UIAlertViewDelegate>

@end

@implementation ZBUIElementsAlertViewController

// Show an alert with an "Okay" button.
- (void) showSimpleAlert
{
    NSString* title = @"A Short Title Is Best";
    NSString* message = @"A message should be a short, complete sentence.";
    NSString* cancelButtonTitle = @"OK";

	UIAlertView* alert = [[UIAlertView alloc] initWithTitle: title message: message delegate: self cancelButtonTitle: cancelButtonTitle otherButtonTitles: nil];

	[alert show];
}

// Show an alert with an "Okay" and "Cancel" button.
- (void) showOkayCancelAlert
{
    NSString* title = @"A Short Title Is Best";
    NSString* message = @"A message should be a short, complete sentence.";
    NSString* cancelButtonTitle = @"Cancel";
    NSString* otherButtonTitle = @"OK";

	UIAlertView *alert = [[UIAlertView alloc] initWithTitle: title message: message delegate: self cancelButtonTitle: cancelButtonTitle otherButtonTitles: otherButtonTitle, nil];

	[alert show];
}

// Show an alert with two custom buttons.
- (void) showOtherAlert
{
    NSString* title = @"A Short Title Is Best";
    NSString* message = @"A message should be a short, complete sentence.";
    NSString* cancelButtonTitle = @"Cancel";
    NSString* otherButtonTitleOne = @"Choice One";
    NSString* otherButtonTitleTwo = @"Choice Two";

	UIAlertView* alert = [[UIAlertView alloc] initWithTitle: title message: message delegate: self cancelButtonTitle: cancelButtonTitle otherButtonTitles: otherButtonTitleOne, otherButtonTitleTwo, nil];

	[alert show];
}

// Show a text entry alert with two custom buttons.
- (void) showTextEntryAlert
{
    NSString* title = @"A Short Title Is Best";
    NSString* message = @"A message should be a short, complete sentence.";
    NSString* cancelButtonTitle = @"Cancel";
    NSString* otherButtonTitle = @"OK";

	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitle, nil];

    alert.alertViewStyle = UIAlertViewStylePlainTextInput;

    [alert show];
}

// Show a secure text entry alert with two custom buttons.
- (void) showSecureTextEntryAlert
{
    NSString* title = @"A Short Title Is Best";
    NSString* message = @"A message should be a short, complete sentence.";
    NSString* cancelButtonTitle = @"Cancel";
    NSString* otherButtonTitle = @"OK";

	UIAlertView* alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitle, nil];

	alert.alertViewStyle = UIAlertViewStyleSecureTextInput;

    [alert show];
}

#pragma mark - UIAlertViewDelegate

- (void) alertView: (UIAlertView*) alertView clickedButtonAtIndex: (NSInteger) buttonIndex
{
    if (alertView.cancelButtonIndex == buttonIndex)
	{
        NSLog(@"Alert view clicked with the cancel button index.");
    }
    else
	{
        NSLog(@"Alert view clicked with button at index %ld.", (long)buttonIndex);
    }
}

- (BOOL)alertViewShouldEnableFirstOtherButton: (UIAlertView*) alertView
{
    // Enforce a minimum length of >= 5 characters for secure text alert views.
    if (alertView.alertViewStyle == UIAlertViewStyleSecureTextInput)
	{
        return [[alertView textFieldAtIndex:0].text length] >= 5;
    }
    return YES;
}

#pragma mark - UITableViewDelegate
// Determine the action to perform based on the selected cell.
- (void) tableView: (UITableView*) tableView didSelectRowAtIndexPath: (NSIndexPath*) indexPath
{
    ZBUIElementsAlertsViewControllerTableRow row = indexPath.row;

    switch (row)
	{
        case ZBUIElementsAlertsViewControllerAlertViewRowSimple:
            [self showSimpleAlert];
            break;
        case ZBUIElementsAlertsViewControllerAlertViewRowOkayCancel:
            [self showOkayCancelAlert];
            break;
        case ZBUIElementsAlertsViewControllerAlertViewRowOther:
            [self showOtherAlert];
            break;
        case ZBUIElementsAlertsViewControllerAlertViewRowTextEntry:
            [self showTextEntryAlert];
            break;
        case ZBUIElementsAlertsViewControllerActionSheetRowTextEntrySecure:
            [self showSecureTextEntryAlert];
            break;
        default:
            break;
    }

    [tableView deselectRowAtIndexPath: indexPath animated: YES];
}

@end
