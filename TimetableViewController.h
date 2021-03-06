//
//  TimetableViewController.h
//  Seiko Festa 57th
//
//  Created by Daisuke  on 2016/02/21.
//  Copyright (c) 2016年 Daisuke Masuda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailView.h"

@interface TimetableViewController : UIViewController<UIScrollViewDelegate>{
    
    //開始位置
    int startPoint;
    
    UIScrollView *mainScrollView;
    UIScrollView *scrollView1;
    UIScrollView *scrollView2;
    UIScrollView *scrollView3;
    UIScrollView *scrollView4;
    UIScrollView *scrollView5;
    UIScrollView *scrollView6;
    UIScrollView *scrollView7;
    
    UIPageControl *pageControl;
    
    UIButton *buttonOne1;
    UIButton *buttonOne2;
    UIButton *buttonOne3;
    UIButton *buttonOne4;
    UIButton *buttonOne5;
    UIButton *buttonOne6;
    
    UIButton *buttonTwo1;
    UIButton *buttonTwo2;
    UIButton *buttonTwo3;
    UIButton *buttonTwo4;
    UIButton *buttonTwo5;
    UIButton *buttonTwo6;
    UIButton *buttonTwo7;
    UIButton *buttonTwo8;
    UIButton *buttonTwo9;
    UIButton *buttonTwo10;
    
    UIButton *buttonThree1;
    UIButton *buttonThree2;
    UIButton *buttonThree3;
    UIButton *buttonThree4;
    UIButton *buttonThree5;
    
    UIButton *buttonFour1;
    UIButton *buttonFour2;
    UIButton *buttonFour3;
    UIButton *buttonFour4;
    UIButton *buttonFour5;
    
    UIButton *buttonFive1;
    UIButton *buttonFive2;
    UIButton *buttonFive3;
    UIButton *buttonFive4;
    UIButton *buttonFive5;
    
    UIButton *buttonSix1;
    
    UIButton *buttonSeven1;
    
    NSString *whichList;
    
    UILabel *nav_title;
    
    int month;
    int day;
    int hour;
    int minute;
    
}
@property(nonatomic) int flag;
- (IBAction)changeDate:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@end
