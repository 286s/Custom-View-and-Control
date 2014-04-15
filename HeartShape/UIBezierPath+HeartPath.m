//
//  UIBezierPath+HeartPath.m
//
//  Created by Antonio081014 on 2/11/14.
//  Copyright (c) 2014 286s. All rights reserved.
//
//  Heart Shape Drawing Ref: http://www.mathematische-basteleien.de/heart.htm
//
#import "UIBezierPath+HeartPath.h"

@implementation UIBezierPath (HeartPath)

+ (CGFloat)toRadians:(CGFloat)angle
{
    return angle / 180.f * M_PI;
}

+ (UIBezierPath *)bezierHeartShapePathWithWidth:(CGFloat)width atPoint:(CGPoint)center
{
    CGFloat w = width / 2.f;// / 1.3f;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    [path addArcWithCenter:CGPointMake(center.x - w/2.f, center.y - sqrt(3.f) * w / 6.f) radius:w / sqrt(3.f) startAngle:[self toRadians:150.f] endAngle:[self toRadians:-30.f] clockwise:YES];
    [path addArcWithCenter:CGPointMake(center.x + w/2.f, center.y - sqrt(3.f) * w / 6.f) radius:w / sqrt(3.f) startAngle:[self toRadians:-150.f] endAngle:[self toRadians:30.f] clockwise:YES];
    
    [path moveToPoint:CGPointMake(center.x - w, center.y)];
    [path addLineToPoint:CGPointMake(center.x, center.y + w * sqrt(3.f))];
    [path addLineToPoint:CGPointMake(center.x + w, center.y)];
    
    return path;
}

@end
