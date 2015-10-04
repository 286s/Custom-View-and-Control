# Custom UIViewController Transition
Provides custom animated transition for UINavigationController, Modally Presentation and TabViewController.

## A little bit of Background
Since release of iOS 7, a new API customizing animation between `UIViewController` has been introduced. This presents us a new way to provide several built-in types of transitions:
- `UINavigationController`s push and pop to navigate through an information hierarchy, 
- `TabbarController`s switch between sections by changing tabs
- Any `UIViewController` can present and dismiss another view controller modally for specific tasks.

## How to use it for `UINavigationController`?
`UIViewControllerTransitioningDelegate`
`UIViewControllerAnimatedTransitioning`
`UINavigationControllerDelegate`

## How to use it for `UINavigationController`?
- A subclass (named 'AViewController') of `UIViewController` conforms `UINavigationControllerDelegate`
- AViewController implements function, and return the custom animated transition object 

    `- navigationController:animationControllerForOperation:fromViewController:toViewController:`
    
    `- navigationController:interactionControllerForAnimationController:`

## How to use it for `TabbarController`?

## How to use it for `UIViewController` modally presentation?
```
UIViewController *detailViewController = ...; // 
detailViewController.transitioningDelegate = self;
detailViewController.modalPresentationStyle = UIModalPresentationCustom;
```
## List of Custom Transition:
- CustomFoldTransitions
- CustomNavigationTransitions

