//
//  CustomNavigationTransitions.m
//  CustomUIViewControllerTransitions
//
//  Created by Antonio081014 on 9/24/15.
//  Copyright © 2015 Antonio081014.com. All rights reserved.
//

#import "CustomNavigationTransitions.h"

@implementation CustomNavigationTransitions

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return .7f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIView *containerView = [transitionContext containerView];

    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    NSLog(@"From Frame: %@", NSStringFromCGRect(fromView.frame));
    NSLog(@"TO Frame: %@", NSStringFromCGRect(toView.frame));
    
    CGFloat direction = self.isReversed ? -1 : 1;
    CGFloat factor = -0.005;
    
    toView.layer.anchorPoint = CGPointMake(self.isReversed ? 1 : 0, 0.5);
    fromView.layer.anchorPoint = CGPointMake(self.isReversed ? 0 : 1, 0.5);
    
    CATransform3D fromViewTransform = CATransform3DMakeRotation(direction * M_PI_2, 0.0, 1.0, 0.0);
    CATransform3D toViewTransform = CATransform3DMakeRotation(-direction * M_PI_2, 0.0, 1.0, 0.0);
    
    fromViewTransform.m34 = factor;
    toViewTransform.m34 = factor;
    
    containerView.transform = CGAffineTransformMakeTranslation(direction * containerView.frame.size.width / 2.0, 0);
    
    toView.layer.transform = toViewTransform;
    [containerView addSubview:toView];
    
    NSLog(@"From Frame: %@", NSStringFromCGRect(fromView.frame));
    NSLog(@"TO Frame: %@", NSStringFromCGRect(toView.frame));
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        containerView.transform = CGAffineTransformMakeTranslation(-direction * containerView.frame.size.width / 2.0, 0);
        fromView.layer.transform = fromViewTransform;
        toView.layer.transform = CATransform3DIdentity;
    } completion:^(BOOL finished) {
        containerView.transform = CGAffineTransformIdentity;
        fromView.layer.transform = CATransform3DIdentity;
        toView.layer.transform = CATransform3DIdentity;
        fromView.layer.anchorPoint = CGPointMake(0.5, 0.5);
        toView.layer.anchorPoint = CGPointMake(0.5, 0.5);
        
        if ([transitionContext transitionWasCancelled]) {
            [toView removeFromSuperview];
        } else {
            [fromView removeFromSuperview];
        }
        
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}
@end
