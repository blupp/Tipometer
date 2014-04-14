//
//  SBFoursquareParser.m
//  Tipometer
//
//  Created by Sebastian Björkelid on 2014-04-13.
//  Copyright (c) 2014 Sebastian Björkelid. All rights reserved.
//

#import "SBFoursquareParser.h"

@implementation SBFoursquareParser


- (SBVenue *) getVenuesCloseToLongitude: (NSNumber *)longitude andLatitude: (NSNumber *)latitude {

    NSURL *queryURL = [NSURL URLWithString:@"https://api.foursquare.com/v2/venues/search?ll=59.863641,17.651445&limit=1&oauth_token=P1ANT3XPM2MV2D4DKLU3IG2GNLUVIAKOIWPU0WY2DTJNHLQY&v=20140414"];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:queryURL];
    
    NSError *error = nil;
    NSDictionary *dataDict = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    dataDict = [[[dataDict objectForKey:@"response"] objectForKey:@"venues"] objectAtIndex:0];
    
    SBVenue *venue = [[SBVenue alloc] init];
    
    venue.name = [dataDict objectForKey:@"name"];
    venue.city = [[dataDict objectForKey:@"location"] objectForKey:@"city"];
    venue.address = [[dataDict objectForKey:@"location"] objectForKey:@"address"];

    
    return venue;
}




@end
