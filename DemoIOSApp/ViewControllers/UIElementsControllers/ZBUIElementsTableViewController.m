//
//  ZBUIElementsTableViewController.m
//  DemoIOSApp
//
//  Created by Igor Bezpaliy on 5/22/14.
//  Copyright (c) 2014 com.zeo. All rights reserved.
//

#import "ZBUIElementsTableViewController.h"

@interface ZBUIElementsTableViewController ()

@end

@implementation ZBUIElementsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	_tableData = [[NSMutableArray alloc] initWithObjects:
				  @{ @"text" : @"Ukrainian", @"iconName" : @"uk"},
				  @{ @"text" : @"Afrikaans", @"iconName" : @"af"},
				  @{ @"text" : @"Albanian", @"iconName" : @"sq"},
				  @{ @"text" : @"Amharic", @"iconName" : @"am"},
				  @{ @"text" : @"Arabic", @"iconName" : @"ar"},
				  @{ @"text" : @"Armenian", @"iconName" : @"hy"},
				  @{ @"text" : @"Belarusian", @"iconName" : @"be"},
				  @{ @"text" : @"Bengali", @"iconName" : @"bn"},
				  @{ @"text" : @"Chinese", @"iconName" : @"zh"},
				  @{ @"text" : @"Croatian", @"iconName" : @"hr"},
				  @{ @"text" : @"Crech", @"iconName" : @"cs"},
				  @{ @"text" : @"Danish", @"iconName" : @"da"},
				  @{ @"text" : @"English", @"iconName" : @"en"},
				  @{ @"text" : @"French", @"iconName" : @"fr"},
				  @{ @"text" : @"German", @"iconName" : @"de"},
				  @{ @"text" : @"Japanese", @"iconName" : @"ja"}, nil];
	
	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action: @selector(insertNewObject:)];
	self.navigationItem.rightBarButtonItem = addButton;
	self.detailViewController = (ZBUIElementsDetailsTableViewController*)[[self.splitViewController.viewControllers lastObject] topViewController];

}

#pragma mark - Table view data source

- (NSInteger) tableView: (UITableView*) tableView numberOfRowsInSection: (NSInteger) section
{
    return [_tableData count];
}

- (UITableViewCell*) tableView: (UITableView*) tableView cellForRowAtIndexPath: (NSIndexPath*) indexPath
{
	static NSString* simpleTableIdentifier = @"Cell";
	UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];

    if (cell == nil)
	{
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: simpleTableIdentifier];
    }

    cell.textLabel.text = [[_tableData objectAtIndex: indexPath.row] objectForKey: @"text"];
	NSString* imageName = [[_tableData objectAtIndex: indexPath.row] objectForKey: @"iconName"];
    cell.imageView.image = [UIImage imageNamed: imageName];

    return cell;
}

- (void) tableView: (UITableView*) tableView commitEditingStyle: (UITableViewCellEditingStyle) editingStyle forRowAtIndexPath: (NSIndexPath*) indexPath
{
    // Remove the row from data model
    [_tableData removeObjectAtIndex:indexPath.row];

    // Request table view to reload
    [tableView reloadData];
}

- (void) insertNewObject: (id) sender
{
	NSString* title = @"Add new item";
    NSString* message = @"Please enter name of new country.";
    NSString* cancelButtonTitle = @"Cancel";
    NSString* otherButtonTitle = @"OK";

	UIAlertView *alert = [[UIAlertView alloc] initWithTitle: title message: message delegate: self cancelButtonTitle: cancelButtonTitle otherButtonTitles: otherButtonTitle, nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;

    [alert show];

}

- (void) alertView: (UIAlertView*) alertView clickedButtonAtIndex: (NSInteger) buttonIndex
{
    if (alertView.cancelButtonIndex != buttonIndex)
	{
		[_tableData insertObject: @{ @"text" : [alertView textFieldAtIndex: 0].text, @"iconName" : @"languages"} atIndex: 0];
		NSIndexPath *indexPath = [NSIndexPath indexPathForRow: 0 inSection: 0];
		[self.tableView insertRowsAtIndexPaths: @[indexPath] withRowAnimation: UITableViewRowAnimationAutomatic];
    }
}

- (void) prepareForSegue: (UIStoryboardSegue*) segue sender: (id) sender
{
    if ([[segue identifier] isEqualToString: @"showDetail"])
	{
		UITableViewCell* cell = (UITableViewCell*) sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell: cell];
		NSDictionary* item = _tableData[indexPath.row];
		[[segue destinationViewController] setItem: item];
    }
}

@end
