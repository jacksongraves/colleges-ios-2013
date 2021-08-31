//
//  More.m
//  MyColleges
//
//  Created by Jackson Graves on 11/22/12.
//  Copyright (c) 2012 Me. All rights reserved.
//

#import "More.h"

@implementation More

@synthesize managedObjectContext = __managedObjectContext;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {}
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)sendEmail:(id)sender {
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailComposer;
        NSArray *emailAddresses;
        emailAddresses=[[NSArray alloc]initWithObjects:@"jackson.graves@me.com", nil];
        
        mailComposer=[[MFMailComposeViewController alloc] init];
        mailComposer.mailComposeDelegate=self;
        [mailComposer setToRecipients:emailAddresses];
        [mailComposer setSubject:@"App Feedback"];
        [self presentModalViewController:mailComposer animated:YES];
    } else {
        UIAlertView *mailDisallowed = [[UIAlertView alloc] initWithTitle:@"Failure"
                                                        message:@"This device cannot send Mail"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [mailDisallowed show];
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [self dismissModalViewControllerAnimated:YES];
}

@end