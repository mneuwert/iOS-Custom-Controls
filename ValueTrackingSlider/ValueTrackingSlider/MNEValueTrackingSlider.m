//
//  CustomSlider.m
//  Measures
//
//  Created by Michael Neuwert on 4/26/11.
//  Copyright 2011 Neuwert Media. All rights reserved.
//

#import "MNEValueTrackingSlider.h"
#import "MNEValuePopupView.h"

@implementation MNEValueTrackingSlider

@synthesize thumbRect, valuePopupView;

#pragma mark - Private methods

- (void)_constructSlider {
    valuePopupView = [[MNESliderValuePopupView alloc] initWithFrame:CGRectZero];
    valuePopupView.backgroundColor = [UIColor clearColor];
    valuePopupView.alpha = 0.0;
    [self addSubview:valuePopupView];
}

- (void)_fadePopupViewInAndOut:(BOOL)aFadeIn {
	[UIView animateWithDuration:0.5
						  delay:0.0
						options:UIViewAnimationOptionAllowUserInteraction
					 animations:^{
						 valuePopupView.alpha = (aFadeIn) ? 1.0 : 0.0;
					 } completion:nil];
}

- (void)_positionAndUpdatePopupView {
    CGRect _thumbRect = self.thumbRect;
    CGRect popupRect = CGRectOffset(_thumbRect, 0, -floorf(_thumbRect.size.height * 1.5));
	popupRect = CGRectInset(popupRect, -20, -10);
    
	if (popupRect.origin.x < 1)
		popupRect.origin.x = 1;
	else if (CGRectGetMaxX(popupRect) > CGRectGetMaxX(self.superview.bounds))
		popupRect.origin.x = CGRectGetMaxX(self.superview.bounds) - CGRectGetWidth(popupRect) - 1.0;
    
	valuePopupView.arrowOffset = CGRectGetMidX(_thumbRect) - CGRectGetMidX(popupRect);
    valuePopupView.frame = popupRect;
    valuePopupView.value = (NSInteger)self.value;
}

#pragma mark - Memory management

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _constructSlider];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self _constructSlider];
    }
    return self;
}

#pragma mark - UIControl touch event tracking

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    // Fade in and update the popup view
    CGPoint touchPoint = [touch locationInView:self];
    // Check if the knob is touched. Only in this case show the popup-view
    if(CGRectContainsPoint(CGRectInset(self.thumbRect, -14.0, -12.0), touchPoint)) {
        [self _positionAndUpdatePopupView];
        [self _fadePopupViewInAndOut:YES];
    }
    return [super beginTrackingWithTouch:touch withEvent:event];
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    // Update the popup view as slider knob is being moved
    // let the slider update it's coordinate first
    bool value = [super continueTrackingWithTouch:touch withEvent:event];
    // now reposition the popup view
    [self _positionAndUpdatePopupView];
    return value;
}

- (void)cancelTrackingWithEvent:(UIEvent *)event {
    [super cancelTrackingWithEvent:event];
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    // Fade out the popoup view
    [self _fadePopupViewInAndOut:NO];
    [super endTrackingWithTouch:touch withEvent:event];
}

#pragma mark - Custom property accessors

- (CGRect)thumbRect {
    CGRect trackRect = [self trackRectForBounds:self.bounds];
    CGRect thumbR = [self thumbRectForBounds:self.bounds
                                   trackRect:trackRect
                                       value:self.value];
    return thumbR;
}

@end