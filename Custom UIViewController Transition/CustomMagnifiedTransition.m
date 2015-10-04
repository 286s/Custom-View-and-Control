//
//  CustomMagnifiedTransition.m
//
//  Created by Antonio081014 on 9/20/15.
//  Copyright © 2015 Antonio081014.com. All rights reserved.
//

#import "CustomMagnifiedTransition.h"

@implementation CustomMagnifiedTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return .7f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)ctx {
    UIView *from = [ctx viewForKey:UITransitionContextFromViewKey];
    UIView *to = [ctx viewForKey:UITransitionContextToViewKey];
    UIView *container = [ctx containerView];
    
    [container addSubview:to];
    
    to.alpha = 0.f;
    to.transform = CGAffineTransformMakeScale(0.1, 0.1);
    
    [UIView animateKeyframesWithDuration:[self transitionDuration:ctx] delay:0 options:0 animations:^{
        from.transform = CGAffineTransformMakeScale(0.1, 0.1);
        from.alpha = 0.f;
        to.alpha = 1.f;
        to.transform = CGAffineTransformIdentity;
        to.backgroundColor = self.backgroundColor;
    } completion:^(BOOL finished) {
        if ([ctx transitionWasCancelled]) {
            [to removeFromSuperview];
        } else {
            [from removeFromSuperview];
        }
        
        [ctx completeTransition:![ctx transitionWasCancelled]];
    }];
    
}
@end
