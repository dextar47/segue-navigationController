//
//  RotateableViewController.m
//  Psychologist
//
//  Created by Usman Ahmad on 8/24/12.
//  Copyright (c) 2012 Upanels. All rights reserved.
//

#import "RotateableViewController.h"
#import "UIToolbarButtonPresenter.h"

@interface RotateableViewController ()

@end

@implementation RotateableViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    self.splitViewController.delegate = self; 
}
- (BOOL)splitViewController:(UISplitViewController *)svc shouldHideViewController:(UIViewController *)vc inOrientation:(UIInterfaceOrientation)orientation {
    return [self buttonPresenter] ? UIInterfaceOrientationIsPortrait(orientation) :  NO;
}

- (void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc {
    barButtonItem.title = @"popOver";
    [self buttonPresenter].btn = barButtonItem;
}

- (id <UIToolbarButtonPresenter>)buttonPresenter {
    id detailsMvc = [self.splitViewController.viewControllers lastObject];
    if(![detailsMvc conformsToProtocol: @protocol(UIToolbarButtonPresenter)]) {
        detailsMvc = nil;
    }
    return detailsMvc;
}

- (void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
    [self buttonPresenter].btn = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
