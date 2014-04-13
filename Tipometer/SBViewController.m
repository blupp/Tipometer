//
//  SBViewController.m
//  Tipometer
//
//  Created by Sebastian Björkelid on 2014-04-13.
//  Copyright (c) 2014 Sebastian Björkelid. All rights reserved.
//

#import "SBViewController.h"

@interface SBViewController ()

@end

@implementation SBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
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
