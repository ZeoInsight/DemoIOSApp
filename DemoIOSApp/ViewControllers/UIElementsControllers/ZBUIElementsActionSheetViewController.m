//
//  ZBUIElementsActionSheetViewController.m
//  DemoIOSApp
//
//  Created by Igor Bezpaliy on 5/14/14.
//  Copyright (c) 2014 com.zeo. All rights reserved.
//

#import "ZBUIElementsActionSheetViewController.h"

// Corresponds to the row in the action sheet section.
typedef NS_ENUM(NSInteger, ZBUIElementsActionSheetsViewControllerTableRow)
{
    ZBUIElementsAlertsViewControllerActionSheetRowOkayCancel = 0,
    ZBUIElementsAlertsViewControllerActionSheetRowOther
};

@interface ZBUIElementsActionSheetViewController() <UIActionSheetDelegate>

@end

@implementation ZBUIElementsActionSheetViewController

// Show a dialog with an "Okay" and "Cancel" button.
- (void) showOkayCancelActionSheet
{
    NSString* cancelButtonTitle = @"Cancel";
    NSString* destructiveButtonTitle = @"OK";

	UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle: nil delegate: self
													cancelButtonTitle: cancelButtonTitle destructiveButtonTitle: destructiveButtonTitle otherButtonTitles:nil];

	actionSheet.actionSheetStyle = UIActionSheetStyleDefault;

	[actionSheet showInView: self.view];
}

// Show a dialog with two custom buttons.
- (void) showOtherActionSheet
{
    NSString* destructiveButtonTitle = @"Destructive Choice";
    NSString* otherButtonTitle = @"Safe Choice";

	UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle: nil delegate: self
													cancelButtonTitle: nil destructiveButtonTitle: destructiveButtonTitle otherButtonTitles: otherButtonTitle, nil];

	actionSheet.actionSheetStyle = UIActionSheetStyleDefault;

	[actionSheet showInView: self.view];
}

#pragma mark - UIActionSheetDelegate

- (void) actionSheet: (UIActionSheet*) actionSheet clickedButtonAtIndex: (NSInteger) buttonIndex
{
    if (actionSheet.destructiveButtonIndex == buttonIndex)
	{
        NSLog(@"Action sheet clicked with the destructive button index.");
    }
    else if (actionSheet.cancelButtonIndex == buttonIndex)
	{
        NSLog(@"Action sheet clicked with the cancel button index.");
    }
    else
	{
        NSLog(@"Action sheet clicked with button at index %ld.", (long)buttonIndex);
    }
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath: (NSIndexPath*) indexPath
{
    ZBUIElementsActionSheetsViewControllerTableRow row = indexPath.row;

    switch (row)
	{
        case ZBUIElementsAlertsViewControllerActionSheetRowOkayCancel:
            [self showOkayCancelActionSheet];
            break;
        case ZBUIElementsAlertsViewControllerActionSheetRowOther:
            [self showOtherActionSheet];
            break;
        default:
            break;
    }

    [tableView deselectRowAtIndexPath: indexPath animated: YES];
}

@end
