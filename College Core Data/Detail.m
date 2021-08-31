//
//  Detail.m
//  MyColleges
//
//  Created by Jackson Graves on 11/24/12.
//  Copyright (c) 2012 Me. All rights reserved.
//

#import "Detail.h"
#import "Web.h"

@implementation Detail

@synthesize delegate;
@synthesize college = _college;
@synthesize name;
@synthesize type;
@synthesize app;
@synthesize acc;
@synthesize att;
@synthesize add;
@synthesize admis;
@synthesize fax;
@synthesize finAid;
@synthesize email;
@synthesize web;
@synthesize totUndEn;
@synthesize mF;
@synthesize outState;
@synthesize pubHS;
@synthesize liveCamp;
@synthesize frat;
@synthesize sor;
@synthesize afAm;
@synthesize asian;
@synthesize cauc;
@synthesize hisp;
@synthesize nA;
@synthesize intNat;
@synthesize countRep;
@synthesize satCritRead;
@synthesize satMath;
@synthesize satWrite;
@synthesize actComp;
@synthesize avHSGPA;
@synthesize top10;
@synthesize top25;
@synthesize top50;
@synthesize tuit;
@synthesize inTuit;
@synthesize outTuit;
@synthesize rBoard;
@synthesize reqFees;
@synthesize bkSup;
@synthesize studRecFinAid;
@synthesize totCost;
@synthesize grad4;
@synthesize grad6;
@synthesize cal;
@synthesize studFac;
@synthesize cClass;
@synthesize cLab;
@synthesize popMaj;
@synthesize addToFavorites;

- (void)viewDidLoad 
{
    NSLog(@"Setting the value of fields in this static table to that of the passed College");
    if ([self.college.favoriteStatus isEqualToString:@"Not a Favorite College"]) {
        [addToFavorites setSelected:NO];
    } else if ([self.college.favoriteStatus isEqualToString:@"Favorite College"]) {
        [addToFavorites setSelected:YES];
    }
    self.name.text = self.college.name;
    self.type.text = self.college.type;
    self.app.text = self.college.app;
    self.acc.text = self.college.acc;
    self.att.text = self.college.att;
    self.add.text = self.college.add;
    self.admis.text = self.college.admis;
    self.fax.text = self.college.fax;
    self.finAid.text = self.college.finAid;
    self.email.text = self.college.email;
    self.web.text = self.college.web;
    self.totUndEn.text = self.college.totUndEn;
    self.mF.text = self.college.mF;
    self.outState.text = self.college.outState;
    self.pubHS.text = self.college.pubHS;
    self.liveCamp.text = self.college.liveCamp;
    self.frat.text = self.college.frat;
    self.sor.text = self.college.sor;
    self.afAm.text = self.college.afAm;
    self.asian.text = self.college.asian;
    self.cauc.text = self.college.cauc;
    self.hisp.text = self.college.hisp;
    self.nA.text = self.college.nA;
    self.intNat.text = self.college.intNat;
    self.countRep.text = self.college.countRep;
    self.satCritRead.text = self.college.satCritRead;
    self.satMath.text = self.college.satMath;
    self.satWrite.text = self.college.satWrite;
    self.actComp.text = self.college.actComp;
    self.avHSGPA.text = self.college.avHSGPA;
    self.top10.text = self.college.top10;
    self.top25.text = self.college.top25;
    self.top50.text = self.college.top50;
    self.tuit.text = self.college.tuit;
    self.inTuit.text = self.college.inTuit;
    self.outTuit.text = self.college.outTuit;
    self.rBoard.text = self.college.rBoard;
    self.reqFees.text = self.college.reqFees;
    self.bkSup.text = self.college.bkSup;
    self.studRecFinAid.text = self.college.studRecFinAid;
    self.totCost.text = self.college.totCost;
    self.grad4.text = self.college.grad4;
    self.grad6.text = self.college.grad6;
    self.cal.text = self.college.cal;
    self.studFac.text = self.college.studFac;
    self.cClass.text = self.college.cClass;
    self.cLab.text = self.college.cLab;
    self.popMaj.text = self.college.popMaj;
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setName:nil];
    [self setType:nil];
    [self setApp:nil];
    [self setAcc:nil];
    [self setAtt:nil];
    [self setAdd:nil];
    [self setAdmis:nil];
    [self setFax:nil];
    [self setFinAid:nil];
    [self setEmail:nil];
    [self setWeb:nil];
    [self setTotUndEn:nil];
    [self setMF:nil];
    [self setOutState:nil];
    [self setPubHS:nil];
    [self setLiveCamp:nil];
    [self setFrat:nil];
    [self setSor:nil];
    [self setAfAm:nil];
    [self setAsian:nil];
    [self setCauc:nil];
    [self setHisp:nil];
    [self setNA:nil];
    [self setIntNat:nil];
    [self setCountRep:nil];
    [self setSatCritRead:nil];
    [self setSatMath:nil];
    [self setSatWrite:nil];
    [self setActComp:nil];
    [self setAvHSGPA:nil];
    [self setGrad4:nil];
    [self setTop10:nil];
    [self setTop25:nil];
    [self setTop50:nil];
    [self setTuit:nil];
    [self setInTuit:nil];
    [self setOutTuit:nil];
    [self setRBoard:nil];
    [self setReqFees:nil];
    [self setBkSup:nil];
    [self setStudRecFinAid:nil];
    [self setTotCost:nil];
    [self setGrad4:nil];
    [self setGrad6:nil];
    [self setCal:nil];
    [self setStudFac:nil];
    [self setCClass:nil];
    [self setCLab:nil];
    [self setPopMaj:nil];
    [super viewDidUnload];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Web Segue"]) {
        Web *web = segue.destinationViewController;
        web.delegate = self;
        [segue.destinationViewController setCollegeURL:self.college.web];
    }
}

- (IBAction)toggleFavorite:(id)sender
{
    NSLog(@"Changing Favorite Status of College and resetting the button");
    if (addToFavorites.selected==YES) {
        [addToFavorites setSelected:NO];
        [self.college setFavoriteStatus:@"Not a Favorite College"];
        [self.college.managedObjectContext save:nil];
    } else if (addToFavorites.selected==NO) {
        [addToFavorites setSelected:YES];
        [self.college setFavoriteStatus:@"Favorite College"];
        [self.college.managedObjectContext save:nil];
    }
    NSLog(@"New value of favoriteStatus property %@", self.college.favoriteStatus);
}

- (IBAction)sendEmail:(id)sender {
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailComposer;
        NSArray *emailAddresses;
        emailAddresses=[[NSArray alloc]initWithObjects:self.college.email, nil];
        mailComposer=[[MFMailComposeViewController alloc] init];
        mailComposer.mailComposeDelegate=self;
        [mailComposer setToRecipients:emailAddresses];
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