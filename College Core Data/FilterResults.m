//
//  FilterResults.m
//  MyColleges
//
//  Created by Jackson Graves on 10/28/12.
//  Copyright (c) 2012 Me. All rights reserved.
//

#import "FilterResults.h"
#import "FilterTable.h"
#import "College.h"

@implementation FilterResults

@synthesize delegate;

@synthesize fetchedResultsController = __fetchedResultsController;
@synthesize managedObjectContext = __managedObjectContext;
@synthesize selectedCollege;
@synthesize searchResults;

@synthesize northeast;
@synthesize midwest;
@synthesize south;
@synthesize west;
@synthesize big;
@synthesize averageSize;
@synthesize small;
@synthesize publicCollege;
@synthesize privateCollege;
@synthesize expensive;
@synthesize averageCost;
@synthesize inexpensive;

- (void)setupFetchedResultsController
{
    NSString *entityName = @"College";
    NSLog(@"Setting up a Fetched Results Controller for the Entity named %@", entityName);
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entityName];
    NSLog(@"Setting the Predicate filters to %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@", northeast, midwest, south, west, big, averageSize, small, publicCollege, privateCollege, expensive, averageCost, inexpensive);
    NSString *predicateString = [NSString stringWithFormat:@"((region == \"%@\") OR (region == \"%@\") OR (region == \"%@\") OR (region = \"%@\")) AND ((schoolSize == \"%@\") OR (schoolSize == \"%@\") OR (schoolSize == \"%@\")) AND ((type == \"%@\") OR (type == \"%@\")) AND ((expense == \"%@\") OR (expense == \"%@\") OR (expense == \"%@\"))", northeast, midwest, south, west, big, averageSize, small, publicCollege, privateCollege, expensive, averageCost, inexpensive];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:predicateString];
    [request setPredicate:predicate];
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"name"
                                                                                     ascending:YES
                                                                                      selector:@selector(localizedCaseInsensitiveCompare:)]];
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                        managedObjectContext:self.managedObjectContext
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
    
    [self performFetch];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setupFetchedResultsController];
}

- (void)viewDidLoad
{
    self.searchResults = [NSMutableArray arrayWithCapacity:[[self.fetchedResultsController fetchedObjects] count]];
    [self.tableView reloadData];
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setNortheast:nil];
    [self setMidwest:nil];
    [self setSouth:nil];
    [self setWest:nil];
    [self setBig:nil];
    [self setAverageSize:nil];
    [self setSmall:nil];
    [self setPublicCollege:nil];
    [self setPrivateCollege:nil];
    [self setExpensive:nil];
    [self setAverageCost:nil];
    [self setInexpensive:nil];
    self.searchResults = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [self.searchResults count];
    } else {
        return [[[self.fetchedResultsController sections] objectAtIndex:section] numberOfObjects];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Filtered Colleges Cell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    College *college = nil;
	if (tableView == self.searchDisplayController.searchResultsTableView) {
        NSLog(@"Configuring cell to show search results");
        college = [self.searchResults objectAtIndex:indexPath.row];
    } else {
        NSLog(@"Configuring cell to show normal data");
        college = [self.fetchedResultsController objectAtIndexPath:indexPath];
    }
    
    NSString *cityState = [NSString stringWithFormat:@"%@, %@", college.city, college.state];
    cell.textLabel.text = college.name;
    cell.detailTextLabel.text = cityState;
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (self.searchDisplayController.active) {
        NSLog(@"Segue from the searchDisplayController, setting FilterResults as a delegate of Detail within the searchResults array");
        Detail *detail = segue.destinationViewController;
        detail.delegate = self;
        NSLog(@"Passing selected College (%@) to Detail", self.selectedCollege.name);
        self.selectedCollege = [self.searchResults objectAtIndex:self.searchDisplayController.searchResultsTableView.indexPathForSelectedRow.row];
        detail.college = self.selectedCollege;
    } else {
        NSLog(@"Segue from the fetchedResultsController, setting FilterResults as a delegate of Detail");
        Detail *detail = segue.destinationViewController;
        detail.delegate = self;
        NSLog(@"Passing selected College (%@) to Detail", self.selectedCollege.name);
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        self.selectedCollege = [self.fetchedResultsController objectAtIndexPath:indexPath];
        detail.college = self.selectedCollege;
    }
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
	NSLog(@"Previous Search Results were removed.");
	[self.searchResults removeAllObjects]; 
	for (College *college in [self.fetchedResultsController fetchedObjects]) {
		if ([scope isEqualToString:@"All"] || [college.name isEqualToString:scope]) {
			NSComparisonResult result = [college.name compare:searchText 
                                                      options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) 
                                                        range:NSMakeRange(0, [searchText length])];
            if (result == NSOrderedSame) {
                NSLog(@"Adding College.name '%@' to searchResults as it begins with search text '%@'", college.name, searchText);
				[self.searchResults addObject:college];
            }
		}
	}
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:@"All"];
    return YES;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    [self filterContentForSearchText:[self.searchDisplayController.searchBar text] scope:@"All"];
    return YES;
}

@end