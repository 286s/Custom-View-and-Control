//
//  CustomNavigationTransitions.h
//  CustomUIViewControllerTransitions
//
//  Created by Antonio081014 on 9/24/15.
//  Copyright © 2015 Antonio081014.com. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface CustomNavigationTransitions : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, getter=isReversed) BOOL reverse;
@end
