//
//  ZBUIElementsSearchBarViewController.m
//  DemoIOSApp
//
//  Created by Igor Bezpaliy on 5/20/14.
//  Copyright (c) 2014 com.zeo. All rights reserved.
//

#import "ZBUIElementsSearchBarViewController.h"
#import "UIColor+ZBUIElements.h"

@interface ZBUIElementsSearchBarViewController () <UISearchBarDelegate>

@property (nonatomic, weak) IBOutlet UISearchBar* defaultSearchBar;
@property (nonatomic, weak) IBOutlet UISearchBar* customSearchBar;

@end

@implementation ZBUIElementsSearchBarViewController

- (void) viewDidLoad
{
    [super viewDidLoad];

    [self configureDefaultSearchBar];
    [self configureCustomSearchBar];
}

#pragma mark - Configuration

- (void) configureDefaultSearchBar
{
    self.defaultSearchBar.showsCancelButton = YES;
    self.defaultSearchBar.showsScopeBar = YES;

    self.defaultSearchBar.scopeButtonTitles = @[ @"Scope One", @"Scope Two" ];
}

- (void) configureCustomSearchBar
{
	self.customSearchBar.showsCancelButton = YES;
    self.customSearchBar.showsBookmarkButton = YES;

    self.customSearchBar.tintColor = [UIColor uiElementPurpleColor];

    self.customSearchBar.backgroundImage = [UIImage imageNamed: @"search_bar_bg"];

    // Set the bookmark image for both normal and highlighted states.
    UIImage* bookmarkImage = [UIImage imageNamed: @"bookmark_icon"];
    [self.customSearchBar setImage:bookmarkImage forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateNormal];

    UIImage* bookmarkHighlightedImage = [UIImage imageNamed:@"bookmark_icon_highlighted"];
    [self.customSearchBar setImage: bookmarkHighlightedImage forSearchBarIcon: UISearchBarIconBookmark state: UIControlStateHighlighted];
}

#pragma mark - UISearchBarDelegate

- (void) searchBar: (UISearchBar*) searchBar selectedScopeButtonIndexDidChange: (NSInteger) selectedScope
{
	if (searchBar == self.defaultSearchBar)
	{
		NSLog(@"The default search selected scope button index changed to %ld.", (long)selectedScope);
	}
	else
	{
		NSLog(@"The custom search selected scope button index changed to %ld.", (long)selectedScope);
	}
}

- (void) searchBarSearchButtonClicked: (UISearchBar*) searchBar
{
	if (searchBar == self.defaultSearchBar)
	{
		NSLog(@"The default search bar keyboard search button was tapped: %@.", searchBar.text);
	}
	else
	{
		NSLog(@"The custom search bar keyboard search button was tapped: %@.", searchBar.text);
	}

    [searchBar resignFirstResponder];
}

- (void) searchBarCancelButtonClicked: (UISearchBar*) searchBar
{
	if (searchBar == self.defaultSearchBar)
	{
		NSLog(@"The default search bar cancel button was tapped.");
	}
	else
	{
		NSLog(@"The custom search bar cancel button was tapped.");
	}

    [searchBar resignFirstResponder];
}

- (void) searchBarBookmarkButtonClicked: (UISearchBar*) searchBar
{
    NSLog(@"The custom bookmark button inside the search bar was tapped.");
}

@end
