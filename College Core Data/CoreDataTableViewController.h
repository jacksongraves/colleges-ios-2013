//
//  CoreDataTableViewController.h
//  MyColleges
//
//  Created by Jackson Graves on 7/20/12.
//  Copyright (c) 2012 Me. All rights reserved.
//
//  Source code for CoreDataTableViewController was adapted from an e-Lecture by Stanford University on the use of Core Data as a way to handle data, code is mostly copied from the Apple documentation of the NSFetchedResultsController

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface CoreDataTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>

// The NSFetchedResultsController is responsible for fetching in all fetch-based classes
// (CollegeTable, StateTable, FavoritesTable, FilterTable and FilterResults)
// An NSFetchedResultsController @property cannot be modified
// New fetch parameters (predicate, sorting, etc.) require a new NSFetchedResultsConroller
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

// Causes the fetchedResultsController to refetch the data.
// The fetchedResultsController essentially calls this whenever a table is loaded via a fetch
// performFetch calls automatically to recognize any changes
- (void)performFetch;

// This BOOL is called to recognize any changes to the managedObjectContext and updates
// the fetchedResultsController accordingly, and it turns off after the change is complete.
@property (nonatomic) BOOL suspendAutomaticTrackingOfChangesInManagedObjectContext;

// Setting the debug BOOL to YES enables debug output in testing the app
@property BOOL debug;

@end