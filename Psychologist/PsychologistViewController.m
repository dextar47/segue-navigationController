//
//  PsychologistViewController.m
//  Psychologist
//
//  Created by Usman Ahmad on 8/24/12.
//  Copyright (c) 2012 Upanels. All rights reserved.
//

#import "PsychologistViewController.h"
#import "happinessViewController.h"

@interface PsychologistViewController ()
@property (nonatomic) int diagnosis;
@end

@implementation PsychologistViewController
@synthesize diagnosis = _diagnosis;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
- (void) setAndShowDiagnosis:(int) number {
    self.diagnosis = number;
    [self performSegueWithIdentifier:@"ShowDiagnosis" sender:self];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"ShowDiagnosis"]) {
        [segue.destinationViewController setHappiness:self.diagnosis];
    }
}
- (IBAction)onePressed {
    [self setAndShowDiagnosis:60];
}
- (IBAction)twoPressed {
    [self setAndShowDiagnosis:100];
}
- (IBAction)threPressed {
    [self setAndShowDiagnosis:20];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
