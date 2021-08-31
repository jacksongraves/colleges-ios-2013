//
//  Web.h
//  MyColleges
//
//  Created by Jackson Graves on 11/24/12.
//  Copyright (c) 2012 Me. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Web;
@protocol WebDelegate <NSObject>
@end

@interface Web : UIViewController

@property (nonatomic, weak) id <WebDelegate> delegate;

@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) NSString *collegeURL;

@end