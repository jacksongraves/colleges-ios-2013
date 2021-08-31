//
//  StateTable.m
//  MyColleges
//
//  Created by Jackson Graves on 10/14/12.
//  Copyright (c) 2012 Me. All rights reserved.
//

#import "StateTable.h"
#import "College.h"

@implementation StateTable
@synthesize fetchedResultsController = __fetchedResultsController;
@synthesize managedObjectContext = __managedObjectContext;
@synthesize selectedCollege;
@synthesize searchResults;

- (void)setupFetchedResultsController
{
    NSString *entityName = @"College";
    NSLog(@"Setting up a Fetched Results Controller for the Entity named %@", entityName);
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entityName];
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"state"
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
}

- (void)viewDidUnload
{
	self.searchResults = nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Colleges by State Cell";
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [self.searchResults count];
    } else {
        return [[[self.fetchedResultsController sections] objectAtIndex:section] numberOfObjects];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (self.searchDisplayController.active) {
        NSLog(@"Segue from the searchDisplayController, setting StateTable as a delegate of Detail within the searchResults array");
        Detail *detail = segue.destinationViewController;
        detail.delegate = self;
        NSLog(@"Passing selected College (%@) to Detail", self.selectedCollege.name);
        self.selectedCollege = [self.searchResults objectAtIndex:self.searchDisplayController.searchResultsTableView.indexPathForSelectedRow.row];
        detail.college = self.selectedCollege;
    } else {
        NSLog(@"Segue from the fetchedResultsController, setting StateTable as a delegate of Detail");
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
	NSLog(@"Previous Search Results were removed");
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