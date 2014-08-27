//
//  UIView+endEditingOnTap.m
//  HelloThere
//
//  Created by Thomas DE BONA on 27/08/2014.
//  Copyright (c) 2014 debona. All rights reserved.
//

#import "UIView+endEditingOnTap.h"

@implementation UIView (endEditingOnTap)

-(void)endEditingOnTap
{
    UITapGestureRecognizer *singleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_handleTapFrom:)];
    singleTapRecognizer.numberOfTouchesRequired = 1;
    singleTapRecognizer.cancelsTouchesInView = NO;
    [self addGestureRecognizer:singleTapRecognizer];
}

- (void)_handleTapFrom:(UITapGestureRecognizer *)recognizer
{
    [self endEditing:YES];
}

@end
