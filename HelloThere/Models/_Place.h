//
//  _Place.h
//  HelloThere
//
//  Created by Thomas DE BONA on 29/08/2014.
//  Copyright (c) 2014 debona. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface _Place : NSObject

@property (strong, nonatomic) NSString *name;
@property (nonatomic) float latitude;
@property (nonatomic) float longitude;
@property (nonatomic) float radius;

+(NSArray *)all;

@end
