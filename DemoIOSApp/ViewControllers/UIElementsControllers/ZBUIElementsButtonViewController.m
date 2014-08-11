//
//  ZBUIElementsButtonViewController.m
//  DemoIOSApp
//
//  Created by Igor Bezpaliy on 5/19/14.
//  Copyright (c) 2014 com.zeo. All rights reserved.
//

#import "ZBUIElementsButtonViewController.h"
#import "UIColor+ZBUIElements.h"

@interface ZBUIElementsButtonViewController ()

@property (nonatomic, weak) IBOutlet UIButton* systemTextButton;
@property (nonatomic, weak) IBOutlet UIButton* systemContactAddButton;
@property (nonatomic, weak) IBOutlet UIButton* systemDetailDisclosureButton;
@property (nonatomic, weak) IBOutlet UIButton* imageButton;
@property (nonatomic, weak) IBOutlet UIButton* attributedTextButton;

@end

@implementation ZBUIElementsButtonViewController

- (void) viewDidLoad
{
    [super viewDidLoad];

    // All of the buttons are created in the storyboard, but configured below.
    [self configureSystemTextButton];
    [self configureSystemContactAddButton];
    [self configureSystemDetailDisclosureButton];
    [self configureImageButton];
    [self configureAttributedTextSystemButton];
}

#pragma mark - Configuration

- (void)configureSystemTextButton
{
    [self.systemTextButton setTitle: @"Button" forState: UIControlStateNormal];

    [self.systemTextButton addTarget: self action: @selector(buttonClicked:) forControlEvents: UIControlEventTouchUpInside];
}

- (void)configureSystemContactAddButton
{
    self.systemContactAddButton.backgroundColor = [UIColor clearColor];

    [self.systemContactAddButton addTarget: self action: @selector (buttonClicked:) forControlEvents: UIControlEventTouchUpInside];
}

- (void)configureSystemDetailDisclosureButton
{
    self.systemDetailDisclosureButton.backgroundColor = [UIColor clearColor];

    [self.systemDetailDisclosureButton addTarget: self action: @selector(buttonClicked:) forControlEvents: UIControlEventTouchUpInside];
}

- (void)configureImageButton
{
    // To create this button in code you can use +[UIButton buttonWithType:] with a parameter value of UIButtonTypeCustom.

    // Remove the title text.
    [self.imageButton setTitle: @"" forState: UIControlStateNormal];

    self.imageButton.tintColor = [UIColor uiElementPurpleColor];

    [self.imageButton setImage: [UIImage imageNamed: @"x_icon"] forState:UIControlStateNormal];

    // Add an accessibility label to the image.
    self.imageButton.accessibilityLabel = @"X Button";

    [self.imageButton addTarget: self action: @selector(buttonClicked:) forControlEvents: UIControlEventTouchUpInside];
}

- (void)configureAttributedTextSystemButton
{
    NSDictionary* titleAttributes = @{ NSForegroundColorAttributeName : [UIColor uiElementBlueColor],
									   NSStrikethroughStyleAttributeName: @(NSUnderlineStyleSingle) };
    NSAttributedString* attributedTitle = [[NSAttributedString alloc] initWithString: @"Button" attributes: titleAttributes];
    [self.attributedTextButton setAttributedTitle:attributedTitle forState:UIControlStateNormal];

    NSDictionary* highlightedTitleAttributes = @{ NSForegroundColorAttributeName : [UIColor uiElementGreenColor],
												  NSStrikethroughStyleAttributeName: @(NSUnderlineStyleThick) };
    NSAttributedString* highlightedAttributedTitle = [[NSAttributedString alloc] initWithString: @"Button" attributes:highlightedTitleAttributes];
    [self.attributedTextButton setAttributedTitle: highlightedAttributedTitle forState: UIControlStateHighlighted];

    [self.attributedTextButton addTarget: self action: @selector(buttonClicked:) forControlEvents: UIControlEventTouchUpInside];
}

#pragma mark - Actions

// Handler for all of AAPLButtonViewController's UIButton actions.
- (void)buttonClicked: (UIButton*) button
{
    NSLog(@"A button was clicked: %@.", button);
}

@end
