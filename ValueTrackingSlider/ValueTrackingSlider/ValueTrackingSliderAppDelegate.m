//
//  ValueTrackingSliderAppDelegate.m
//  ValueTrackingSlider
//
//  Created by Michael Neuwert on 4/27/11.
//  Copyright 2011 Neuwert-Media.com. All rights reserved.
//

#import "ValueTrackingSliderAppDelegate.h"

#import "ValueTrackingSliderViewController.h"

@implementation ValueTrackingSliderAppDelegate


@synthesize window=_window;

@synthesize viewController=_viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
     
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

@end
