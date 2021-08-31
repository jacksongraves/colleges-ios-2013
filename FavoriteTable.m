//
//  FavoriteTable.m
//  MyColleges
//
//  Created by Jackson Graves on 7/31/12.
//  Copyright (c) 2012 Me. All rights reserved.
//

#import "FavoriteTable.h"
#import "College.h"

@implementation FavoriteTable
@synthesize fetchedResultsController = __fetchedResultsController;
@synthesize managedObjectContext = __managedObjectContext;
@synthesize selectedCollege;

- (void)setupFetchedResultsController
{
    NSString *entityName = @"College";
    NSLog(@"Setting up a Fetched Results Controller for the Entity named %@", entityName);
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entityName];
    NSString *predicateString = [NSString stringWithFormat:@"(favoriteStatus = \"%@\")", @"Favorite College"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:predicateString];
    [request setPredicate:predicate];
      request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"name"                                                                               ascending:YES
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
    [self.tableView reloadData];
}

- (void)viewDidUnload
{
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Favorites Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    College *college = nil;
        NSLog(@"Configuring cell to show normal data");
        college = [self.fetchedResultsController objectAtIndexPath:indexPath];
        NSString *name = [NSString stringWithFormat:@"%@", college.name];
        NSString *detailName = [NSString stringWithFormat:@"%@, %@", college.city, college.state];
        cell.textLabel.text = name;
        cell.detailTextLabel.text = detailName;
        return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[self.fetchedResultsController sections] objectAtIndex:section] numberOfObjects];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"Segue from the fetchedResultsController, setting FavoriteTable as a delegate of Detail");
    Detail *detail = segue.destinationViewController;
    detail.delegate = self;
    NSLog(@"Passing selected College (%@) to Detail", self.selectedCollege.name);
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    self.selectedCollege = [self.fetchedResultsController objectAtIndexPath:indexPath];
    detail.college = self.selectedCollege;
}

@end