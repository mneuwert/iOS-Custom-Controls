//
//  ValueTrackingSliderViewController.m
//  ValueTrackingSlider
//
//  Created by Michael Neuwert on 4/27/11.
//  Copyright 2011 Neuwert-Media.com. All rights reserved.
//

#import "ValueTrackingSliderViewController.h"

@implementation ValueTrackingSliderViewController

- (void)dealloc
{
    [slider release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    slider.minimumValue = 0;
    slider.maximumValue = 20;
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
