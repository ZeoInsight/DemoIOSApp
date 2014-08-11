//
//  ZBExampleGestureRecognizersViewController.m
//  DemoIOSApp
//
//  Created by Igor Bezpaliy on 5/21/14.
//  Copyright (c) 2014 com.zeo. All rights reserved.
//

#import "ZBExampleGestureRecognizersViewController.h"

@interface ZBExampleGestureRecognizersViewController ()

@property (nonatomic, retain) UIImageView* imageView;

@end

@implementation ZBExampleGestureRecognizersViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	self.imageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"smiley.png"]];
	[self.imageView setTranslatesAutoresizingMaskIntoConstraints: YES];
	[self.imageView setFrame: CGRectMake(100, 200, 128, 128)];
	[self.view addSubview: self.imageView];

    self.imageView.userInteractionEnabled = YES;

    UIPanGestureRecognizer* panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget: self action: @selector(panDetected:)];
    [self.imageView addGestureRecognizer: panRecognizer];

    UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget: self action: @selector(pinchDetected:)];
    [self.imageView addGestureRecognizer:pinchRecognizer];

    UIRotationGestureRecognizer *rotationRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget: self action: @selector(rotationDetected:)];
    [self.imageView addGestureRecognizer:rotationRecognizer];

    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(tapDetected:)];
    tapRecognizer.numberOfTapsRequired = 2;
    [self.imageView addGestureRecognizer:tapRecognizer];
}

- (void) panDetected: (UIPanGestureRecognizer*) panRecognizer
{
    CGPoint translation = [panRecognizer translationInView: self.view];
    CGPoint imageViewPosition = self.imageView.center;
    imageViewPosition.x += translation.x;
    imageViewPosition.y += translation.y;

    self.imageView.center = imageViewPosition;
    [panRecognizer setTranslation:CGPointZero inView:self.view];
}

- (void) pinchDetected: (UIPinchGestureRecognizer*) pinchRecognizer
{
    CGFloat scale = pinchRecognizer.scale;
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, scale, scale);
    pinchRecognizer.scale = 1.0;
}

- (void) rotationDetected: (UIRotationGestureRecognizer*) rotationRecognizer
{
    CGFloat angle = rotationRecognizer.rotation;
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, angle);
    rotationRecognizer.rotation = 0.0;
}

- (void) tapDetected: (UITapGestureRecognizer*) tapRecognizer
{
    [UIView animateWithDuration: 0.25 animations:^{
        self.imageView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
        self.imageView.transform = CGAffineTransformIdentity;
    }];
}

@end
