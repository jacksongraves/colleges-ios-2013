//
//  FilterResults.h
//  MyColleges
//
//  Created by Jackson Graves on 10/28/12.
//  Copyright (c) 2012 Me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Detail.h"
#import "CoreDataTableViewController.h"
#import "College.h"

@class FilterResults;
@protocol FilterResultsDelegate <NSObject>
@end

@interface FilterResults : CoreDataTableViewController <DetailDelegate, UISearchDisplayDelegate, UISearchBarDelegate>

@property (nonatomic, weak) id <FilterResultsDelegate> delegate;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) College *selectedCollege;
@property (nonatomic, retain) NSMutableArray *searchResults;

@property (strong, nonatomic) NSString *northeast;
@property (strong, nonatomic) NSString *midwest;
@property (strong, nonatomic) NSString *south;
@property (strong, nonatomic) NSString *west;
@property (strong, nonatomic) NSString *big;
@property (strong, nonatomic) NSString *averageSize;
@property (strong, nonatomic) NSString *small;
@property (strong, nonatomic) NSString *publicCollege;
@property (strong, nonatomic) NSString *privateCollege;
@property (strong, nonatomic) NSString *expensive;
@property (strong, nonatomic) NSString *averageCost;
@property (strong, nonatomic) NSString *inexpensive;

@end