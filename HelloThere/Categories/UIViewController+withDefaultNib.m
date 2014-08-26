//
//  UIViewController+withDefaultNib.m
//  HelloThere
//
//  Created by Thomas DE BONA on 26/08/2014.
//  Copyright (c) 2014 debona. All rights reserved.
//

#import "UIViewController+withDefaultNib.h"

@implementation UIViewController (withDefaultNib)

- (id)initWithDefaultNib {
    NSString *className = NSStringFromClass([self class]);

    if (self = [self initWithNibName:className bundle:nil]) {
        DDLogVerbose(@"initWithDefaultNib called on self:%@ with nib:%@", self, className);
    }
    return self;
}

@end
