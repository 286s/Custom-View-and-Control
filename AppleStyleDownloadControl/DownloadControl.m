//
//  DownloadControl.m
//  DownloadControl
//
//  Created by Antonio081014 on 4/29/15.
//  Copyright (c) 2015 antonio081014.com. All rights reserved.
//

#import "DownloadControl.h"

@implementation DownloadControl

// Specify the UIView is backed by CAShapeLayer, not other classes.
+ (Class)layerClass
{
    return [CAShapeLayer class];
}

- (void)awakeFromNib
{
    CAShapeLayer *layer = (CAShapeLayer *)self.layer;
    // init layer properties here.
    // Also, everytime to update layer property, convert it to CAShaperLayer and use a local variable for it.
    
}

@end
