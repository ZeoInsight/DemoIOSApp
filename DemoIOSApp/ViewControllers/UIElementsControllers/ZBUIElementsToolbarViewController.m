//
//  ZBUIElementsToolbarViewController.m
//  DemoIOSApp
//
//  Created by Igor Bezpaliy on 5/21/14.
//  Copyright (c) 2014 com.zeo. All rights reserved.
//

#import "ZBUIElementsToolbarViewController.h"
#import "UIColor+ZBUIElements.h"

@interface ZBUIElementsToolbarViewController ()

@property (nonatomic, weak) IBOutlet UIToolbar* defaultToolbar;
@property (nonatomic, weak) IBOutlet UIToolbar* customToolbar;
@property (nonatomic, weak) IBOutlet UIToolbar* tintedToolbar;

@end

@implementation ZBUIElementsToolbarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	[self configureDefaultToolbar];
	[self configureCustomToolbar];
	[self configureTintedToolbar];
}

- (void) configureDefaultToolbar
{
    NSArray* toolbarButtonItems = @[[self trashBarButtonItem], [self flexibleSpaceBarButtonItem], [self customTitleBarButtonItem]];
    [self.defaultToolbar setItems: toolbarButtonItems animated: YES];
}

- (void) configureCustomToolbar
{
    UIImage* toolbarBackgroundImage = [UIImage imageNamed: @"toolbar_background"];
    [self.customToolbar setBackgroundImage: toolbarBackgroundImage forToolbarPosition: UIBarPositionBottom barMetrics: UIBarMetricsDefault];

    NSArray* toolbarButtonItems = @[[self customImageBarButtonItem], [self flexibleSpaceBarButtonItem], [self customBarButtonItem]];
    [self.customToolbar setItems: toolbarButtonItems animated: YES];
}

- (void) configureTintedToolbar
{
    // See the UIBarStyle enum for more styles, including UIBarStyleDefault.
    self.tintedToolbar.barStyle = UIBarStyleBlackTranslucent;

    self.tintedToolbar.tintColor = [UIColor uiElementGreenColor];
    self.tintedToolbar.backgroundColor = [UIColor uiElementBlueColor];

    NSArray *toolbarButtonItems = @[[self refreshBarButtonItem], [self flexibleSpaceBarButtonItem], [self actionBarButtonItem]];
    [self.tintedToolbar setItems:toolbarButtonItems animated:YES];
}

#pragma mark - UIBarButtonItem Creation and Configuration

- (UIBarButtonItem*) trashBarButtonItem
{
    return [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemTrash target: self action: @selector(barButtonItemClicked:)];
}

- (UIBarButtonItem*) flexibleSpaceBarButtonItem
{
    return [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace target: nil action: NULL];
}

- (UIBarButtonItem*) customTitleBarButtonItem
{
    NSString *customTitle = @"Action";

    return [[UIBarButtonItem alloc] initWithTitle: customTitle style: UIBarButtonItemStylePlain target: self action: @selector(barButtonItemClicked:)];
}

- (UIBarButtonItem*) customImageBarButtonItem
{
    UIBarButtonItem* customImageBarButtonItem = [[UIBarButtonItem alloc] initWithImage: [UIImage imageNamed:@"tools_icon"] style: UIBarButtonItemStylePlain target: self action: @selector(barButtonItemClicked:)];

    customImageBarButtonItem.tintColor = [UIColor uiElementPurpleColor];

    return customImageBarButtonItem;
}

- (UIBarButtonItem*) customBarButtonItem
{
    UIBarButtonItem* barButtonItem = [[UIBarButtonItem alloc] initWithTitle: @"Button" style: UIBarButtonItemStylePlain target: self action: @selector(barButtonItemClicked:)];

    NSDictionary* attributes = @{ NSForegroundColorAttributeName: [UIColor uiElementPurpleColor]};
    [barButtonItem setTitleTextAttributes: attributes forState: UIControlStateNormal];

    return barButtonItem;
}

- (UIBarButtonItem*) refreshBarButtonItem
{
    return [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemRefresh target: self action: @selector(barButtonItemClicked:)];
}

- (UIBarButtonItem*) actionBarButtonItem
{
    return [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemAction target: self action: @selector(barButtonItemClicked:)];
}

#pragma mark - Actions

- (void) barButtonItemClicked: (UIBarButtonItem*) barButtonItem
{
	NSLog(@"A bar button item on the default toolbar was clicked: %@.", barButtonItem);
}

@end
