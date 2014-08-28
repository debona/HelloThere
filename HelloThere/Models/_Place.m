//
//  _Place.m
//  HelloThere
//
//  Created by Thomas DE BONA on 29/08/2014.
//  Copyright (c) 2014 debona. All rights reserved.
//

#import "_Place.h"

@implementation _Place

+(NSArray *)all
{
    NSArray *descriptions = @[
                       @{
                           @"name": @"Nice, France",
                           @"latitude": @43.7048037,
                           @"longitude": @7.2534179,
                           @"radius": @5,
                        },
                        @{
                           @"name": @"Paris, France",
                           @"latitude": @48.8588589,
                           @"longitude": @2.3470599,
                           @"radius": @10,
                        },
                        @{
                           @"name": @"London, United Kingdom",
                           @"latitude": @51.5286416,
                           @"longitude": @-0.1015987,
                           @"radius": @10,
                        },
                        @{
                           @"name": @"Dublin, Ireland",
                           @"latitude": @53.3243201,
                           @"longitude": @-6.251695,
                           @"radius": @5,
                        },
                        @{
                           @"name": @"Geneva, Switzerland",
                           @"latitude": @46.204705,
                           @"longitude": @6.1431301,
                           @"radius": @3,
                        },
                        @{
                           @"name": @"Berlin, Germany",
                           @"latitude": @52.5075419,
                           @"longitude": @13.4261419,
                           @"radius": @10,
                        },
                        @{
                           @"name": @"Amsterdam, The Netherlands",
                           @"latitude": @52.3747157,
                           @"longitude": @4.8986167,
                           @"radius": @4,
                        },
                        @{
                           @"name": @"Stockholm, Sweden",
                           @"latitude": @59.3261419,
                           @"longitude": @17.9875456,
                           @"radius": @5,
                        },
                    ];
    
    NSMutableArray *all = [[NSMutableArray alloc] init];
    for (NSDictionary *description in descriptions) {
        _Place *place = [[_Place alloc] init];
        place.name = [description objectForKey:@"name"];
        place.latitude = [[description objectForKey:@"latitude"] floatValue];
        place.longitude = [[description objectForKey:@"longitude"] floatValue];
        place.radius = [[description objectForKey:@"radius"] floatValue];

        [all addObject:place];
    }

    return [NSArray arrayWithArray:all];
}

@end
