//
//  DetailView.h
//  Seiko Festa 57th
//
//  Created by Yuya Imanari on 2016/01/25(月).
//  Copyright © 2016年 Daisuke Masuda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "ListView.h"
#import "TimetableViewController.h"

@interface DetailView : UIViewController{
    
    NSString *_whatList;
    UIScrollView *imageScroll;
    UIImage *detailImage;
    UIImageView *detailImageview;
    UIImage *mapImage;
    UIImageView *mapImageview;
    UIButton *left;
    UIButton *right;
    
    UILabel *nav_title;
    
    UILabel *_detailTitle;
    UITextView *_explainSentence;
    
}
@property(nonatomic) int flag;
@property (weak, nonatomic) IBOutlet UINavigationItem *navigationBar;
@property(nonatomic) NSString *whatList;

@end
