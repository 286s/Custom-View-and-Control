//
//  HeartShapeLayer.m
//
//  Created by Antonio081014 on 2/11/14.
//  Copyright (c) 2014 286s. All rights reserved.
//

#import "HeartShapeLayer.h"
#import "UIBezierPath+HeartPath.h"

@interface HeartShapeLayer()
@end

@implementation HeartShapeLayer

- (instancetype)initWithWidth:(CGFloat)width AtPoint:(CGPoint)center
{
    self = [super init];
    if (self) {
//        self.width = MAX(bounds.width / (1.f + 2.f / sqrt(3.f)), bounds.height / (sqrt(3.f) + 3.f / 2.f / sqrt(3.f)));
        self.width = width;
        self.relativeCenter = center;
//        self.color = [UIColor clearColor];
//        self.boundsColor = [UIColor clearColor];
        [self setup];
    }
    return self;
}

- (void)setWidth:(CGFloat)width
{
    if (_width != width) {
        _width = width;
        [self updateLayer];
    }
}

- (void)setColor:(UIColor *)color
{
    if (_color != color) {
        _color = color;
        self.fillColor = color.CGColor;
        [self setNeedsDisplay];
    }
}

- (void)setBoundsColor:(UIColor *)boundsColor
{
    if (_boundsColor != boundsColor) {
        _boundsColor = boundsColor;
        self.strokeColor = boundsColor.CGColor;
        [self setNeedsDisplay];
    }
}

- (void)setup
{
    [self updateLayer];
}

- (void)updateLayer
{
    self.path = [UIBezierPath bezierHeartShapePathWithWidth:self.width atPoint:self.relativeCenter].CGPath;
    [self setNeedsDisplay];
}


@end
