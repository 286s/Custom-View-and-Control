//
//  CustomMagnifiedTransition.h
//
//  Created by Antonio081014 on 9/20/15.
//  Copyright © 2015 Antonio081014.com. All rights reserved.
//

@import UIKit;
@import Foundation;

@interface CustomMagnifiedTransition : NSObject <UIViewControllerAnimatedTransitioning>
@property (nonatomic, copy) UIColor *backgroundColor;
@property (nonatomic, getter=isPresenting) BOOL presenting;
@end
