//
//  ViewController.h
//  Seiko Festa 57th
//
//  Created by Daisuke  on 2016/01/15.
//  Copyright (c) 2016年 Daisuke Masuda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "DetailView.h"
#import "ListView.h"


@interface ViewController : UIViewController <UIApplicationDelegate>{
    
    UIImage *featuredImage;
    UIImage *featuredImage2;
    
    UIButton *featuredImageButton;
    UIButton *featuredImageButton2;
    
    NSArray *organizationFeaturedImages;
    
    int imageNumber;
    int imageNumber2;
    
    UIScrollView *mainScrollView;
    UIScrollView *scrollView1;
    UIScrollView *scrollView2;
    UIScrollView *scrollView3;
    UIScrollView *scrollView4;
    UIScrollView *scrollView5;
    
    //食品
    UIButton *buttonOne1;
    UIButton *buttonOne2;
    UIButton *buttonOne3;
    UIButton *buttonOne4;
    UIButton *buttonOne5;
    UIButton *buttonOne6;
    
    UILabel *foodLabel;
    UILabel *buttonOne1Label;
    UILabel *buttonOne2Label;
    UILabel *buttonOne3Label;
    UILabel *buttonOne4Label;
    UILabel *buttonOne5Label;
    UILabel *buttonOne6Label;
    
    //趣味研
    UIButton *buttonTwo1;
    UIButton *buttonTwo2;
    UIButton *buttonTwo3;
    UIButton *buttonTwo4;
    UIButton *buttonTwo5;
    UIButton *buttonTwo6;
    
    UILabel *displayLabel;
    UILabel *buttonTwo1Label;
    UILabel *buttonTwo2Label;
    UILabel *buttonTwo3Label;
    UILabel *buttonTwo4Label;
    UILabel *buttonTwo5Label;
    UILabel *buttonTwo6Label;
    
    //バンド
    UIButton *buttonThree1;
    UIButton *buttonThree2;
    UIButton *buttonThree3;
    UIButton *buttonThree4;
    UIButton *buttonThree5;
    UIButton *buttonThree6;
    
    UILabel *bandLabel;
    UILabel *buttonThree1Label;
    UILabel *buttonThree2Label;
    UILabel *buttonThree3Label;
    UILabel *buttonThree4Label;
    UILabel *buttonThree5Label;
    UILabel *buttonThree6Label;
    
    //講堂･小講堂
    UIButton *buttonFour1;
    UIButton *buttonFour2;
    UIButton *buttonFour3;
    UIButton *buttonFour4;
    UIButton *buttonFour5;
    UIButton *buttonFour6;
    
    UILabel *performanceLabel;
    UILabel *buttonFour1Label;
    UILabel *buttonFour2Label;
    UILabel *buttonFour3Label;
    UILabel *buttonFour4Label;
    UILabel *buttonFour5Label;
    UILabel *buttonFour6Label;
    
    //外ステージ
    UIButton *buttonFive1;
    UIButton *buttonFive2;
    UIButton *buttonFive3;
    UIButton *buttonFive4;
    UIButton *buttonFive5;
    UIButton *buttonFive6;
    
    UILabel *stageLabel;
    UILabel *buttonFive1Label;
    UILabel *buttonFive2Label;
    UILabel *buttonFive3Label;
    UILabel *buttonFive4Label;
    UILabel *buttonFive5Label;
    UILabel *buttonFive6Label;
    
    UIButton *viewAllButton1;
    UIButton *viewAllButton2;
    UIButton *viewAllBUtton3;
    UIButton *viewAllButton4;
    UIButton *viewAllButton5;
    
    NSString *whichList;
    
}

@property(nonatomic) int flag;

@end

