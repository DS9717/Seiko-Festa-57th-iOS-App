//
//  ShareViewController.h
//  Seiko Festa 57th
//
//  Created by Daisuke  on 2016/03/30.
//  Copyright (c) 2016年 Daisuke Masuda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import "FXBlurView.h"
#import "AppDelegate.h"
#import "DetailView.h"

@interface ShareViewController : UIViewController {
    
    UIButton *facebookButton;
    UIButton *twitterButton;
    UIButton *lineButton;
    UIButton *cancelButton;
    
    SLComposeViewController *facebook;
    SLComposeViewController *twitter;
    
    NSString *line;
    NSString *LineUrlString;
    
    float iOSVersion;
    
    UIView *onTabBarView;
    
}

@end
