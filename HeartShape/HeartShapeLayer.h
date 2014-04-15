//
//  HeartShapeLayer.h
//
//  Created by Antonio081014 on 2/11/14.
//  Copyright (c) 2014 286s. All rights reserved.
//
// This class defines the layer with a heart shape by using given size, position and color;
#import <QuartzCore/QuartzCore.h>

@interface HeartShapeLayer : CAShapeLayer

// The width of the shape;
@property (nonatomic) CGFloat width;
// The center position of the shape;
@property (nonatomic) CGPoint relativeCenter;
// The color to fill the shape;
@property (strong, nonatomic) UIColor *color;
// The color to stroke;
@property (strong, nonatomic) UIColor *boundsColor;

// Designate Initializer;
- (instancetype)initWithWidth:(CGFloat)width AtPoint:(CGPoint)center;
@end
