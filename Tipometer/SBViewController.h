//
//  SBViewController.h
//  Tipometer
//
//  Created by Sebastian Björkelid on 2014-04-13.
//  Copyright (c) 2014 Sebastian Björkelid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SBViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *amount;
@property (strong, nonatomic) IBOutlet UIButton *waitingBtn;
@property (assign, nonatomic) BOOL timerActive;
@property (strong, nonatomic) NSTimer *waitingTimer;

- (IBAction)minus:(id)sender;
- (IBAction)plus:(id)sender;
- (IBAction)toggleWaitingForService:(id)sender;

@end
