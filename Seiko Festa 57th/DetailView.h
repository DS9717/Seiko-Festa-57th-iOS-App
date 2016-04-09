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
#import "FXBlurView.h"
#import "ShareViewController.h"

@interface DetailView : UIViewController {
    
    //画像左右余白
    int space;
    //画像サイズ
    int length;
    //画像下余白
    int spaceBelow;
    //タイトルフォントサイズ
    int titleSize;
    //白線太さ
    int lineSize;
    //白線-説明文間隔
    int spaceBetween;
    //テキストフォント
    int explainSize;
    
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
    
    FXBlurView *blurView;
    
    UIView *blackView;
    
    float iOSVersion;
    
}
@property(nonatomic) int flag;
@property (weak, nonatomic) IBOutlet UINavigationItem *navigationBar;
@property(nonatomic) NSString *whatList;

@end
