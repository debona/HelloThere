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

#import "_FeedViewController.h"
#import "_Place.h"

static NSString * const _PlaceCellIdentifier = @"_PlaceCellIdentifier";

@interface _DiscoverViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *places;

@end

@implementation _DiscoverViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.places = [_Place all];
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

    _Place *place = [self.places objectAtIndex:[indexPath row]];
    cell.nameLabel.text = place.name;

    return cell;
}


#pragma mark - UITableViewDelegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    _FeedViewController *feedController = [[_FeedViewController alloc] initWithDefaultNib];
    [self.navigationController pushViewController:feedController animated:YES];
}

@end
