//
//  _User.m
//  HelloThere
//
//  Created by Thomas DE BONA on 27/08/2014.
//  Copyright (c) 2014 debona. All rights reserved.
//

#import "_User.h"

@interface _User ()

@end

@implementation _User

+(_User *)thomas
{
    _User *thomas = [[_User alloc] init];
    thomas.photo = @"Thomas";
    thomas.username = @"debona";
    thomas.fullname = @"Thomas DE BONA";
    thomas.color = [UIColor blackColor];
    
    return thomas;
}

@end
