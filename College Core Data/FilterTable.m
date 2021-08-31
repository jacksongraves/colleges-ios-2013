//
//  FilterTable.m
//  MyColleges
//
//  Created by Jackson Graves on 10/28/12.
//  Copyright (c) 2012 Me. All rights reserved.
//

#import "FilterTable.h"
#import "FilterResults.h"
#import "College.h"

@implementation FilterTable

@synthesize fetchedResultsController = __fetchedResultsController;
@synthesize managedObjectContext = __managedObjectContext;
@synthesize selectedCollege;

@synthesize neFilter;
@synthesize mwFilter;
@synthesize soFilter;
@synthesize wFilter;
@synthesize bFilter;
@synthesize asFilter;
@synthesize smFilter;
@synthesize pbFilter;
@synthesize pvFilter;
@synthesize exFilter;
@synthesize acFilter;
@synthesize ieFilter;

@synthesize neSelection;
@synthesize mwSelection;
@synthesize soSelection;
@synthesize wSelection;
@synthesize bSelection;
@synthesize asSelection;
@synthesize smSelection;
@synthesize pbSelection;
@synthesize pvSelection;
@synthesize exSelection;
@synthesize acSelection;
@synthesize ieSelection;

- (void)setupFetchedResultsController
{
    NSString *entityName = @"College";
    NSLog(@"Setting up a Fetched Results Controller for the Entity named %@", entityName);
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entityName];
    request.predicate = [NSPredicate predicateWithFormat:@"(state == %@)", @"Filter out all colleges"];
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"name"
                                                                                     ascending:YES
                                                                                      selector:@selector(localizedCaseInsensitiveCompare:)]];
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                        managedObjectContext:self.managedObjectContext
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
    [self performFetch];
}

