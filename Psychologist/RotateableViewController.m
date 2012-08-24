//
//  RotateableViewController.m
//  Psychologist
//
//  Created by Usman Ahmad on 8/24/12.
//  Copyright (c) 2012 Upanels. All rights reserved.
//

#import "RotateableViewController.h"

@interface RotateableViewController ()

@end

@implementation RotateableViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    self.splitViewController.delegate = self; 
}
- (BOOL)splitViewController:(UISplitViewController *)svc shouldHideViewController:(UIViewController *)vc inOrientation:(UIInterfaceOrientation)orientation {
    return NO;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
