//
//  CustomFoldTransitions.m
//  CustomUIViewControllerTransitions
//
//  Created by Antonio081014 on 9/29/15.
//  Copyright © 2015 Antonio081014.com. All rights reserved.
//

#import "CustomFoldTransitions.h"

static const CGFloat kMinScale = 0.001;

@implementation CustomFoldTransitions
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 3.f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *containerView = [transitionContext containerView];
    
    // Take a full snapshot of the view we're transitioning to/from
    UIView *fullSnapshot = nil;
    
    if (!self.reversed) {
        fullSnapshot = [toView snapshotViewAfterScreenUpdates:YES];
    } else {
        fullSnapshot = [fromView snapshotViewAfterScreenUpdates:NO];
    }
    
    CGRect initialFrame = [transitionContext initialFrameForViewController:fromVC];
    
    CGRect bottomLeftFrame = CGRectMake(CGRectGetMinX(initialFrame),
                                        CGRectGetMidY(initialFrame),
                                        CGRectGetWidth(initialFrame) / 2,
                                        CGRectGetHeight(initialFrame) / 2);
    UIView *snapshotBottomLeft = [fullSnapshot resizableSnapshotViewFromRect:bottomLeftFrame
                                                          afterScreenUpdates:NO
                                                               withCapInsets:UIEdgeInsetsZero];
    
    CGRect bottomRightFrame = CGRectMake(CGRectGetMidX(initialFrame),
                                         CGRectGetMidY(initialFrame),
                                         CGRectGetWidth(initialFrame) / 2,
                                         CGRectGetHeight(initialFrame) / 2);
    UIView *snapshotBottomRight = [fullSnapshot resizableSnapshotViewFromRect:bottomRightFrame
                                                           afterScreenUpdates:NO
                                                                withCapInsets:UIEdgeInsetsZero];
    
    CGRect bottomHalfFrame = CGRectMake(CGRectGetMinX(initialFrame),
                                        CGRectGetMidY(initialFrame),
                                        CGRectGetWidth(initialFrame),
                                        CGRectGetHeight(initialFrame) / 2);
    UIView *snapshotBottomHalf = [fullSnapshot resizableSnapshotViewFromRect:bottomHalfFrame
                                                          afterScreenUpdates:NO
                                                               withCapInsets:UIEdgeInsetsZero];
    
    CGRect topHalfFrame = CGRectMake(CGRectGetMinX(initialFrame),
                                     CGRectGetMinY(initialFrame),
                                     CGRectGetWidth(initialFrame),
                                     CGRectGetHeight(initialFrame) / 2);
    UIView *snapshotTopHalf = [fullSnapshot resizableSnapshotViewFromRect:topHalfFrame
                                                       afterScreenUpdates:NO
                                                            withCapInsets:UIEdgeInsetsZero];
    
    
    if (self.reversed) {
        [fromView removeFromSuperview];
        
        [containerView addSubview:toView];
        
        snapshotBottomLeft.alpha = 0.0;
        snapshotBottomLeft.transform = CGAffineTransformMakeScale(1.f, -1.f);
        [containerView addSubview:snapshotBottomLeft];

        snapshotBottomRight.alpha = 0.0;
        snapshotBottomRight.transform = CGAffineTransformMakeScale(1.f, -1.f);
        snapshotBottomRight.layer.anchorPoint = CGPointMake(0, 0.5);
        snapshotBottomRight.layer.position = CGPointMake(CGRectGetMidX(initialFrame), snapshotBottomRight.layer.position.y);
        [containerView addSubview:snapshotBottomRight];
        
        [containerView addSubview:snapshotTopHalf];
        
        snapshotBottomHalf.layer.anchorPoint = CGPointMake(0.5, 0);
        snapshotBottomHalf.layer.position = CGPointMake(snapshotBottomHalf.layer.position.x, CGRectGetMidY(initialFrame));
        [containerView addSubview:snapshotBottomHalf];

        
        [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext] delay:0 options:0 animations:^{

            [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.33 animations:^{
                CATransform3D transform = CATransform3DMakeAffineTransform(snapshotBottomHalf.transform);
                transform = CATransform3DRotate(transform, M_PI - 0.01, 1.0, 0, 0);
                snapshotBottomHalf.layer.transform = transform;
            }];
            
            [UIView addKeyframeWithRelativeStartTime:0.33 relativeDuration:0 animations:^{
                snapshotBottomHalf.alpha = 0.f;
                snapshotTopHalf.alpha = 0.f;
                snapshotBottomLeft.alpha = 1.f;
                snapshotBottomRight.alpha = 1.f;
            }];
            
            [UIView addKeyframeWithRelativeStartTime:0.33 relativeDuration:0.33 animations:^{
                CATransform3D transform = CATransform3DMakeAffineTransform(snapshotBottomRight.transform);
                transform = CATransform3DRotate(transform, -(M_PI - 0.01), 0.0, 1.0, 0);
                snapshotBottomRight.layer.transform = transform;
            }];
            
            [UIView addKeyframeWithRelativeStartTime:0.66 relativeDuration:0.0 animations:^{
                snapshotBottomLeft.alpha = 0.f;
            }];
            
            [UIView addKeyframeWithRelativeStartTime:0.66 relativeDuration:0.34 animations:^{
                CGAffineTransform transform = CGAffineTransformMakeTranslation(-CGRectGetMidX(snapshotBottomRight.bounds), 0);
                snapshotBottomRight.transform = CGAffineTransformScale(transform, kMinScale, kMinScale);
            }];
        } completion:^(BOOL finished) {
            [snapshotTopHalf removeFromSuperview];
            [snapshotBottomHalf removeFromSuperview];
            [snapshotBottomLeft removeFromSuperview];
            [snapshotBottomRight removeFromSuperview];
            
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    }
    else {
        snapshotBottomLeft.transform = CGAffineTransformMakeScale(1, -1);
        snapshotBottomLeft.alpha = 0.f;
        [containerView addSubview:snapshotBottomLeft];
        
        snapshotBottomRight.transform = CGAffineTransformMakeScale(-kMinScale, -kMinScale);
        [containerView addSubview:snapshotBottomRight];

        snapshotTopHalf.alpha = 0.f;
        [containerView addSubview:snapshotTopHalf];
        
        snapshotBottomHalf.alpha = 0.f;
        snapshotBottomHalf.transform = CGAffineTransformMakeScale(1, -1);
        snapshotBottomHalf.layer.anchorPoint = CGPointMake(0.5, 0);
        snapshotBottomHalf.layer.position = CGPointMake(snapshotBottomHalf.layer.position.x, CGRectGetMidY(initialFrame));
        [containerView addSubview:snapshotBottomHalf];
        
        [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext] delay:0 options:0 animations:^{
            // Scale Bottom Right to Identity.
            [UIView addKeyframeWithRelativeStartTime:0.f relativeDuration:0.33 animations:^{
                snapshotBottomRight.transform = CGAffineTransformMakeScale(-1, -1);
                snapshotBottomRight.layer.anchorPoint = CGPointMake(0, 0.5);
                snapshotBottomRight.layer.position = CGPointMake(CGRectGetMidX(initialFrame), snapshotBottomRight.layer.position.y);
            }];
            
            [UIView addKeyframeWithRelativeStartTime:0.33 relativeDuration:0 animations:^{
                snapshotBottomLeft.alpha = 1.f;
            }];
            
            [UIView addKeyframeWithRelativeStartTime:0.33 relativeDuration:0.33 animations:^{
                CATransform3D transform = CATransform3DMakeAffineTransform(snapshotBottomRight.transform);
                transform = CATransform3DRotate(transform, M_PI, 0.f, 1.f, 0.f);
                snapshotBottomRight.layer.transform = transform;
            }];
            
            [UIView addKeyframeWithRelativeStartTime:0.66 relativeDuration:0 animations:^{
                snapshotBottomHalf.alpha = 1.f;
                snapshotBottomLeft.alpha = 0.f;
                snapshotBottomRight.alpha = 0.f;
                snapshotTopHalf.alpha = 1.f;
            }];
            
            [UIView addKeyframeWithRelativeStartTime:0.66 relativeDuration:0.34 animations:^{
                CATransform3D transform = CATransform3DMakeAffineTransform(snapshotBottomHalf.transform);
                transform = CATransform3DRotate(transform, M_PI - 0.01, 1.f, 0.f, 0.f);
                snapshotBottomHalf.layer.transform = transform;
            }];
        } completion:^(BOOL finished) {
            [snapshotTopHalf removeFromSuperview];
            [snapshotBottomHalf removeFromSuperview];
            [snapshotBottomLeft removeFromSuperview];
            [snapshotBottomRight removeFromSuperview];
            
            [containerView addSubview:toView];
            
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    }
}
@end
