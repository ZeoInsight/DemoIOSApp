//
//  ZBUIElementsPageControlViewController.m
//  DemoIOSApp
//
//  Created by Igor Bezpaliy on 5/20/14.
//  Copyright (c) 2014 com.zeo. All rights reserved.
//

#import "ZBUIElementsPageControlViewController.h"
#import "UIColor+ZBUIElements.h"

@interface ZBUIElementsPageControlViewController ()

@property (nonatomic, weak) IBOutlet UIPageControl* pageControl;

@property (nonatomic, weak) IBOutlet UIView* colorView;
@property (nonatomic, strong) NSArray* colors;

@end

@implementation ZBUIElementsPageControlViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Set a list of colors that correspond to the selected page.
    self.colors = @[ [UIColor blackColor],
					 [UIColor grayColor],
					 [UIColor redColor],
					 [UIColor greenColor],
					 [UIColor blueColor],
					 [UIColor cyanColor],
					 [UIColor yellowColor],
					 [UIColor magentaColor],
					 [UIColor orangeColor],
					 [UIColor purpleColor]];

    [self configurePageControl];
    [self pageControlValueDidChange];
}

#pragma mark - Configuration

- (void)configurePageControl
{
    // The total number of pages that are available is based on how many available colors we have.
    self.pageControl.numberOfPages = [self.colors count];
    self.pageControl.currentPage = 2;

    self.pageControl.tintColor = [UIColor uiElementBlueColor];
    self.pageControl.pageIndicatorTintColor = [UIColor uiElementGreenColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor uiElementPurpleColor];

    [self.pageControl addTarget:self action:@selector(pageControlValueDidChange) forControlEvents:UIControlEventValueChanged];
}

#pragma mark - Actions

- (void)pageControlValueDidChange
{
    NSLog(@"The page control changed its current page to %ld.", (long)self.pageControl.currentPage);

    self.colorView.backgroundColor = self.colors[self.pageControl.currentPage];
}

@end
