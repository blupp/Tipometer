//
//  SBFoursquareParser.h
//  Tipometer
//
//  Created by Sebastian Björkelid on 2014-04-13.
//  Copyright (c) 2014 Sebastian Björkelid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBVenue.h"

@interface SBFoursquareParser : NSObject

- (SBVenue *) getVenuesCloseToLongitude: (NSNumber *)longitude andLatitude: (NSNumber *)latitude;

@end
