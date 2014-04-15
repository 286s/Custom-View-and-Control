//
//  UIBezierPath+HeartPath.h
//
//  Created by Antonio081014 on 2/11/14.
//  Copyright (c) 2014 286s. All rights reserved.
//
//  This category class of UIBezierPath defines the heart shape BezierPath by using math formula.

#import <UIKit/UIKit.h>

@interface UIBezierPath (HeartPath)

+ (UIBezierPath *)bezierHeartShapePathWithWidth:(CGFloat)width atPoint:(CGPoint)center;

@end
