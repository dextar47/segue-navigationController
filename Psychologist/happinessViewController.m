//
//  happinessViewController.m
//  Happiness
//
//  Created by Usman Ahmad on 8/24/12.
//  Copyright (c) 2012 Upanels. All rights reserved.
//

#import "happinessViewController.h"
#import "FaceView.h"

@interface happinessViewController() <FaceVIewDataSource>

@property (nonatomic, weak) IBOutlet FaceView *fView;

@end


@implementation happinessViewController
@synthesize fView = _fView;
@synthesize happiness = _happiness;
@synthesize btn = _btn;
@synthesize uiToolBar = _uiToolBar;

- (void)setBtn:(UIBarButtonItem *)btn {
    if(_btn != btn) {
        NSMutableArray *simpleArr = [self.uiToolBar.items mutableCopy];
        if(_btn) [simpleArr removeObject:_btn];
        if(btn) [simpleArr insertObject:btn atIndex:0];
        self.uiToolBar.items = simpleArr;
        _btn = btn;
    }
}

-(void) setHappiness:(int)happiness {
    _happiness = happiness;
    [self.fView setNeedsDisplay];
}


- (void)setFView:(FaceView *)fView {
    _fView = fView;
    UIPinchGestureRecognizer* gesti = [[UIPinchGestureRecognizer alloc] initWithTarget:self.fView action:@selector(pinch:)];
    [self.fView addGestureRecognizer:gesti];
    [self.fView addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleHappinessGesture:)]];
    self.fView.dataSource = self;
}

- (void)handleHappinessGesture:(UIPanGestureRecognizer *) gesture {
    if(gesture.state == UIGestureRecognizerStateChanged
       || gesture.state == UIGestureRecognizerStateEnded) {
        CGPoint translation = [gesture translationInView:self.fView];
        self.happiness += translation.y / 1.5;
        [gesture setTranslation:CGPointZero inView:self.fView];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (CGFloat)smileForFaceView:(FaceView *)faceView {
    return (self.happiness - 50) / 50.0;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
