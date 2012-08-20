#import "MNEValuePopupView.h"

@implementation MNESliderValuePopupView

@synthesize value=_value;
@synthesize font=_font;
@synthesize text = _text;
@synthesize arrowOffset = _arrowOffset;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont boldSystemFontOfSize:18];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    // Set the fill color
	[[UIColor colorWithWhite:0 alpha:0.8] setFill];
    
    // Create the path for the rounded rectangle
    CGRect roundedRect = CGRectMake(self.bounds.origin.x + 3.0, self.bounds.origin.y, self.bounds.size.width - 6.0, floorf(self.bounds.size.height * 0.8));
    UIBezierPath *roundedRectPath = [UIBezierPath bezierPathWithRoundedRect:roundedRect cornerRadius:6.0];
    
    // Create the arrow path
    UIBezierPath *arrowPath = [UIBezierPath bezierPath];
    
	// Make sure the arrow offset is nice
	if (-self.arrowOffset + 1 > CGRectGetMidX(self.bounds) / 2)
		self.arrowOffset = -CGRectGetMidX(self.bounds) / 2 + 1;
	if (self.arrowOffset > CGRectGetMidX(self.bounds) / 2)
		self.arrowOffset = CGRectGetMidX(self.bounds) / 2 -1;
    
    CGFloat midX = CGRectGetMidX(self.bounds) + self.arrowOffset;
    
    CGPoint p0 = CGPointMake(midX, CGRectGetMaxY(self.bounds) - 1.0);
    [arrowPath moveToPoint:p0];
    [arrowPath addLineToPoint:CGPointMake((midX - 10.0), CGRectGetMaxY(roundedRect))];
    [arrowPath addLineToPoint:CGPointMake((midX + 10.0), CGRectGetMaxY(roundedRect))];
    [arrowPath closePath];
    
    // Attach the arrow path to the rounded rect
    [roundedRectPath appendPath:arrowPath];
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetShadow(context, CGSizeMake(0.0, 1.0), 2.0);
	CGContextSetShadowWithColor(context, CGSizeMake(0.0, 1.0), 2.5, [UIColor blackColor].CGColor);
    [roundedRectPath fill];
    
    // Draw the text
    if (self.text) {
        [[UIColor colorWithWhite:1 alpha:0.8] set];
        CGSize s = [_text sizeWithFont:self.font];
        CGFloat yOffset = (roundedRect.size.height - s.height) / 2;
        CGRect textRect = CGRectMake(roundedRect.origin.x, yOffset, roundedRect.size.width, s.height);
        
        [_text drawInRect:textRect
                 withFont:self.font
            lineBreakMode:UILineBreakModeWordWrap
                alignment:UITextAlignmentCenter];
    }
}

- (void)setValue:(float)aValue {
    _value = aValue;
    self.text = [NSString stringWithFormat:@"%4.2f", _value];
    [self setNeedsDisplay];
}

@end