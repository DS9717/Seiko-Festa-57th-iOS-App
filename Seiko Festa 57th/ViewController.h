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
    
    //左側余白
    int spaceLeft;
    //アイコン縦横長
    int length;
    //アイコン間スペース(横)
    int spaceW;
    //アイコン-テキスト間スペース(縦)
    int spaceH;
    //label フォントサイズ
    int labelFont;
    //allButon フォントサイズ
    int allButtonFont;
    //buttonLabel フォントサイズ
    int buttonLabelFont;
    
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
    UIButton *buttonOne1;   //鉄板職人
    UIButton *buttonOne2;   //麺'sRUNRUN
    UIButton *buttonOne3;   //麺☆恋
    UIButton *buttonOne4;   //俺のケバブ
    UIButton *buttonOne5;   //鳥角
    UIButton *buttonOne6;   //クレープブレーク
    UIButton *buttonOne7;   //Flapjack
    UIButton *buttonOne8;   //chocolat π
    UIButton *buttonOne9;   //Juicy Juicer
    UIButton *buttonOne10;  //綿's candy
    UIButton *buttonOne11;  //氷菓
    UIButton *buttonOne12;  //山手の泉
    UIButton *buttonOne13;  //題名のない音楽喫茶
    UIButton *buttonOne14;  //駅弁
    
    UILabel *foodLabel;
    UILabel *buttonOne1Label;
    UILabel *buttonOne2Label;
    UILabel *buttonOne3Label;
    UILabel *buttonOne4Label;
    UILabel *buttonOne5Label;
    UILabel *buttonOne6Label;
    UILabel *buttonOne7Label;
    UILabel *buttonOne8Label;
    UILabel *buttonOne9Label;
    UILabel *buttonOne10Label;
    UILabel *buttonOne11Label;
    UILabel *buttonOne12Label;
    UILabel *buttonOne13Label;
    UILabel *buttonOne14Label;
    
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

