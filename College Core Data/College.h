//
//  College.h
//  MyColleges
//
//  Created by Jackson Graves on 7/20/12.
//  Copyright (c) 2012 Me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface College : NSManagedObject

@property (strong, nonatomic) NSString * name;
@property (strong, nonatomic) NSString * type;
@property (strong, nonatomic) NSString * city;
@property (strong, nonatomic) NSString * state;
@property (strong, nonatomic) NSString * region;
@property (strong, nonatomic) NSString * app;
@property (strong, nonatomic) NSString * acc;
@property (strong, nonatomic) NSString * att;
@property (strong, nonatomic) NSString * add;
@property (strong, nonatomic) NSString * admis;
@property (strong, nonatomic) NSString * fax;
@property (strong, nonatomic) NSString * finAid;
@property (strong, nonatomic) NSString * email;
@property (strong, nonatomic) NSString * web;
@property (strong, nonatomic) NSString * schoolSize;
@property (strong, nonatomic) NSString * totUndEn;
@property (strong, nonatomic) NSString * mF;
@property (strong, nonatomic) NSString * outState;
@property (strong, nonatomic) NSString * pubHS;
@property (strong, nonatomic) NSString * liveCamp;
@property (strong, nonatomic) NSString * frat;
@property (strong, nonatomic) NSString * sor;
@property (strong, nonatomic) NSString * afAm;
@property (strong, nonatomic) NSString * asian;
@property (strong, nonatomic) NSString * cauc;
@property (strong, nonatomic) NSString * hisp;
@property (strong, nonatomic) NSString * nA;
@property (strong, nonatomic) NSString * intNat;
@property (strong, nonatomic) NSString * countRep;
@property (strong, nonatomic) NSString * satCritRead;
@property (strong, nonatomic) NSString * satMath;
@property (strong, nonatomic) NSString * satWrite;
@property (strong, nonatomic) NSString * actComp;
@property (strong, nonatomic) NSString * avHSGPA;
@property (strong, nonatomic) NSString * top10;
@property (strong, nonatomic) NSString * top25;
@property (strong, nonatomic) NSString * top50;
@property (strong, nonatomic) NSString * tuit;
@property (strong, nonatomic) NSString * inTuit;
@property (strong, nonatomic) NSString * outTuit;
@property (strong, nonatomic) NSString * rBoard;
@property (strong, nonatomic) NSString * reqFees;
@property (strong, nonatomic) NSString * bkSup;
@property (strong, nonatomic) NSString * studRecFinAid;
@property (strong, nonatomic) NSString * expense;
@property (strong, nonatomic) NSString * totCost;
@property (strong, nonatomic) NSString * grad4;
@property (strong, nonatomic) NSString * grad6;
@property (strong, nonatomic) NSString * cal;
@property (strong, nonatomic) NSString * studFac;
@property (strong, nonatomic) NSString * cClass;
@property (strong, nonatomic) NSString * cLab;
@property (strong, nonatomic) NSString * popMaj;
@property (strong, nonatomic) NSString *favoriteStatus;

@end