//
//  ValueTrackingSliderAppDelegate.h
//  ValueTrackingSlider
//
//  Created by Michael Neuwert on 4/27/11.
//  Copyright 2011 Neuwert-Media.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ValueTrackingSliderViewController;

@interface ValueTrackingSliderAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet ValueTrackingSliderViewController *viewController;

@end
