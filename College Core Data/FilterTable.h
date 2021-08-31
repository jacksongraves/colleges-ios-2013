//
//  FilterTable.h
//  MyColleges
//
//  Created by Jackson Graves on 10/28/12.
//  Copyright (c) 2012 Me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilterResults.h"
#import "CoreDataTableViewController.h"
#import "College.h"

@interface FilterTable : CoreDataTableViewController <FilterResultsDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) College *selectedCollege;

@property (nonatomic, assign) BOOL *neFilter;
@property (nonatomic, assign) BOOL *mwFilter;
@property (nonatomic, assign) BOOL *soFilter;
@property (nonatomic, assign) BOOL *wFilter;
@property (nonatomic, assign) BOOL *bFilter;
@property (nonatomic, assign) BOOL *asFilter;
@property (nonatomic, assign) BOOL *smFilter;
@property (nonatomic, assign) BOOL *pbFilter;
@property (nonatomic, assign) BOOL *pvFilter;
@property (nonatomic, assign) BOOL *exFilter;
@property (nonatomic, assign) BOOL *acFilter;
@property (nonatomic, assign) BOOL *ieFilter;

@property (nonatomic, assign) BOOL *neSelection;
@property (nonatomic, assign) BOOL *mwSelection;
@property (nonatomic, assign) BOOL *soSelection;
@property (nonatomic, assign) BOOL *wSelection;
@property (nonatomic, assign) BOOL *bSelection;
@property (nonatomic, assign) BOOL *asSelection;
@property (nonatomic, assign) BOOL *smSelection;
@property (nonatomic, assign) BOOL *pbSelection;
@property (nonatomic, assign) BOOL *pvSelection;
@property (nonatomic, assign) BOOL *exSelection;
@property (nonatomic, assign) BOOL *acSelection;
@property (nonatomic, assign) BOOL *ieSelection;

@end