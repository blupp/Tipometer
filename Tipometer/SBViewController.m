//
//  SBViewController.m
//  Tipometer
//
//  Created by Sebastian Björkelid on 2014-04-13.
//  Copyright (c) 2014 Sebastian Björkelid. All rights reserved.
//

#import "SBViewController.h"
#import "SBFoursquareParser.h"

@interface SBViewController ()

@end

@implementation SBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    SBFoursquareParser *fsParser = [[SBFoursquareParser alloc] init];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            
            SBVenue *venue = [fsParser getVenuesCloseToLongitude:[NSNumber numberWithInt:1] andLatitude:[NSNumber numberWithInt:1]];
            [self.venueNameLabel setText:venue.name];
            [self.locationLabel setText:[NSString stringWithFormat:@"%@, %@", venue.address, venue.city]];
            
        });
    });
    
    
    
    self.timerActive = NO;
}

- (IBAction)minus:(id)sender {
    int amountData = [self.amount.text intValue];
    amountData = amountData - 5;
    
    self.amount.text = [NSString stringWithFormat:@"%d",amountData];
}

- (IBAction)plus:(id)sender {
    int amountData = [self.amount.text intValue];
    amountData = amountData + 5;
    
    self.amount.text = [NSString stringWithFormat:@"%d",amountData];
}

- (IBAction)toggleWaitingForService:(id)sender {
    
    if(self.timerActive) {
        [self stopTimer];
    } else {
        [self startTimer];
    }
    
}

- (void) stopTimer {
    
    self.timerActive = NO;
    
    [self.waitingBtn setTitle:@"Waiting for service" forState:UIControlStateNormal];
    [self.waitingBtn setBackgroundImage:[UIImage imageNamed:@"Waiting btn.png"] forState:UIControlStateNormal];
    
    [self.waitingTimer invalidate];
    self.waitingTimer = nil;
}

- (void) startTimer {
    
    self.timerActive = YES;
    
    [self.waitingBtn setTitle:@"Ticking ..." forState:UIControlStateNormal];
    [self.waitingBtn setBackgroundImage:[UIImage imageNamed:@"waiting btn pressed.png"] forState:UIControlStateNormal];
    
    self.waitingTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                     target:self
                                   selector:@selector(tick:)
                                   userInfo:nil
                                    repeats:YES];
}

- (void) tick:(NSTimer *) timer {
    
    int amountData = [self.amount.text intValue];
    amountData = amountData - 1;
    
    self.amount.text = [NSString stringWithFormat:@"%d",amountData];
    
}



@end
