//
//  _AppDelegate.h
//  HelloThere
//
//  Created by Thomas DE BONA on 26/08/2014.
//  Copyright (c) 2014 debona. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface _AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
