//
//  StateTable.h
//  MyColleges
//
//  Created by Jackson Graves on 10/14/12.
//  Copyright (c) 2012 Me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Detail.h"
#import "CoreDataTableViewController.h"
#import "College.h"

@interface StateTable : CoreDataTableViewController <DetailDelegate, UISearchDisplayDelegate, UISearchBarDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) College *selectedCollege;
@property (nonatomic, retain) NSMutableArray *searchResults;

@end