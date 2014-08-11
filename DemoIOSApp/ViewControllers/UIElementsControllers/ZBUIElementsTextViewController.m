//
//  ZBUIElementsTextViewController.m
//  DemoIOSApp
//
//  Created by Igor Bezpaliy on 5/20/14.
//  Copyright (c) 2014 com.zeo. All rights reserved.
//

#import "ZBUIElementsTextViewController.h"
#import "UIColor+ZBUIElements.h"

@interface ZBUIElementsTextViewController () <UITextViewDelegate>

@property (nonatomic, weak) IBOutlet UITextView* textView;
@property (nonatomic, weak) IBOutlet UITextView* textViewWithHyperlink;

@end

@implementation ZBUIElementsTextViewController

- (void) viewDidLoad
{
    [super viewDidLoad];

    [self configureTextView];
	[self configureTextViewWithHyperlink];
}

- (void) configureTextView
{
    UIFontDescriptor* bodyFontDescriptor = [UIFontDescriptor preferredFontDescriptorWithTextStyle: UIFontTextStyleBody];
    self.textView.font = [UIFont fontWithDescriptor: bodyFontDescriptor size: 0];

    self.textView.textColor = [UIColor blackColor];
    self.textView.backgroundColor = [UIColor whiteColor];
    self.textView.scrollEnabled = YES;

    // Let's modify some of the attributes of the attributed string.
    // You can modify these attributes yourself to get a better feel for what they do.
    // Note that the initial text is visible in the storyboard.
    NSMutableAttributedString* attributedText = [self.textView.attributedText mutableCopy];

    NSString* text = self.textView.text;

    // Find the range of each element to modify.
    NSRange boldRange = [text rangeOfString: @"bold"];
    NSRange highlightedRange = [text rangeOfString: @"highlighted"];
    NSRange underlinedRange = [text rangeOfString: @"underlined"];
    NSRange tintedRange = [text rangeOfString: @"tinted"];

    // Add bold.
    UIFontDescriptor *boldFontDescriptor = [self.textView.font.fontDescriptor fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold];
    UIFont *boldFont = [UIFont fontWithDescriptor:boldFontDescriptor size:0];
    [attributedText addAttribute:NSFontAttributeName value:boldFont range:boldRange];

    // Add highlight.
    [attributedText addAttribute: NSBackgroundColorAttributeName value:[UIColor uiElementGreenColor] range:highlightedRange];

    // Add underline.
    [attributedText addAttribute: NSUnderlineStyleAttributeName value:@(NSUnderlineStyleSingle) range:underlinedRange];

    // Add tint.
    [attributedText addAttribute: NSForegroundColorAttributeName value:[UIColor uiElementBlueColor] range:tintedRange];

    self.textView.attributedText = attributedText;
}

- (void) configureTextViewWithHyperlink
{
	NSMutableAttributedString* attributedText = [self.textViewWithHyperlink.attributedText mutableCopy];
    NSRange range = [self.textViewWithHyperlink.text rangeOfString: @"Touch here"];
	NSDictionary* attributes = @{ NSLinkAttributeName: [NSURL URLWithString: @"http://zeoinsight.com"],
										   NSForegroundColorAttributeName : [UIColor blueColor] };
//										   NSFontAttributeName : boldFont};

	[attributedText addAttributes: attributes range: range];
	self.textViewWithHyperlink.attributedText = attributedText;
}

#pragma mark - UITextViewDelegate

- (void) adjustTextViewSelection: (UITextView*) textView
{
    // Ensure that the text view is visible by making the text view frame smaller as text can be slightly cropped at the bottom.
    // Note that this is a workwaround to a bug in iOS.
    [textView layoutIfNeeded];

    CGRect caretRect = [textView caretRectForPosition:textView.selectedTextRange.end];
    caretRect.size.height += textView.textContainerInset.bottom;
    [textView scrollRectToVisible: caretRect animated: NO];
}

- (void) textViewDidBeginEditing: (UITextView*) textView
{
    // Provide a "Done" button for the user to select to signify completion with writing text in the text view.
    UIBarButtonItem *doneBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemDone target: self action: @selector(doneBarButtonItemClicked)];

    [self.navigationItem setRightBarButtonItem: doneBarButtonItem animated: YES];

    [self adjustTextViewSelection: textView];
}

- (void) textViewDidChangeSelection: (UITextView*) textView
{
    [self adjustTextViewSelection:textView];
}

#pragma mark - Actions

- (void) doneBarButtonItemClicked
{
    // Dismiss the keyboard by removing it as the first responder.
    [self.textView resignFirstResponder];
    [self.navigationItem setRightBarButtonItem: nil animated:YES];
}

@end
