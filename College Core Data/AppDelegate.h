//
//  AppDelegate.h
//  MyColleges
//
//  Created by Jackson Graves on 7/20/12.
//  Copyright (c) 2012 Me. All rights reserved.
//
//  The general outline of this app's source code is adapted from Tim Roadley's Core Data tutorial beginning with Part 1 and ending at the source code from Part 8.

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end