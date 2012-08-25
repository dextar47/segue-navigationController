//
//  happinessViewController.h
//  Happiness
//
//  Created by Usman Ahmad on 8/24/12.
//  Copyright (c) 2012 Upanels. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIToolbarButtonPresenter.h"
@interface happinessViewController : UIViewController <UIToolbarButtonPresenter>
@property (nonatomic, weak) IBOutlet UIToolbar *uiToolBar;
@property (nonatomic) int happiness;

@end
