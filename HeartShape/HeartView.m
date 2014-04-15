//
//  HeartView.m
//
//  Created by Antonio081014 on 2/11/14.
//  Copyright (c) 2014 286s. All rights reserved.
//
//  This class demostrates how to apply the HeartShapeLayer to the view, so a heart shaped view could be displayed.
//  Simply adding the Heart Shape Layer to your view layer's mask.

#import "HeartView.h"
#import "HeartShapeLayer.h"

@interface HeartView()
@property (strong, nonatomic) HeartShapeLayer *heartLayer;
@end

@implementation HeartView

// Set the width of the HeartShapeLayer, Height is calculated based on the width.
- (void)setWidth:(CGFloat)width
{
    if (_width != width) {
        _width = width;
        _heartLayer.width = width;
        [self setNeedsDisplay];
    }
}


- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setup];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setup];
    }
    return self;
}

// Initial Setup
- (void)setup
{
    self.backgroundColor = [UIColor yellowColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pictureName.jpg"]];
    imageView.frame = self.bounds;
    imageView.layer.mask = self.heartLayer;
    [self addSubview:imageView];
}

// Lazy Initialization;
- (HeartShapeLayer *)heartLayer
{
    if (!_heartLayer) {
        CGPoint center = CGPointMake(self.bounds.size.width / 2.f, self.bounds.size.height / 2.f);
        center.y -= .3f * MIN(CGRectGetHeight(self.bounds), CGRectGetWidth(self.bounds));
        _heartLayer = [[HeartShapeLayer alloc] initWithWidth:MIN(self.bounds.size.width, self.bounds.size.height) AtPoint:center];
        _heartLayer.boundsColor = [UIColor redColor];
    }
    return _heartLayer;
}


@end
