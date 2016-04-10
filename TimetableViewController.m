//
//  TimetableViewController.m
//  Seiko Festa 57th
//
//  Created by Daisuke  on 2016/02/21.
//  Copyright (c) 2016年 Daisuke Masuda. All rights reserved.
//

#import "TimetableViewController.h"
#import "DetailView.h"

@interface TimetableViewController ()

@end

@implementation TimetableViewController
@synthesize flag;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // UIScrollViewのインスタンス化
    mainScrollView = [[UIScrollView alloc]init];
    
    //iOSのバージョンで分岐
    float iOSVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    
    //iOS8以降
    if(iOSVersion >= 8.0f){
        
        mainScrollView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        
    }else{
        
        mainScrollView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-113);
        
    }
    
    //横スクロールのインジケータを非表示にする
    mainScrollView.showsHorizontalScrollIndicator = NO;
    //ページングを有効にする
    mainScrollView.pagingEnabled = YES;
    mainScrollView.userInteractionEnabled = YES;
    //デリゲートを有効にする
    mainScrollView.delegate = self;
    mainScrollView.directionalLockEnabled = YES;
    mainScrollView.bounces = NO;
    mainScrollView.backgroundColor = [UIColor clearColor];
    
    [mainScrollView setContentSize:CGSizeMake(5*(self.view.bounds.size.width), self.view.bounds.size.height-113)];
    
    scrollView1 = [[UIScrollView alloc]init];
    scrollView1.frame = CGRectMake(self.view.bounds.size.width * 0, 0, self.view.bounds.size.width, self.view.bounds.size.height-113);
    scrollView1.showsHorizontalScrollIndicator = NO;
    scrollView1.pagingEnabled = NO;
    scrollView1.userInteractionEnabled = YES;
    scrollView1.delegate = self;
    scrollView1.directionalLockEnabled = YES;
    scrollView1.bounces = YES;
    [scrollView1 setContentSize:CGSizeMake(self.view.bounds.size.width, (self.view.bounds.size.width * 19 / 32) * 3 + (self.view.bounds.size.width * 18 / 32))];
    scrollView1.backgroundColor=[UIColor clearColor];
    [mainScrollView addSubview:scrollView1];
    
    scrollView2 = [[UIScrollView alloc]init];
    scrollView2.frame = CGRectMake(self.view.bounds.size.width * 1, 0, self.view.bounds.size.width, self.view.bounds.size.height-113);
    scrollView2.showsHorizontalScrollIndicator = NO;
    scrollView2.pagingEnabled = NO;
    scrollView2.userInteractionEnabled = YES;
    scrollView2.delegate = self;
    scrollView2.directionalLockEnabled = YES;
    scrollView2.bounces = YES;
    [scrollView2 setContentSize:CGSizeMake(self.view.bounds.size.width, (self.view.bounds.size.width * 19 / 32) * 8 + (self.view.bounds.size.width * 18 / 32))];
    scrollView2.backgroundColor=[UIColor clearColor];
    [mainScrollView addSubview:scrollView2];
    
    scrollView3 = [[UIScrollView alloc]init];
    scrollView3.frame = CGRectMake(self.view.bounds.size.width * 2, 0, self.view.bounds.size.width, self.view.bounds.size.height-113);
    scrollView3.showsHorizontalScrollIndicator = NO;
    scrollView3.pagingEnabled = NO;
    scrollView3.userInteractionEnabled = YES;
    scrollView3.delegate = self;
    scrollView3.directionalLockEnabled = YES;
    scrollView3.bounces = YES;
    [scrollView3 setContentSize:CGSizeMake(self.view.bounds.size.width, (self.view.bounds.size.width * 19 / 32) * 3 + (self.view.bounds.size.width * 18 / 32))];
    scrollView3.backgroundColor=[UIColor clearColor];
    [mainScrollView addSubview:scrollView3];
    
    scrollView4 = [[UIScrollView alloc]init];
    scrollView4.frame = CGRectMake(self.view.bounds.size.width * 3, 0, self.view.bounds.size.width, self.view.bounds.size.height-113);
    scrollView4.showsHorizontalScrollIndicator = NO;
    scrollView4.pagingEnabled = NO;
    scrollView4.userInteractionEnabled = YES;
    scrollView4.delegate = self;
    scrollView4.directionalLockEnabled = YES;
    scrollView4.bounces = YES;
    [scrollView4 setContentSize:CGSizeMake(self.view.bounds.size.width, (self.view.bounds.size.width * 19 / 32) * 4 + (self.view.bounds.size.width * 18 / 32))];
    scrollView4.backgroundColor=[UIColor clearColor];
    [mainScrollView addSubview:scrollView4];
    
    scrollView5 = [[UIScrollView alloc]init];
    scrollView5.frame = CGRectMake(self.view.bounds.size.width * 4, 0, self.view.bounds.size.width, self.view.bounds.size.height-113);
    scrollView5.showsHorizontalScrollIndicator = NO;
    scrollView5.pagingEnabled = NO;
    scrollView5.userInteractionEnabled = YES;
    scrollView5.delegate = self;
    scrollView5.directionalLockEnabled = YES;
    scrollView5.bounces = YES;
    [scrollView5 setContentSize:CGSizeMake(self.view.bounds.size.width, (self.view.bounds.size.width * 19 / 32) * 3 + (self.view.bounds.size.width * 18 / 32))];
    scrollView5.backgroundColor=[UIColor clearColor];
    [mainScrollView addSubview:scrollView5];
    
    scrollView6 = [[UIScrollView alloc]init];
    scrollView6.frame = CGRectMake(self.view.bounds.size.width * 5, 0, self.view.bounds.size.width, self.view.bounds.size.height-113);
    scrollView6.showsHorizontalScrollIndicator = NO;
    scrollView6.pagingEnabled = NO;
    scrollView6.userInteractionEnabled = YES;
    scrollView6.delegate = self;
    scrollView6.directionalLockEnabled = YES;
    scrollView6.bounces = YES;
    [scrollView6 setContentSize:CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height-113)];
    scrollView6.backgroundColor=[UIColor clearColor];
    [mainScrollView addSubview:scrollView6];
    
    scrollView7 = [[UIScrollView alloc]init];
    scrollView7.frame = CGRectMake(self.view.bounds.size.width * 6, 0, self.view.bounds.size.width, self.view.bounds.size.height-113);
    scrollView7.showsHorizontalScrollIndicator = NO;
    scrollView7.pagingEnabled = NO;
    scrollView7.userInteractionEnabled = YES;
    scrollView7.delegate = self;
    scrollView7.directionalLockEnabled = YES;
    scrollView7.bounces = YES;
    [scrollView7 setContentSize:CGSizeMake(self.view.bounds.size.width,self.view.bounds.size.height-113)];
    scrollView7.backgroundColor=[UIColor clearColor];
    [mainScrollView addSubview:scrollView7];
    
    
    [self.view addSubview:mainScrollView];
    
    //UIPageControlのインスタンス化
    CGFloat x = (self.view.bounds.size.width - 300) / 2;
    pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(x, self.view.bounds.size.height-173, 300, 50)];
    //ドットの色
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    // ページ数を設定
   pageControl.numberOfPages = 5;
    //現在のページを設定
    pageControl.currentPage = 0;
    //ページコントロールをタップされたときに呼ばれるメソッドを設定
    pageControl.userInteractionEnabled = YES;
    [pageControl addTarget:self
                    action:@selector(pageControl_Tapped:)
          forControlEvents:UIControlEventValueChanged];
    //ページコントロールを貼付ける
    [self.view addSubview:pageControl];
    
    //Navigation Itemのタイトルのフォントを設定
    nav_title=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 40)];
    nav_title.textColor=[UIColor whiteColor];
    nav_title.text = @"講堂";
    nav_title.textAlignment=NSTextAlignmentCenter;
    
    [nav_title setFont:[UIFont boldSystemFontOfSize:18]];
    self.navigationItem.titleView=nav_title;
    
    
    //講堂
    buttonOne1= [[UIButton alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 0, self.view.bounds.size.width, self.view.bounds.size.width * 19 / 32)];
    [buttonOne1 setImage:[UIImage imageNamed:@"天使の歌声-タイムテーブル.png"] forState:UIControlStateNormal];
    [buttonOne1 addTarget:self
                 action:@selector(buttonOne1Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView1 addSubview:buttonOne1];
    
    buttonOne2= [[UIButton alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 1, self.view.bounds.size.width, self.view.bounds.size.width * 19 / 32)];
    [buttonOne2 setImage:[UIImage imageNamed:@"ミュージックサロン-タイムテーブル.png"] forState:UIControlStateNormal];
    [buttonOne2 addTarget:self
                   action:@selector(buttonOne2Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView1 addSubview:buttonOne2];
    
    buttonOne3= [[UIButton alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 2, self.view.bounds.size.width, self.view.bounds.size.width * 19 / 32)];
    [buttonOne3 setImage:[UIImage imageNamed:@"ボールぽこぽこ-タイムテーブル.png"] forState:UIControlStateNormal];
    [buttonOne3 addTarget:self
                   action:@selector(buttonOne3Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView1 addSubview:buttonOne3];
    
    buttonOne4= [[UIButton alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 3, self.view.bounds.size.width, self.view.bounds.size.width * 18 / 32)];
    [buttonOne4 setImage:[UIImage imageNamed:@"英語劇-タイムテーブル.png"] forState:UIControlStateNormal];
    [buttonOne4 addTarget:self
                   action:@selector(buttonOne4Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView1 addSubview:buttonOne4];
    
    
    //外ステージ
    buttonTwo1= [[UIButton alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 0, self.view.bounds.size.width, self.view.bounds.size.width * 19 / 32)];
    [buttonTwo1 setImage:[UIImage imageNamed:@"S-O-S-タイムテーブル.png"] forState:UIControlStateNormal];
    [buttonTwo1 addTarget:self
                   action:@selector(buttonTwo1Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo1];
    
    buttonTwo2= [[UIButton alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 1, self.view.bounds.size.width, self.view.bounds.size.width * 19 / 32)];
    [buttonTwo2 setImage:[UIImage imageNamed:@"ギネスに挑戦！！-タイムテーブル.png"] forState:UIControlStateNormal];
    [buttonTwo2 addTarget:self
                   action:@selector(buttonTwo2Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo2];
    
    buttonTwo3= [[UIButton alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 2, self.view.bounds.size.width, self.view.bounds.size.width * 19 / 32)];
    [buttonTwo3 setImage:[UIImage imageNamed:@"替え劇〜赤ずきん〜-タイムテーブル.png"] forState:UIControlStateNormal];
    [buttonTwo3 addTarget:self
                   action:@selector(buttonTwo3Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo3];
    
    buttonTwo4= [[UIButton alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 3, self.view.bounds.size.width, self.view.bounds.size.width * 19 / 32)];
    [buttonTwo4 setImage:[UIImage imageNamed:@"The-笑-1-GP-タイムテーブル.png"] forState:UIControlStateNormal];
    [buttonTwo4 addTarget:self
                   action:@selector(buttonTwo4Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo4];
    
    buttonTwo5= [[UIButton alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 4, self.view.bounds.size.width, self.view.bounds.size.width * 19 / 32)];
    [buttonTwo5 setImage:[UIImage imageNamed:@"コミュ力の窓-タイムテーブル.png"] forState:UIControlStateNormal];
    [buttonTwo5 addTarget:self
                   action:@selector(buttonTwo5Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo5];

    buttonTwo6= [[UIButton alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 5, self.view.bounds.size.width, self.view.bounds.size.width * 19 / 32)];
    [buttonTwo6 setImage:[UIImage imageNamed:@"○○男子No.1決定戦-タイムテーブル.png"] forState:UIControlStateNormal];
    [buttonTwo6 addTarget:self
                   action:@selector(buttonTwo6Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo6];

    buttonTwo7= [[UIButton alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 6, self.view.bounds.size.width, self.view.bounds.size.width * 19 / 32)];
    [buttonTwo7 setImage:[UIImage imageNamed:@"のど自慢-タイムテーブル.png"] forState:UIControlStateNormal];
    [buttonTwo7 addTarget:self
                   action:@selector(buttonTwo7Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo7];

    buttonTwo8= [[UIButton alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 7, self.view.bounds.size.width, self.view.bounds.size.width * 19 / 32)];
    [buttonTwo8 setImage:[UIImage imageNamed:@"Mr.聖光-タイムテーブル.png"] forState:UIControlStateNormal];
    [buttonTwo8 addTarget:self
                   action:@selector(buttonTwo8Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo8];

    buttonTwo9= [[UIButton alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 8, self.view.bounds.size.width, self.view.bounds.size.width * 18 / 32)];
    [buttonTwo9 setImage:[UIImage imageNamed:@"春夜祭-タイムテーブル.png"] forState:UIControlStateNormal];
    [buttonTwo9 addTarget:self
                   action:@selector(buttonTwo9Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo9];
    
    
    //ライブハウス1
    buttonThree1= [[UIButton alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 0, self.view.bounds.size.width, self.view.bounds.size.width * 19 / 32)];
    [buttonThree1 setImage:[UIImage imageNamed:@"Flat-Flight-タイムテーブル.png"] forState:UIControlStateNormal];
    [buttonThree1 addTarget:self
                   action:@selector(buttonThree1Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView3 addSubview:buttonThree1];
    
    buttonThree2= [[UIButton alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 1, self.view.bounds.size.width, self.view.bounds.size.width * 19 / 32)];
    [buttonThree2 setImage:[UIImage imageNamed:@"M&A-タイムテーブル.png"] forState:UIControlStateNormal];
    [buttonThree2 addTarget:self
                   action:@selector(buttonThree2Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView3 addSubview:buttonThree2];
    
    buttonThree3= [[UIButton alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 2, self.view.bounds.size.width, self.view.bounds.size.width * 19 / 32)];
    [buttonThree3 setImage:[UIImage imageNamed:@"蜃気楼-タイムテーブル.png"] forState:UIControlStateNormal];
    [buttonThree3 addTarget:self
                   action:@selector(buttonThree3Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView3 addSubview:buttonThree3];
    
    buttonThree4= [[UIButton alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 3, self.view.bounds.size.width, self.view.bounds.size.width * 18 / 32)];
    [buttonThree4 setImage:[UIImage imageNamed:@"ぽんでっくす-タイムテーブル.png"] forState:UIControlStateNormal];
    [buttonThree4 addTarget:self
                   action:@selector(buttonThree4Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView3 addSubview:buttonThree4];
    
    
    //ライブハウス2
    buttonFour1= [[UIButton alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 0, self.view.bounds.size.width, self.view.bounds.size.width * 19 / 32)];
    [buttonFour1 setImage:[UIImage imageNamed:@"Chaos-Illusion-タイムテーブル.png"] forState:UIControlStateNormal];
    [buttonFour1 addTarget:self
                     action:@selector(buttonFour1Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView4 addSubview:buttonFour1];
    
    buttonFour2= [[UIButton alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 1, self.view.bounds.size.width, self.view.bounds.size.width * 19 / 32)];
    [buttonFour2 setImage:[UIImage imageNamed:@"WEAK-END-タイムテーブル.png"] forState:UIControlStateNormal];
    [buttonFour2 addTarget:self
                     action:@selector(buttonFour2Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView4 addSubview:buttonFour2];
    
    buttonFour3= [[UIButton alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 2, self.view.bounds.size.width, self.view.bounds.size.width * 19 / 32)];
    [buttonFour3 setImage:[UIImage imageNamed:@"Яooz-Leef-タイムテーブル.png"] forState:UIControlStateNormal];
    [buttonFour3 addTarget:self
                     action:@selector(buttonFour3Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView4 addSubview:buttonFour3];
    
    buttonFour4= [[UIButton alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 3, self.view.bounds.size.width, self.view.bounds.size.width * 19 / 32)];
    [buttonFour4 setImage:[UIImage imageNamed:@"エストレーラ-タイムテーブル.png"] forState:UIControlStateNormal];
    [buttonFour4 addTarget:self
                     action:@selector(buttonFour4Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView4 addSubview:buttonFour4];
    
    buttonFour5= [[UIButton alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 4, self.view.bounds.size.width, self.view.bounds.size.width * 18 / 32)];
    [buttonFour5 setImage:[UIImage imageNamed:@"奴等-タイムテーブル.png"] forState:UIControlStateNormal];
    [buttonFour5 addTarget:self
                    action:@selector(buttonFour5Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView4 addSubview:buttonFour5];
    
    
    //小講堂
    buttonFive1= [[UIButton alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 0, self.view.bounds.size.width, self.view.bounds.size.width * 19 / 32)];
    [buttonFive1 setImage:[UIImage imageNamed:@"恋愛偏差値-タイムテーブル.png"] forState:UIControlStateNormal];
    [buttonFive1 addTarget:self
                    action:@selector(buttonFive1Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView5 addSubview:buttonFive1];
    
    buttonFive2= [[UIButton alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 1, self.view.bounds.size.width, self.view.bounds.size.width * 19 / 32)];
    [buttonFive2 setImage:[UIImage imageNamed:@"校長対談-タイムテーブル.png"] forState:UIControlStateNormal];
    [buttonFive2 addTarget:self
                    action:@selector(buttonFive2Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView5 addSubview:buttonFive2];
    
    buttonFive3= [[UIButton alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 2, self.view.bounds.size.width, self.view.bounds.size.width * 19 / 32)];
    [buttonFive3 setImage:[UIImage imageNamed:@"数学研究会模擬講義-タイムテーブル.png"] forState:UIControlStateNormal];
    [buttonFive3 addTarget:self
                    action:@selector(buttonFive3Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView5 addSubview:buttonFive3];
    
    buttonFive4= [[UIButton alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 3, self.view.bounds.size.width, self.view.bounds.size.width * 18 / 32)];
    [buttonFive4 setImage:[UIImage imageNamed:@"ミュージックサロン-タイムテーブル小講堂.png"] forState:UIControlStateNormal];
    [buttonFive4 addTarget:self
                    action:@selector(buttonFive4Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView5 addSubview:buttonFive4];
    
    
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:140.0/255.0 green:23.0/255.0 blue:26.0/255.0 alpha:1.0];
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    self.tabBarController.tabBar.barTintColor = [UIColor whiteColor];
    self.tabBarController.tabBar.tintColor = [UIColor colorWithRed:167.0/255.0 green:17.0/255.0 blue:23.0/255.0 alpha:1.0];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc]init];
    backButtonItem.title = @"";
    self.navigationItem.backBarButtonItem = backButtonItem;
    
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    NSString *dateString = [formatter stringFromDate:date];
    month=[[dateString substringWithRange:NSMakeRange(5, 2)]intValue];
    day=[[dateString substringWithRange:NSMakeRange(8, 2)]intValue];
    hour=[[dateString substringWithRange:NSMakeRange(11, 2)]intValue];
    minute=[[dateString substringWithRange:NSMakeRange(14, 2)]intValue];
    
    if ((month == 4 && day < 30) || (month == 4 && day == 30 && hour < 17)) {
        
        _segmentedControl.selectedSegmentIndex = 0;
        
    }else {
        
        _segmentedControl.selectedSegmentIndex = 1;
        
        //メモリ解放
        @autoreleasepool {
            
            //ボタンに設定したActionを削除
            [buttonOne1 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonOne2 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonOne3 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonOne4 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo1 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo2 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo3 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo4 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo5 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo6 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo7 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo8 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo9 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonThree1 removeTarget:nil
                                action:NULL
                      forControlEvents:UIControlEventTouchUpInside];
            [buttonThree2 removeTarget:nil
                                action:NULL
                      forControlEvents:UIControlEventTouchUpInside];
            [buttonThree3 removeTarget:nil
                                action:NULL
                      forControlEvents:UIControlEventTouchUpInside];
            [buttonThree4 removeTarget:nil
                                action:NULL
                      forControlEvents:UIControlEventTouchUpInside];
            [buttonFour1 removeTarget:nil
                               action:NULL
                     forControlEvents:UIControlEventTouchUpInside];
            [buttonFour2 removeTarget:nil
                               action:NULL
                     forControlEvents:UIControlEventTouchUpInside];
            [buttonFour3 removeTarget:nil
                               action:NULL
                     forControlEvents:UIControlEventTouchUpInside];
            [buttonFour4 removeTarget:nil
                               action:NULL
                     forControlEvents:UIControlEventTouchUpInside];
            [buttonFour5 removeTarget:nil
                               action:NULL
                     forControlEvents:UIControlEventTouchUpInside];
            [buttonFive1 removeTarget:nil
                               action:NULL
                     forControlEvents:UIControlEventTouchUpInside];
            [buttonFive2 removeTarget:nil
                               action:NULL
                     forControlEvents:UIControlEventTouchUpInside];
            [buttonFive3 removeTarget:nil
                               action:NULL
                     forControlEvents:UIControlEventTouchUpInside];
            [buttonFive4 removeTarget:nil
                               action:NULL
                     forControlEvents:UIControlEventTouchUpInside];
            
            
            [mainScrollView setContentSize:CGSizeMake(7*(self.view.bounds.size.width), self.view.bounds.size.height-113)];
            pageControl.numberOfPages = 7;
            
            //講堂
            [buttonOne1 setImage:[UIImage imageNamed:@"天使の歌声-タイムテーブル2.png"] forState:UIControlStateNormal];
            [buttonOne2 setImage:[UIImage imageNamed:@"弦楽オーケストラ部-タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonOne3 setImage:[UIImage imageNamed:@"グリークラブ-タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonOne4 setImage:[UIImage imageNamed:@"英語劇-タイムテーブル2.png"] forState:UIControlStateNormal];
            buttonOne4.frame = CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 3, self.view.bounds.size.width, self.view.bounds.size.width * 19 / 32);
            
            buttonOne5= [[UIButton alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 4, self.view.bounds.size.width, self.view.bounds.size.width * 19 / 32)];
            [buttonOne5 setImage:[UIImage imageNamed:@"吹奏楽部-タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonOne5 addTarget:self
                           action:@selector(buttonOne5Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [scrollView1 addSubview:buttonOne5];
            
            buttonOne6= [[UIButton alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 5, self.view.bounds.size.width, self.view.bounds.size.width * 18 / 32)];
            [buttonOne6 setImage:[UIImage imageNamed:@"Grand-Finale-タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonOne6 addTarget:self
                           action:@selector(buttonOne6Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [scrollView1 addSubview:buttonOne6];
            
            [scrollView1 setContentSize:CGSizeMake(self.view.bounds.size.width, (self.view.bounds.size.width * 19 / 32) * 5 + (self.view.bounds.size.width * 18 / 32))];
            
            
            //外ステージ
            [buttonTwo1 setImage:[UIImage imageNamed:@"替え劇〜赤ずきん〜-タイムテーブル2.png"] forState:    UIControlStateNormal];
            [buttonTwo2 setImage:[UIImage imageNamed:@"○○男子No.1決定戦-タイムテーブル2.png"] forState:UIControlStateNormal];
            [buttonTwo3 setImage:[UIImage imageNamed:@"コミュ力の窓-タイムテーブル2.png"] forState:UIControlStateNormal];
            [buttonTwo4 setImage:[UIImage imageNamed:@"S-O-S-タイムテーブル2.png"] forState:UIControlStateNormal];
            [buttonTwo5 setImage:[UIImage imageNamed:@"Seiko-Dance-Performance タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonTwo6 setImage:[UIImage imageNamed:@"ギネスに挑戦！！-タイムテーブル2.png"] forState:UIControlStateNormal];
            [buttonTwo7 setImage:[UIImage imageNamed:@"The-笑-1-GP-タイムテーブル2.png"] forState:UIControlStateNormal];
            [buttonTwo8 setImage:[UIImage imageNamed:@"のど自慢-タイムテーブル2.png"] forState:UIControlStateNormal];
            [buttonTwo9 setImage:[UIImage imageNamed:@"Mr.聖光-タイムテーブル2.png"] forState:UIControlStateNormal];
            buttonTwo9.frame = CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 8, self.view.bounds.size.width, self.view.bounds.size.width * 19 / 32);
            buttonTwo10= [[UIButton alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 9, self.view.bounds.size.width, self.view.bounds.size.width * 18 / 32)];
            [buttonTwo10 setImage:[UIImage imageNamed:@"フォークダンス-タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonTwo10 addTarget:self
                           action:@selector(buttonTwo10Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [scrollView2 addSubview:buttonTwo10];
            
            [scrollView2 setContentSize:CGSizeMake(self.view.bounds.size.width, (self.view.bounds.size.width * 19 / 32) * 9 + (self.view.bounds.size.width * 18 / 32))];
            
            //ライブハウス1
            [buttonThree1 setImage:[UIImage imageNamed:@"ぽんでっくす-タイムテーブル2.png"] forState:UIControlStateNormal];
            [buttonThree2 setImage:[UIImage imageNamed:@"M&A-タイムテーブル2.png"] forState:UIControlStateNormal];
            [buttonThree3 setImage:[UIImage imageNamed:@"Flat-Flight-タイムテーブル2.png"] forState:UIControlStateNormal];
            [buttonThree4 setImage:[UIImage imageNamed:@"蜃気楼-タイムテーブル2.png"] forState:UIControlStateNormal];
            
            
            //ライブハウス2
            [buttonFour1 setImage:[UIImage imageNamed:@"Million-Dollars-タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonFour2 setImage:[UIImage imageNamed:@"せいとんがかり タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonFour3 setImage:[UIImage imageNamed:@"WEAK-END-タイムテーブル2.png"] forState:UIControlStateNormal];
            [buttonFour4 setImage:[UIImage imageNamed:@"Яooz-Leef-タイムテーブル2.png"] forState:UIControlStateNormal];
            [buttonFour5 setImage:[UIImage imageNamed:@"Addiction?-タイムテーブル.png"] forState:UIControlStateNormal];
            
            
            //小講堂
            [buttonFive1 setImage:[UIImage imageNamed:@"恋愛偏差値-タイムテーブル2.png"] forState:UIControlStateNormal];
            [buttonFive2 setImage:[UIImage imageNamed:@"ミュージックサロン-タイムテーブル小講堂2.png"] forState:UIControlStateNormal];
            [buttonFive3 setImage:[UIImage imageNamed:@"数学研究会模擬講義-タイムテーブル2.png"] forState:UIControlStateNormal];
            
            [buttonFive4 setImage:[UIImage imageNamed:@"ミュージックサロン-タイムテーブル小講堂3.png"] forState:UIControlStateNormal];
            
            //体育館
            buttonSix1= [[UIButton alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 0, self.view.bounds.size.width, self.view.bounds.size.width * 19 / 32)];
            [buttonSix1 setImage:[UIImage imageNamed:@"少林寺拳法部演武会-タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonSix1 addTarget:self
                           action:@selector(buttonSix1Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [scrollView6 addSubview:buttonSix1];
            
            //武道場
            buttonSeven1= [[UIButton alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 0, self.view.bounds.size.width, self.view.bounds.size.width * 19 / 32)];
            [buttonSeven1 setImage:[UIImage imageNamed:@"剣道部-タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonSeven1 addTarget:self
                             action:@selector(buttonSeven1Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [scrollView7 addSubview:buttonSeven1];
            
            //講堂
            [buttonOne1 addTarget:self
                           action:@selector(buttonOne1Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonOne2 addTarget:self
                           action:@selector(buttonOne2Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonOne3 addTarget:self
                           action:@selector(buttonOne3Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonOne4 addTarget:self
                           action:@selector(buttonOne4Detail2:) forControlEvents:UIControlEventTouchUpInside];
            
            
            //外ステージ
            [buttonTwo1 addTarget:self
                           action:@selector(buttonTwo1Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo2 addTarget:self
                           action:@selector(buttonTwo2Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo3 addTarget:self
                           action:@selector(buttonTwo3Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo4 addTarget:self
                           action:@selector(buttonTwo4Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo5 addTarget:self
                           action:@selector(buttonTwo5Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo6 addTarget:self
                           action:@selector(buttonTwo6Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo7 addTarget:self
                           action:@selector(buttonTwo7Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo8 addTarget:self
                           action:@selector(buttonTwo8Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo9 addTarget:self
                           action:@selector(buttonTwo9Detail2:) forControlEvents:UIControlEventTouchUpInside];
            
            
            //ライブハウス1
            [buttonThree1 addTarget:self
                             action:@selector(buttonThree1Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonThree2 addTarget:self
                             action:@selector(buttonThree2Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonThree3 addTarget:self
                             action:@selector(buttonThree3Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonThree4 addTarget:self
                             action:@selector(buttonThree4Detail2:) forControlEvents:UIControlEventTouchUpInside];
            
            
            //ライブハウス2
            [buttonFour1 addTarget:self
                            action:@selector(buttonFour1Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonFour2 addTarget:self
                            action:@selector(buttonFour2Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonFour3 addTarget:self
                            action:@selector(buttonFour3Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonFour4 addTarget:self
                            action:@selector(buttonFour4Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonFour5 addTarget:self
                            action:@selector(buttonFour5Detail2:) forControlEvents:UIControlEventTouchUpInside];
            
            
            //小講堂
            [buttonFive1 addTarget:self
                            action:@selector(buttonFive1Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonFive2 addTarget:self
                            action:@selector(buttonFive2Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonFive3 addTarget:self
                            action:@selector(buttonFive3Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonFive4 addTarget:self
                            action:@selector(buttonFive4Detail2:) forControlEvents:UIControlEventTouchUpInside];
            
        }
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


//スクロールされたとき
- (void)scrollViewDidScroll:(UIScrollView *)_scrollView
{
    if ((NSInteger)fmod(mainScrollView.contentOffset.x , mainScrollView.frame.size.width) == 0) {
        
        //ページコントロールに現在のページを設定
        pageControl.currentPage = mainScrollView.contentOffset.x / mainScrollView.frame.size.width;
        
    }
    
    if (pageControl.currentPage==0) {
        nav_title.text = @"講堂";
    }else if (pageControl.currentPage==1) {
        nav_title.text = @"外ステージ";
    }else if (pageControl.currentPage==2) {
        nav_title.text = @"ライブハウス1";
    }else if (pageControl.currentPage==3) {
        nav_title.text = @"ライブハウス2";
    }else if (pageControl.currentPage==4) {
        nav_title.text = @"小講堂";
    }else if (pageControl.currentPage==5) {
        nav_title.text = @"体育館";
    }else if (pageControl.currentPage==6) {
        nav_title.text = @"武道場";
    }
    
}

//ページコントロールがタップされたとき
- (void)pageControl_Tapped:(id)sender
{
    CGRect frame = mainScrollView.frame;
    frame.origin.x = mainScrollView.frame.size.width * pageControl.currentPage;
    [mainScrollView scrollRectToVisible:frame animated:YES];
    
}

-(void)buttonOne1Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 10;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonOne2Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 9;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonOne3Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 3;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonOne4Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 2;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonTwo1Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 11;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonTwo2Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 6;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonTwo3Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 9;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonTwo4Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 8;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonTwo5Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 7;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonTwo6Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 10;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonTwo7Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 5;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonTwo8Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 3;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonTwo9Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 2;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonThree1Detail:(UIButton *)button{
    whichList = @"band";
    flag = 2;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
    
}

-(void)buttonThree2Detail:(UIButton *)button{
    whichList = @"band";
    flag = 1;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonThree3Detail:(UIButton *)button{
    whichList = @"band";
    flag = 3;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonThree4Detail:(UIButton *)button{
    whichList = @"band";
    flag = 4;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonFour1Detail:(UIButton *)button{
    whichList = @"band";
    flag = 10;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonFour2Detail:(UIButton *)button{
    whichList = @"band";
    flag = 7;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonFour3Detail:(UIButton *)button{
    whichList = @"band";
    flag = 6;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonFour4Detail:(UIButton *)button{
    whichList = @"band";
    flag = 5;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonFour5Detail:(UIButton *)button{
    whichList = @"band";
    flag = 12;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonFive1Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 6;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonFive2Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 7;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonFive3Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 11;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonFive4Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 9;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}


-(void)buttonOne1Detail2:(UIButton *)button{
    whichList = @"performance";
    flag = 10;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonOne2Detail2:(UIButton *)button{
    whichList = @"performance";
    flag = 5;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonOne3Detail2:(UIButton *)button{
    whichList = @"performance";
    flag = 4;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonOne4Detail2:(UIButton *)button{
    whichList = @"performance";
    flag = 2;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonOne5Detail2:(UIButton *)button{
    whichList = @"performance";
    flag = 8;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonOne6Detail2:(UIButton *)button{
    whichList = @"performance";
    flag = 1;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonTwo1Detail2:(UIButton *)button{
    whichList = @"stage";
    flag = 9;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonTwo2Detail2:(UIButton *)button{
    whichList = @"stage";
    flag = 10;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonTwo3Detail2:(UIButton *)button{
    whichList = @"stage";
    flag = 7;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonTwo4Detail2:(UIButton *)button{
    whichList = @"stage";
    flag = 11;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonTwo5Detail2:(UIButton *)button{
    whichList = @"stage";
    flag = 4;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonTwo6Detail2:(UIButton *)button{
    whichList = @"stage";
    flag = 6;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonTwo7Detail2:(UIButton *)button{
    whichList = @"stage";
    flag = 8;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonTwo8Detail2:(UIButton *)button{
    whichList = @"stage";
    flag = 5;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonTwo9Detail2:(UIButton *)button{
    whichList = @"stage";
    flag = 3;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonTwo10Detail2:(UIButton *)button{
    whichList = @"stage";
    flag = 1;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonThree1Detail2:(UIButton *)button{
    whichList = @"band";
    flag = 4;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
    
}

-(void)buttonThree2Detail2:(UIButton *)button{
    whichList = @"band";
    flag = 1;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonThree3Detail2:(UIButton *)button{
    whichList = @"band";
    flag = 2;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonThree4Detail2:(UIButton *)button{
    whichList = @"band";
    flag = 3;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonFour1Detail2:(UIButton *)button{
    whichList = @"band";
    flag = 8;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonFour2Detail2:(UIButton *)button{
    whichList = @"band";
    flag = 9;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonFour3Detail2:(UIButton *)button{
    whichList = @"band";
    flag = 7;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonFour4Detail2:(UIButton *)button{
    whichList = @"band";
    flag = 6;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonFour5Detail2:(UIButton *)button{
    whichList = @"band";
    flag = 11;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonFive1Detail2:(UIButton *)button{
    whichList = @"performance";
    flag = 6;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonFive2Detail2:(UIButton *)button{
    whichList = @"performance";
    flag = 9;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonFive3Detail2:(UIButton *)button{
    whichList = @"performance";
    flag = 11;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonFive4Detail2:(UIButton *)button{
    whichList = @"performance";
    flag = 9;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonSix1Detail2:(UIButton *)button{
    whichList = @"performance";
    flag = 12;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)buttonSeven1Detail2:(UIButton *)button{
    whichList = @"performance";
    flag = 13;
    [self performSegueWithIdentifier:@"fromTimeTable" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailView *detailView = segue.destinationViewController;
    detailView.flag = flag;
    detailView.whatList = whichList;
    
}

- (IBAction)changeDate:(id)sender {
    
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        
        @autoreleasepool {
        
            [mainScrollView setContentSize:CGSizeMake(5*(self.view.bounds.size.width), self.view.bounds.size.height-113)];
            pageControl.numberOfPages = 5;
        
            //講堂
            [buttonOne1 setImage:[UIImage imageNamed:@"天使の歌声-タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonOne2 setImage:[UIImage imageNamed:@"ミュージックサロン-タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonOne3 setImage:[UIImage imageNamed:@"ボールぽこぽこ-タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonOne4 setImage:[UIImage imageNamed:@"英語劇-タイムテーブル.png"] forState:UIControlStateNormal];
        
            buttonOne4.frame = CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 3, self.view.bounds.size.width, self.view.bounds.size.width * 18 / 32);
        
            [buttonOne5 removeFromSuperview];
            [buttonOne6 removeFromSuperview];
        
            [scrollView1 setContentSize:CGSizeMake(self.view.bounds.size.width, (self.view.bounds.size.width * 19 / 32) * 3 + (self.view.bounds.size.width * 18 / 32))];
        
        
            //外ステージ
            [buttonTwo1 setImage:[UIImage imageNamed:@"S-O-S-タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonTwo2 setImage:[UIImage imageNamed:@"ギネスに挑戦！！-タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonTwo3 setImage:[UIImage imageNamed:@"替え劇〜赤ずきん〜-タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonTwo4 setImage:[UIImage imageNamed:@"The-笑-1-GP-タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonTwo5 setImage:[UIImage imageNamed:@"コミュ力の窓-タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonTwo6 setImage:[UIImage imageNamed:@"○○男子No.1決定戦-タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonTwo7 setImage:[UIImage imageNamed:@"のど自慢-タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonTwo8 setImage:[UIImage imageNamed:@"Mr.聖光-タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonTwo9 setImage:[UIImage imageNamed:@"春夜祭-タイムテーブル.png"] forState:UIControlStateNormal];
            
            buttonTwo9.frame = CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 8, self.view.bounds.size.width, self.view.bounds.size.width * 18 / 32);
            
            [buttonTwo10 removeFromSuperview];
            
            [scrollView2 setContentSize:CGSizeMake(self.view.bounds.size.width, (self.view.bounds.size.width * 19 / 32) * 8 + (self.view.bounds.size.width * 18 / 32))];
        
        
            //ライブハウス1
            [buttonThree1 setImage:[UIImage imageNamed:@"Flat-Flight-タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonThree2 setImage:[UIImage imageNamed:@"M&A-タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonThree3 setImage:[UIImage imageNamed:@"蜃気楼-タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonThree4 setImage:[UIImage imageNamed:@"ぽんでっくす-タイムテーブル.png"] forState:UIControlStateNormal];
        
        
            //ライブハウス2
            [buttonFour1 setImage:[UIImage imageNamed:@"Chaos-Illusion-タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonFour2 setImage:[UIImage imageNamed:@"WEAK-END-タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonFour3 setImage:[UIImage imageNamed:@"Яooz-Leef-タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonFour4 setImage:[UIImage imageNamed:@"エストレーラ-タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonFour5 setImage:[UIImage imageNamed:@"奴等-タイムテーブル.png"] forState:UIControlStateNormal];
        
        
            //小講堂
            [buttonFive1 setImage:[UIImage imageNamed:@"恋愛偏差値-タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonFive2 setImage:[UIImage imageNamed:@"校長対談-タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonFive3 setImage:[UIImage imageNamed:@"数学研究会模擬講義-タイムテーブル.png"] forState:UIControlStateNormal];

            [buttonFive4 setImage:[UIImage imageNamed:@"ミュージックサロン-タイムテーブル小講堂.png"] forState:UIControlStateNormal];
            
            [buttonSix1 removeFromSuperview];
            [buttonSeven1 removeFromSuperview];
            
            //ボタンに設定したActionを削除
            [buttonOne1 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonOne2 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonOne3 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonOne4 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo1 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo2 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo3 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo4 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo5 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo6 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo7 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo8 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo9 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonThree1 removeTarget:nil
                                action:NULL
                      forControlEvents:UIControlEventTouchUpInside];
            [buttonThree2 removeTarget:nil
                                action:NULL
                      forControlEvents:UIControlEventTouchUpInside];
            [buttonThree3 removeTarget:nil
                                action:NULL
                      forControlEvents:UIControlEventTouchUpInside];
            [buttonThree4 removeTarget:nil
                                action:NULL
                      forControlEvents:UIControlEventTouchUpInside];
            [buttonFour1 removeTarget:nil
                               action:NULL
                     forControlEvents:UIControlEventTouchUpInside];
            [buttonFour2 removeTarget:nil
                               action:NULL
                     forControlEvents:UIControlEventTouchUpInside];
            [buttonFour3 removeTarget:nil
                               action:NULL
                     forControlEvents:UIControlEventTouchUpInside];
            [buttonFour4 removeTarget:nil
                               action:NULL
                     forControlEvents:UIControlEventTouchUpInside];
            [buttonFour5 removeTarget:nil
                               action:NULL
                     forControlEvents:UIControlEventTouchUpInside];
            [buttonFive1 removeTarget:nil
                               action:NULL
                     forControlEvents:UIControlEventTouchUpInside];
            [buttonFive2 removeTarget:nil
                               action:NULL
                     forControlEvents:UIControlEventTouchUpInside];
            [buttonFive3 removeTarget:nil
                               action:NULL
                     forControlEvents:UIControlEventTouchUpInside];
            [buttonFive4 removeTarget:nil
                               action:NULL
                     forControlEvents:UIControlEventTouchUpInside];
            
            //講堂
            [buttonOne1 addTarget:self
                           action:@selector(buttonOne1Detail:) forControlEvents:UIControlEventTouchUpInside];
            [buttonOne2 addTarget:self
                           action:@selector(buttonOne2Detail:) forControlEvents:UIControlEventTouchUpInside];
            [buttonOne3 addTarget:self
                           action:@selector(buttonOne3Detail:) forControlEvents:UIControlEventTouchUpInside];
            [buttonOne4 addTarget:self
                           action:@selector(buttonOne4Detail:) forControlEvents:UIControlEventTouchUpInside];
            
            
            //外ステージ
            [buttonTwo1 addTarget:self
                           action:@selector(buttonTwo1Detail:) forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo2 addTarget:self
                           action:@selector(buttonTwo2Detail:) forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo3 addTarget:self
                           action:@selector(buttonTwo3Detail:) forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo4 addTarget:self
                           action:@selector(buttonTwo4Detail:) forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo5 addTarget:self
                           action:@selector(buttonTwo5Detail:) forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo6 addTarget:self
                           action:@selector(buttonTwo6Detail:) forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo7 addTarget:self
                           action:@selector(buttonTwo7Detail:) forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo8 addTarget:self
                           action:@selector(buttonTwo8Detail:) forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo9 addTarget:self
                           action:@selector(buttonTwo9Detail:) forControlEvents:UIControlEventTouchUpInside];
            
            
            //ライブハウス1
            [buttonThree1 addTarget:self
                             action:@selector(buttonThree1Detail:) forControlEvents:UIControlEventTouchUpInside];
            [buttonThree2 addTarget:self
                             action:@selector(buttonThree2Detail:) forControlEvents:UIControlEventTouchUpInside];
            [buttonThree3 addTarget:self
                             action:@selector(buttonThree3Detail:) forControlEvents:UIControlEventTouchUpInside];
            [buttonThree4 addTarget:self
                             action:@selector(buttonThree4Detail:) forControlEvents:UIControlEventTouchUpInside];
            
            
            //ライブハウス2
            [buttonFour1 addTarget:self
                            action:@selector(buttonFour1Detail:) forControlEvents:UIControlEventTouchUpInside];
            [buttonFour2 addTarget:self
                            action:@selector(buttonFour2Detail:) forControlEvents:UIControlEventTouchUpInside];
            [buttonFour3 addTarget:self
                            action:@selector(buttonFour3Detail:) forControlEvents:UIControlEventTouchUpInside];
            [buttonFour4 addTarget:self
                            action:@selector(buttonFour4Detail:) forControlEvents:UIControlEventTouchUpInside];
            [buttonFour5 addTarget:self
                            action:@selector(buttonFour5Detail:) forControlEvents:UIControlEventTouchUpInside];
            
            
            //小講堂
            [buttonFive1 addTarget:self
                            action:@selector(buttonFive1Detail:) forControlEvents:UIControlEventTouchUpInside];
            [buttonFive2 addTarget:self
                            action:@selector(buttonFive2Detail:) forControlEvents:UIControlEventTouchUpInside];
            [buttonFive3 addTarget:self
                            action:@selector(buttonFive3Detail:) forControlEvents:UIControlEventTouchUpInside];
            [buttonFive4 addTarget:self
                            action:@selector(buttonFive4Detail:) forControlEvents:UIControlEventTouchUpInside];
            
        }

    }else if (self.segmentedControl.selectedSegmentIndex == 1){
        
        @autoreleasepool {
            
            [mainScrollView setContentSize:CGSizeMake(7*(self.view.bounds.size.width), self.view.bounds.size.height-113)];
            pageControl.numberOfPages = 7;
            
            //講堂
            [buttonOne1 setImage:[UIImage imageNamed:@"天使の歌声-タイムテーブル2.png"] forState:UIControlStateNormal];
            [buttonOne2 setImage:[UIImage imageNamed:@"弦楽オーケストラ部-タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonOne3 setImage:[UIImage imageNamed:@"グリークラブ-タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonOne4 setImage:[UIImage imageNamed:@"英語劇-タイムテーブル2.png"] forState:UIControlStateNormal];
            buttonOne4.frame = CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 3, self.view.bounds.size.width, self.view.bounds.size.width * 19 / 32);
        
            buttonOne5= [[UIButton alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 4, self.view.bounds.size.width, self.view.bounds.size.width * 19 / 32)];
            [buttonOne5 setImage:[UIImage imageNamed:@"吹奏楽部-タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonOne5 addTarget:self
                       action:@selector(buttonOne5Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [scrollView1 addSubview:buttonOne5];
        
            buttonOne6= [[UIButton alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 5, self.view.bounds.size.width, self.view.bounds.size.width * 18 / 32)];
            [buttonOne6 setImage:[UIImage imageNamed:@"Grand-Finale-タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonOne6 addTarget:self
                       action:@selector(buttonOne6Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [scrollView1 addSubview:buttonOne6];
        
            [scrollView1 setContentSize:CGSizeMake(self.view.bounds.size.width, (self.view.bounds.size.width * 19 / 32) * 5 + (self.view.bounds.size.width * 18 / 32))];
        
        
            //外ステージ
            [buttonTwo1 setImage:[UIImage imageNamed:@"替え劇〜赤ずきん〜-タイムテーブル2.png"] forState:    UIControlStateNormal];
            [buttonTwo2 setImage:[UIImage imageNamed:@"○○男子No.1決定戦-タイムテーブル2.png"] forState:UIControlStateNormal];
            [buttonTwo3 setImage:[UIImage imageNamed:@"コミュ力の窓-タイムテーブル2.png"] forState:UIControlStateNormal];
            [buttonTwo4 setImage:[UIImage imageNamed:@"S-O-S-タイムテーブル2.png"] forState:UIControlStateNormal];
            [buttonTwo5 setImage:[UIImage imageNamed:@"Seiko-Dance-Performance タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonTwo6 setImage:[UIImage imageNamed:@"ギネスに挑戦！！-タイムテーブル2.png"] forState:UIControlStateNormal];
            [buttonTwo7 setImage:[UIImage imageNamed:@"The-笑-1-GP-タイムテーブル2.png"] forState:UIControlStateNormal];
            [buttonTwo8 setImage:[UIImage imageNamed:@"のど自慢-タイムテーブル2.png"] forState:UIControlStateNormal];
            [buttonTwo9 setImage:[UIImage imageNamed:@"Mr.聖光-タイムテーブル2.png"] forState:UIControlStateNormal];
            buttonTwo9.frame = CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 8, self.view.bounds.size.width, self.view.bounds.size.width * 19 / 32);
            buttonTwo10= [[UIButton alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 9, self.view.bounds.size.width, self.view.bounds.size.width * 18 / 32)];
            [buttonTwo10 setImage:[UIImage imageNamed:@"フォークダンス-タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonTwo10 addTarget:self
                            action:@selector(buttonTwo10Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [scrollView2 addSubview:buttonTwo10];
            
            [scrollView2 setContentSize:CGSizeMake(self.view.bounds.size.width, (self.view.bounds.size.width * 19 / 32) * 9 + (self.view.bounds.size.width * 18 / 32))];
        
        
            //ライブハウス1
            [buttonThree1 setImage:[UIImage imageNamed:@"ぽんでっくす-タイムテーブル2.png"] forState:UIControlStateNormal];
            [buttonThree2 setImage:[UIImage imageNamed:@"M&A-タイムテーブル2.png"] forState:UIControlStateNormal];
            [buttonThree3 setImage:[UIImage imageNamed:@"Flat-Flight-タイムテーブル2.png"] forState:UIControlStateNormal];
            [buttonThree4 setImage:[UIImage imageNamed:@"蜃気楼-タイムテーブル2.png"] forState:UIControlStateNormal];
        
        
            //ライブハウス2
            [buttonFour1 setImage:[UIImage imageNamed:@"Million-Dollars-タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonFour2 setImage:[UIImage imageNamed:@"せいとんがかり タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonFour3 setImage:[UIImage imageNamed:@"WEAK-END-タイムテーブル2.png"] forState:UIControlStateNormal];
            [buttonFour4 setImage:[UIImage imageNamed:@"Яooz-Leef-タイムテーブル2.png"] forState:UIControlStateNormal];
            [buttonFour5 setImage:[UIImage imageNamed:@"Addiction?-タイムテーブル.png"] forState:UIControlStateNormal];
        
        
            //小講堂
            [buttonFive1 setImage:[UIImage imageNamed:@"恋愛偏差値-タイムテーブル2.png"] forState:UIControlStateNormal];
            [buttonFive2 setImage:[UIImage imageNamed:@"ミュージックサロン-タイムテーブル小講堂2.png"] forState:UIControlStateNormal];
            [buttonFive3 setImage:[UIImage imageNamed:@"数学研究会模擬講義-タイムテーブル2.png"] forState:UIControlStateNormal];
        
            [buttonFive4 setImage:[UIImage imageNamed:@"ミュージックサロン-タイムテーブル小講堂3.png"] forState:UIControlStateNormal];
            
            //体育館
            buttonSix1= [[UIButton alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 0, self.view.bounds.size.width, self.view.bounds.size.width * 19 / 32)];
            [buttonSix1 setImage:[UIImage imageNamed:@"少林寺拳法部演武会-タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonSix1 addTarget:self
                           action:@selector(buttonSix1Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [scrollView6 addSubview:buttonSix1];
            
            //武道場
            buttonSeven1= [[UIButton alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.width * 19 / 32) * 0, self.view.bounds.size.width, self.view.bounds.size.width * 19 / 32)];
            [buttonSeven1 setImage:[UIImage imageNamed:@"剣道部-タイムテーブル.png"] forState:UIControlStateNormal];
            [buttonSeven1 addTarget:self
                           action:@selector(buttonSeven1Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [scrollView7 addSubview:buttonSeven1];
            
            
            //ボタンに設定したActionを削除
            [buttonOne1 removeTarget:nil
                               action:NULL
                     forControlEvents:UIControlEventTouchUpInside];
            [buttonOne2 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonOne3 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonOne4 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo1 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo2 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo3 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo4 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo5 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo6 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo7 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo8 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo9 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonThree1 removeTarget:nil
                              action:NULL
                    forControlEvents:UIControlEventTouchUpInside];
            [buttonThree2 removeTarget:nil
                                action:NULL
                      forControlEvents:UIControlEventTouchUpInside];
            [buttonThree3 removeTarget:nil
                                action:NULL
                      forControlEvents:UIControlEventTouchUpInside];
            [buttonThree4 removeTarget:nil
                                action:NULL
                      forControlEvents:UIControlEventTouchUpInside];
            [buttonFour1 removeTarget:nil
                                action:NULL
                      forControlEvents:UIControlEventTouchUpInside];
            [buttonFour2 removeTarget:nil
                               action:NULL
                     forControlEvents:UIControlEventTouchUpInside];
            [buttonFour3 removeTarget:nil
                               action:NULL
                     forControlEvents:UIControlEventTouchUpInside];
            [buttonFour4 removeTarget:nil
                               action:NULL
                     forControlEvents:UIControlEventTouchUpInside];
            [buttonFour5 removeTarget:nil
                               action:NULL
                     forControlEvents:UIControlEventTouchUpInside];
            [buttonFive1 removeTarget:nil
                               action:NULL
                     forControlEvents:UIControlEventTouchUpInside];
            [buttonFive2 removeTarget:nil
                               action:NULL
                     forControlEvents:UIControlEventTouchUpInside];
            [buttonFive3 removeTarget:nil
                               action:NULL
                     forControlEvents:UIControlEventTouchUpInside];
            [buttonFive4 removeTarget:nil
                               action:NULL
                     forControlEvents:UIControlEventTouchUpInside];
            
            //講堂
            [buttonOne1 addTarget:self
                           action:@selector(buttonOne1Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonOne2 addTarget:self
                           action:@selector(buttonOne2Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonOne3 addTarget:self
                           action:@selector(buttonOne3Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonOne4 addTarget:self
                           action:@selector(buttonOne4Detail2:) forControlEvents:UIControlEventTouchUpInside];
            
            
            //外ステージ
            [buttonTwo1 addTarget:self
                           action:@selector(buttonTwo1Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo2 addTarget:self
                           action:@selector(buttonTwo2Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo3 addTarget:self
                           action:@selector(buttonTwo3Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo4 addTarget:self
                           action:@selector(buttonTwo4Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo5 addTarget:self
                           action:@selector(buttonTwo5Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo6 addTarget:self
                           action:@selector(buttonTwo6Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo7 addTarget:self
                           action:@selector(buttonTwo7Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo8 addTarget:self
                           action:@selector(buttonTwo8Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonTwo9 addTarget:self
                           action:@selector(buttonTwo9Detail2:) forControlEvents:UIControlEventTouchUpInside];
            
            
            //ライブハウス1
            [buttonThree1 addTarget:self
                             action:@selector(buttonThree1Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonThree2 addTarget:self
                             action:@selector(buttonThree2Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonThree3 addTarget:self
                             action:@selector(buttonThree3Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonThree4 addTarget:self
                             action:@selector(buttonThree4Detail2:) forControlEvents:UIControlEventTouchUpInside];
            
            
            //ライブハウス2
            [buttonFour1 addTarget:self
                            action:@selector(buttonFour1Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonFour2 addTarget:self
                            action:@selector(buttonFour2Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonFour3 addTarget:self
                            action:@selector(buttonFour3Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonFour4 addTarget:self
                            action:@selector(buttonFour4Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonFour5 addTarget:self
                            action:@selector(buttonFour5Detail2:) forControlEvents:UIControlEventTouchUpInside];
            
            
            //小講堂
            [buttonFive1 addTarget:self
                            action:@selector(buttonFive1Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonFive2 addTarget:self
                            action:@selector(buttonFive2Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonFive3 addTarget:self
                            action:@selector(buttonFive3Detail2:) forControlEvents:UIControlEventTouchUpInside];
            [buttonFive4 addTarget:self
                            action:@selector(buttonFive4Detail2:) forControlEvents:UIControlEventTouchUpInside];

    }
        
    }
    
}
@end
