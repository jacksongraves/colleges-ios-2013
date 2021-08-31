//
//  Detail.h
//  MyColleges
//
//  Created by Jackson Graves on 11/24/12.
//  Copyright (c) 2012 Me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "College.h"
#import "Web.h"

@class Detail;
@protocol DetailDelegate <NSObject>
@end

@interface Detail : UITableViewController <WebDelegate, MFMailComposeViewControllerDelegate>

@property (nonatomic, weak) id <DetailDelegate> delegate;
@property (strong, nonatomic) College *college;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *type;
@property (strong, nonatomic) IBOutlet UILabel *app;
@property (strong, nonatomic) IBOutlet UILabel *acc;
@property (strong, nonatomic) IBOutlet UILabel *att;
@property (strong, nonatomic) IBOutlet UILabel *add;
@property (strong, nonatomic) IBOutlet UILabel *admis;
@property (strong, nonatomic) IBOutlet UILabel *fax;
@property (strong, nonatomic) IBOutlet UILabel *finAid;
@property (strong, nonatomic) IBOutlet UILabel *email;
@property (strong, nonatomic) IBOutlet UILabel *web;
@property (strong, nonatomic) IBOutlet UILabel *totUndEn;
@property (strong, nonatomic) IBOutlet UILabel *mF;
@property (strong, nonatomic) IBOutlet UILabel *outState;
@property (strong, nonatomic) IBOutlet UILabel *pubHS;
@property (strong, nonatomic) IBOutlet UILabel *liveCamp;
@property (strong, nonatomic) IBOutlet UILabel *frat;
@property (strong, nonatomic) IBOutlet UILabel *sor;
@property (strong, nonatomic) IBOutlet UILabel *afAm;
@property (strong, nonatomic) IBOutlet UILabel *asian;
@property (strong, nonatomic) IBOutlet UILabel *cauc;
@property (strong, nonatomic) IBOutlet UILabel *hisp;
@property (strong, nonatomic) IBOutlet UILabel *nA;
@property (strong, nonatomic) IBOutlet UILabel *intNat;
@property (strong, nonatomic) IBOutlet UILabel *countRep;
@property (strong, nonatomic) IBOutlet UILabel *satCritRead;
@property (strong, nonatomic) IBOutlet UILabel *satMath;
@property (strong, nonatomic) IBOutlet UILabel *satWrite;
@property (strong, nonatomic) IBOutlet UILabel *actComp;
@property (strong, nonatomic) IBOutlet UILabel *avHSGPA;
@property (strong, nonatomic) IBOutlet UILabel *top10;
@property (strong, nonatomic) IBOutlet UILabel *top25;
@property (strong, nonatomic) IBOutlet UILabel *top50;
@property (strong, nonatomic) IBOutlet UILabel *tuit;
@property (strong, nonatomic) IBOutlet UILabel *inTuit;
@property (strong, nonatomic) IBOutlet UILabel *outTuit;
@property (strong, nonatomic) IBOutlet UILabel *rBoard;
@property (strong, nonatomic) IBOutlet UILabel *reqFees;
@property (strong, nonatomic) IBOutlet UILabel *bkSup;
@property (strong, nonatomic) IBOutlet UILabel *studRecFinAid;
@property (strong, nonatomic) IBOutlet UILabel *totCost;
@property (strong, nonatomic) IBOutlet UILabel *grad4;
@property (strong, nonatomic) IBOutlet UILabel *grad6;
@property (strong, nonatomic) IBOutlet UILabel *cal;
@property (strong, nonatomic) IBOutlet UILabel *studFac;
@property (strong, nonatomic) IBOutlet UILabel *cClass;
@property (strong, nonatomic) IBOutlet UILabel *cLab;
@property (strong, nonatomic) IBOutlet UILabel *popMaj;
@property (strong, nonatomic) IBOutlet UIButton *addToFavorites;

- (IBAction)toggleFavorite:(id)sender;
- (IBAction)sendEmail:(id)sender;

@end