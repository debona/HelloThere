//
//  _DiscoverViewController.m
//  HelloThere
//
//  Created by Thomas DE BONA on 27/08/2014.
//  Copyright (c) 2014 debona. All rights reserved.
//

#import "_DiscoverViewController.h"

#import "_PlaceCell.h"
#import "IonIcons.h"

static NSString * const _PlaceCellIdentifier = @"_PlaceCellIdentifier";

@interface _DiscoverViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *places;

@end

@implementation _DiscoverViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.tabBarItem.title = @"Discover";
    self.navigationController.tabBarItem.image = [IonIcons imageWithIcon:icon_ios7_world_outline
                                                               iconColor:[UIColor whiteColor]
                                                                iconSize:40
                                                               imageSize:CGSizeMake(40, 40)];
    
    self.places = @[
                       @{
                           @"name": @"Nice, France",
                           @"latitude": @43.7048037,
                           @"longitude": @7.2534179,
                           @"radius": @5000,
                        },
                        @{
                           @"name": @"Paris, France",
                           @"latitude": @48.8588589,
                           @"longitude": @2.3470599,
                           @"radius": @10000,
                        },
                        @{
                           @"name": @"London, United Kingdom",
                           @"latitude": @51.5286416,
                           @"longitude": @-0.1015987,
                           @"radius": @10000,
                        },
                        @{
                           @"name": @"Dublin, Ireland",
                           @"latitude": @53.3243201,
                           @"longitude": @-6.251695,
                           @"radius": @5000,
                        },
                        @{
                           @"name": @"Geneva, Switzerland",
                           @"latitude": @46.204705,
                           @"longitude": @6.1431301,
                           @"radius": @3000,
                        },
                        @{
                           @"name": @"Berlin, Germany",
                           @"latitude": @52.5075419,
                           @"longitude": @13.4261419,
                           @"radius": @10000,
                        },
                        @{
                           @"name": @"Amsterdam, The Netherlands",
                           @"latitude": @52.3747157,
                           @"longitude": @4.8986167,
                           @"radius": @4000,
                        },
                        @{
                           @"name": @"Stockholm, Sweden",
                           @"latitude": @59.3261419,
                           @"longitude": @17.9875456,
                           @"radius": @5000,
                        },
                    ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.places count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    _PlaceCell * cell = [tableView dequeueReusableCellWithIdentifier:_PlaceCellIdentifier];
    if (!cell)
    {
        [tableView registerNib:[UINib nibWithNibName:@"_PlaceCell" bundle:nil] forCellReuseIdentifier:_PlaceCellIdentifier];
        cell = [tableView dequeueReusableCellWithIdentifier:_PlaceCellIdentifier];
    }

    NSDictionary *place = [self.places objectAtIndex:[indexPath row]];
    cell.nameLabel.text = [place objectForKey:@"name"];

    return cell;
}


#pragma mark - UITableViewDelegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
