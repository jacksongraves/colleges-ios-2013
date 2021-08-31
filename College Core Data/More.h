//
//  More.h
//  MyColleges
//
//  Created by Jackson Graves on 11/22/12.
//  Copyright (c) 2012 Me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "CoreDataTableViewController.h"
#import "College.h"

@interface More : UITableViewController <MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (IBAction)sendEmail:(id)sender;

@end