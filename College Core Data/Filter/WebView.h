//
//  WebView.h
//  College Core Data
//
//  Created by Jackson Graves on 11/23/12.
//  Copyright (c) 2012 Me. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WebView;
@protocol WebViewDelegate <NSObject>
@end

@interface WebView : UIViewController

@property (nonatomic, weak) id <WebViewDelegate> delegate;

@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) NSString *collegeURL;

@end
