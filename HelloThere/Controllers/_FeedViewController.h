//
//  _FeedViewController.h
//  HelloThere
//
//  Created by Thomas DE BONA on 27/08/2014.
//  Copyright (c) 2014 debona. All rights reserved.
//

#import <UIKit/UIKit.h>

@class _Place;

@interface _FeedViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (strong, nonatomic) _Place *place;

@end