- (void)viewDidLoad
{
    NSLog(@"Performing actions to load the view");
    [self.tableView reloadData];
    [self setNeFilter:NO];
    [self setMwFilter:NO];
    [self setSoFilter:NO];
    [self setWFilter:NO];
    [self setBFilter:NO];
    [self setAsFilter:NO];
    [self setSmFilter:NO];
    [self setPbFilter:NO];
    [self setPvFilter:NO];
    [self setExFilter:NO];
    [self setAcFilter:NO];
    [self setIeFilter:NO];
    NSLog(@"Show current filter values, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d", neFilter, mwFilter, soFilter, wFilter, bFilter, asFilter, smFilter, pbFilter, pvFilter, exFilter, acFilter, ieFilter);
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setNeFilter:NO];
    [self setMwFilter:NO];
    [self setSoFilter:NO];
    [self setWFilter:NO];
    [self setBFilter:NO];
    [self setAsFilter:NO];
    [self setSmFilter:NO];
    [self setPbFilter:NO];
    [self setPvFilter:NO];
    [self setExFilter:NO];
    [self setAcFilter:NO];
    [self setIeFilter:NO];
    [self.tableView reloadData];
    NSLog(@"Show current filter values, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d", neFilter, mwFilter, soFilter, wFilter, bFilter, asFilter, smFilter, pbFilter, pvFilter, exFilter, acFilter, ieFilter);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return @"Near or Far?";
        case 1:
            return @"Big or Small?";
        case 2:
            return @"Public or Private?";
        case 3:
            return @"Cost?";
        default:
            return @"";
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 4;
        case 1:
            return 3;
        case 2:
            return 2;
        case 3:
            return 3;
        default:
            return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int section = [indexPath section];
    switch (section) {
        case 0:
            return 44.0f;
        case 1:
            return 44.0f;
        case 2:
            return 44.0f;
        case 3:
            return 44.0f;
        default:
            return 44.0f;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = [indexPath section];
    NSInteger row = [indexPath row];
    UITableViewCell *cell;
    
    NSLog(@"Setting up Cells");
    switch (section) {
        case 0:
        if (row == 0) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"northeastCell"];
            if (neSelection==NO) {
            cell.accessoryType = UITableViewCellAccessoryNone;
            } else if (neSelection==YES) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            }
            [cell.textLabel setText:@"Northeast"];
            return cell;
        } else if (row == 1) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"midwestCell"];
            if (mwSelection==NO) {
            cell.accessoryType = UITableViewCellAccessoryNone;
            } else if (mwSelection==YES) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            }
            [cell.textLabel setText:@"Midwest"];
            return cell;
        } else if (row == 2) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"southCell"];
            if (soSelection==NO) {
            cell.accessoryType = UITableViewCellAccessoryNone;
            } else if (soSelection==YES) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            }
            [cell.textLabel setText:@"South"];
            return cell;
        } else if (row == 3) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"westCell"];
            if (wSelection==NO) {
            cell.accessoryType = UITableViewCellAccessoryNone;
            } else if (wSelection==YES) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            }
            [cell.textLabel setText:@"West"];
            return cell;
        }
        break;
        case 1:
        if (row == 0) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"bigCell"];
            if (bSelection==NO) {
            cell.accessoryType = UITableViewCellAccessoryNone;
            } else if (bSelection==YES) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            }
            [cell.textLabel setText:@"Big"];
            return cell;
        } else if (row == 1) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"averageSizeCell"];
            if (asSelection==NO) {
            cell.accessoryType = UITableViewCellAccessoryNone;
            } else if (asSelection==YES) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            }
            [cell.textLabel setText:@"Average"];
            return cell;
        } else if (row == 2) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"smallCell"];
            if (smSelection==NO) {
            cell.accessoryType = UITableViewCellAccessoryNone;
            } else if (smSelection==YES) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            }
            [cell.textLabel setText:@"Small"];
            return cell;
        }
        break;
        case 2:
        if (row == 0) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"publicCell"];
            if (pbSelection==NO) {
            cell.accessoryType = UITableViewCellAccessoryNone;
            } else if (pbSelection==YES) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            }
            [cell.textLabel setText:@"Public"];
            return cell;
        } else if (row == 1) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"privateCell"];
            if (pvSelection==NO) {
            cell.accessoryType = UITableViewCellAccessoryNone;
            } else if (pbSelection==YES) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            }
            [cell.textLabel setText:@"Private"];
            return cell;
        }
        break;
        case 3:
        if (row == 0) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"expensiveCell"];
            if (exSelection==NO) {
            cell.accessoryType = UITableViewCellAccessoryNone;
            } else if (exSelection==YES) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            }
            [cell.textLabel setText:@"Expensive"];
            return cell;
        } else if (row == 1) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"averageCostCell"];
            if (acSelection==NO) {
            cell.accessoryType = UITableViewCellAccessoryNone;
            } else if (acSelection==YES) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            }
            [cell.textLabel setText:@"Average"];
            return cell;
        } else if (row == 2) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"inexpensiveCell"];
            if (ieSelection==NO) {
            cell.accessoryType = UITableViewCellAccessoryNone;
            } else if (ieSelection==YES) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            }
            [cell.textLabel setText:@"Inexpensive"];
            return cell;
        }
        break;
        default:
        break;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)newIndexPath
{
    int section = [newIndexPath section];
    int row = [newIndexPath row];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:newIndexPath];
    switch (section) {
        case 0:
        if (row == 0) {
            NSLog(@"Section 1, Row 1, Near or Far, Northeast");
            if (cell.accessoryType == UITableViewCellAccessoryNone) {
                NSLog(@"Setting the cell to have a checkmark (Filter is active)");
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
                [self setNeFilter:YES];
                [self setNeSelection:YES];
            } else {
                NSLog(@"Removing the checkmark from the cell (Filter is inactive)");
                cell.accessoryType = UITableViewCellAccessoryNone;
                [self setNeFilter:NO];
                [self setNeSelection:NO];
            }
        } if (row == 1) {
            NSLog(@"Section 1, Row 2, Near or Far, Midwest");
            if (cell.accessoryType == UITableViewCellAccessoryNone) {
                NSLog(@"Setting the cell to have a checkmark (Filter is active)");
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
                [self setMwFilter:YES];
                [self setMwSelection:YES];
            } else {
                NSLog(@"Removing the checkmark from the cell (Filter is inactive)");
                cell.accessoryType = UITableViewCellAccessoryNone;
                [self setMwFilter:NO];
                [self setMwSelection:NO];
            }
        } if (row == 2) {
            NSLog(@"Section 1, Row 3, Near or Far, South");
            if (cell.accessoryType == UITableViewCellAccessoryNone) {
                NSLog(@"Setting the cell to have a checkmark (Filter is active)");
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
                [self setSoFilter:YES];
                [self setSoSelection:YES];
            } else {
                NSLog(@"Removing the checkmark from the cell (Filter is inactive)");
                cell.accessoryType = UITableViewCellAccessoryNone;
                [self setSoFilter:NO];
                [self setSoSelection:NO];
            }
        } if (row == 3) {
            NSLog(@"Section 1, Row 4, Near or Far, West");
            if (cell.accessoryType == UITableViewCellAccessoryNone) {
                NSLog(@"Setting the cell to have a checkmark (Filter is active)");
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
                [self setWFilter:YES];
                [self setWSelection:YES];
            } else {
                NSLog(@"Removing the checkmark from the cell (Filter is inactive)");
                cell.accessoryType = UITableViewCellAccessoryNone;
                [self setWFilter:NO];
                [self setWSelection:NO];
            }
        }
        break;
        case 1:
        if (row == 0) {
            NSLog(@"Section 2, Row 1, Big or Small, Big");
            if (cell.accessoryType == UITableViewCellAccessoryNone) {
                NSLog(@"Setting the cell to have a checkmark (Filter is active)");
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
                [self setBFilter:YES];
                [self setBSelection:YES];
            } else {
                NSLog(@"Removing the checkmark from the cell (Filter is inactive)");
                cell.accessoryType = UITableViewCellAccessoryNone;
                [self setBFilter:NO];
                [self setBSelection:NO];
            }
        } if (row == 1) {
            NSLog(@"Section 2, Row 2, Big or Small, Average");
            if (cell.accessoryType == UITableViewCellAccessoryNone) {
                NSLog(@"Setting the cell to have a checkmark (Filter is active)");
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
                [self setAsFilter:YES];
                [self setAsSelection:YES];
            } else {
                NSLog(@"Removing the checkmark from the cell (Filter is inactive)");
                cell.accessoryType = UITableViewCellAccessoryNone;
                [self setAsFilter:NO];
                [self setAsSelection:NO];
            }
        } if (row == 2) {
            NSLog(@"Section 2, Row 3, Big or Small, Small");
            if (cell.accessoryType == UITableViewCellAccessoryNone) {
                NSLog(@"Setting the cell to have a checkmark (Filter is active)");
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
                [self setSmFilter:YES];
                [self setSmSelection:YES];
            } else {
                NSLog(@"Removing the checkmark from the cell (Filter is inactive)");
                cell.accessoryType = UITableViewCellAccessoryNone;
                [self setSmFilter:NO];
                [self setSmSelection:NO];
            }
        }
        break;
        case 2:
        if (row == 0) {
            NSLog(@"Section 3, Row 1, Public or Private, Public");
            if (cell.accessoryType == UITableViewCellAccessoryNone) {
                NSLog(@"Setting the cell to have a checkmark (Filter is active)");
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
                [self setPbFilter:YES];
                [self setPbSelection:YES];
            } else {
                NSLog(@"Removing the checkmark from the cell (Filter is inactive)");
                cell.accessoryType = UITableViewCellAccessoryNone;
                [self setPbFilter:NO];
                [self setPbSelection:NO];
            }
        } if (row == 1) {
            NSLog(@"Section 3, Row 2, Public or Private, Private");
            if (cell.accessoryType == UITableViewCellAccessoryNone) {
                NSLog(@"Setting the cell to have a checkmark (Filter is active)");
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
                [self setPvFilter:YES];
                [self setPvSelection:YES];
            } else {
                NSLog(@"Removing the checkmark from the cell (Filter is inactive)");
                cell.accessoryType = UITableViewCellAccessoryNone;
                [self setPvFilter:NO];
                [self setPvSelection:NO];
            }
        }
        break;
        case 3:
        if (row == 0) {
            NSLog(@"Section 4, Row 1, Expensive or Inexpensive, Expensive");
            if (cell.accessoryType == UITableViewCellAccessoryNone) {
                NSLog(@"Setting the cell to have a checkmark (Filter is active)");
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
                [self setExFilter:YES];
                [self setExSelection:YES];
            } else {
                NSLog(@"Removing the checkmark from the cell (Filter is inactive)");
                cell.accessoryType = UITableViewCellAccessoryNone;
                [self setExFilter:NO];
                [self setExSelection:NO];
            }
        } if (row == 1) {
            NSLog(@"Section 4, Row 2, Expensive or Inexpensive, Average");
            if (cell.accessoryType == UITableViewCellAccessoryNone) {
                NSLog(@"Setting the cell to have a checkmark (Filter is active)");
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
                [self setAcFilter:YES];
                [self setAcSelection:YES];
            } else {
                NSLog(@"Removing the checkmark from the cell (Filter is inactive)");
                cell.accessoryType = UITableViewCellAccessoryNone;
                [self setAcFilter:NO];
                [self setAcSelection:NO];
            }
        } if (row == 2) {
            NSLog(@"Section 4, Row 3, Expensive or Inexpensive, Inexpensive");
            if (cell.accessoryType == UITableViewCellAccessoryNone) {
                NSLog(@"Setting the cell to have a checkmark (Filter is active)");
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
                [self setIeFilter:YES];
                [self setIeSelection:YES];
            } else {
                NSLog(@"Removing the checkmark from the cell (Filter is inactive)");
                cell.accessoryType = UITableViewCellAccessoryNone;
                [self setIeFilter:NO];
                [self setIeSelection:NO];
            }
        }
        break;
        default:
            break;
    }
    NSLog(@"Show current filter values, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d", neFilter, mwFilter, soFilter, wFilter, bFilter, asFilter, smFilter, pbFilter, pvFilter, exFilter, acFilter, ieFilter);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Check Filters Segue"]) {
        if (neSelection==YES) {
            [self setNeFilter:YES]; }
        if (mwSelection==YES) {
            [self setMwFilter:YES]; }
        if (soSelection==YES) {
            [self setSoFilter:YES]; }
        if (wSelection==YES) {
            [self setWFilter:YES]; }
        if (bSelection==YES) {
            [self setBFilter:YES]; }
        if (asSelection==YES) {
            [self setAsFilter:YES]; }
        if (smSelection==YES) {
            [self setSmFilter:YES]; }
        if (pbSelection==YES) {
            [self setPbFilter:YES]; }
        if (pvSelection==YES) {
            [self setPvFilter:YES]; }
        if (exSelection==YES) {
            [self setExFilter:YES]; }
        if (acSelection==YES) {
            [self setAcFilter:YES]; }
        if (ieSelection==YES) {
            [self setIeFilter:YES]; }
        if (neFilter==NO) {
            if (mwFilter==NO) {
                if (soFilter==NO) {
                    if (wFilter==NO) {
                        [self setNeFilter:YES];
                        [self setMwFilter:YES];
                        [self setSoFilter:YES];
                        [self setWFilter:YES];
                    } else {
                        NSLog(@"Stopping after NE");
                        nil; }
                } else {
                    NSLog(@"Stopping after MW");
                    nil; }
            } else {
                NSLog(@"Stopping after S");
                nil; }
        } else {
            NSLog(@"Stopping after W");
            nil; }
        if (bFilter==NO) {
            if (asFilter==NO) {
                if (smFilter==NO) {
                    [self setBFilter:YES];
                    [self setAsFilter:YES];
                    [self setSmFilter:YES];
                } else {
                    NSLog(@"Stopping after Big");
                    nil; }
            } else {
                NSLog(@"Stopping after Average");
                nil; }
        } else {
            NSLog(@"Stopping after Small");
            nil; }
        if (pbFilter==NO) {
            if (pvFilter==NO) {
                [self setPbFilter:YES];
                [self setPvFilter:YES];
            } else {
                NSLog(@"Stopping after Public");
                nil; }
        } else {
            NSLog(@"Stopping after Private");
            nil; }
        if (exFilter==NO) {
            if (acFilter==NO) {
                if (ieFilter==NO) {
                    [self setExFilter:YES];
                    [self setAcFilter:YES];
                    [self setIeFilter:YES];
                } else {
                    NSLog(@"Stopping after Expensive");
                    nil; }
            } else {
                NSLog(@"Stopping after Average");
                nil; }
        } else {
            NSLog(@"Stopping after Inexpensive");
            nil; }

        NSLog(@"Final filter values set to %d %d %d %d %d %d %d %d %d %d %d %d", neFilter, mwFilter, soFilter, wFilter, bFilter, asFilter, smFilter, pbFilter, pvFilter, exFilter, acFilter, ieFilter);
        
        if (neFilter==NO) {
            [segue.destinationViewController setNortheast:@"Filter out colleges"];
        } else {
            [segue.destinationViewController setNortheast:@"NE"]; }
        if (mwFilter==NO) {
            [segue.destinationViewController setMidwest:@"Filter out colleges"];
        } else {
            [segue.destinationViewController setMidwest:@"MW"]; } 
        if (soFilter==NO) {
            [segue.destinationViewController setSouth:@"Filter out colleges"];
        } else {
            [segue.destinationViewController setSouth:@"S"]; } 
        if (wFilter==NO) {
            [segue.destinationViewController setWest:@"Filter out colleges"];
        } else {
            [segue.destinationViewController setWest:@"W"]; } 
        if (bFilter==NO) {
            [segue.destinationViewController setBig:@"Filter out colleges"];
        } else {
            [segue.destinationViewController setBig:@"Big"]; } 
        if (asFilter==NO) {
            [segue.destinationViewController setAverageSize:@"Filter out colleges"];
        } else {
            [segue.destinationViewController setAverageSize:@"Average"]; } 
        if (smFilter==NO) {
            [segue.destinationViewController setSmall:@"Filter out colleges"];
        } else {
            [segue.destinationViewController setSmall:@"Small"]; } 
        if (pbFilter==NO) {
            [segue.destinationViewController setPublicCollege:@"Filter out colleges"];
        } else {
            [segue.destinationViewController setPublicCollege:@"Public"]; } 
        if (pvFilter==NO) {
            [segue.destinationViewController setPrivateCollege:@"Filter out colleges"];
        } else {
            [segue.destinationViewController setPrivateCollege:@"Private"]; } 
        if (exFilter==NO) {
            [segue.destinationViewController setExpensive:@"Filter out colleges"];
        } else {
            [segue.destinationViewController setExpensive:@"Expensive"]; } 
        if (acFilter==NO) {
            [segue.destinationViewController setAverageCost:@"Filter out colleges"];
        } else {
            [segue.destinationViewController setAverageCost:@"Average"]; } 
        if (ieFilter==NO) {
            [segue.destinationViewController setInexpensive:@"Filter out colleges"];
        } else {
            [segue.destinationViewController setInexpensive:@"Inexpensive"]; }

        NSLog(@"Setting FilterTable as a delegate of FilterResults");
        FilterResults *filterResults = segue.destinationViewController;
        filterResults.delegate = self;
        filterResults.managedObjectContext = self.managedObjectContext;
    }
}


@end