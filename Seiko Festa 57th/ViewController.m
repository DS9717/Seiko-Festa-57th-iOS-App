//
//  ViewController.m
//  Seiko Festa 57th
//
//  Created by Daisuke  on 2016/01/15.
//  Copyright (c) 2016年 Daisuke Masuda. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <CoreGraphics/CoreGraphics.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@end

@implementation ViewController
@synthesize flag;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    imageNumber = 0;
    imageNumber2 = 1;
    
    organizationFeaturedImages = @[@"英語劇 バナー1.png", @"ボールぽこぽこ バナー.jpg", @"ミュージックサロン バナー.JPG"];
    
    featuredImageButton = [[UIButton alloc]initWithFrame:CGRectMake(320, 64, 320, 130)];
    featuredImageButton2 = [[UIButton alloc]initWithFrame:CGRectMake(320, 64, 320, 130)];
    
    [self featuredImageIn];
    
    // UIScrollViewのインスタンス化
    mainScrollView = [[UIScrollView alloc]init];
    mainScrollView.frame = CGRectMake(0, 192, self.view.bounds.size.width, 327);
    //横スクロールのインジケータを非表示にする
    mainScrollView.showsHorizontalScrollIndicator = NO;

    mainScrollView.userInteractionEnabled = YES;
    mainScrollView.directionalLockEnabled = YES;
    mainScrollView.bounces = YES;
    mainScrollView.backgroundColor = [UIColor clearColor];
    //スクロールの範囲を設定
    [mainScrollView setContentSize:CGSizeMake(self.view.bounds.size.width, 880)];
    
    
    foodLabel = [[UILabel alloc]initWithFrame:CGRectMake(16,16, 45, 18)];
    foodLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:18];
    foodLabel.text = @"Food";
    [mainScrollView addSubview:foodLabel];
    
    viewAllButton1 = [[UIButton alloc]initWithFrame:CGRectMake(240, 19, 64, 12)];
    [viewAllButton1 setTitle:@"すべて見る" forState:UIControlStateNormal];
     viewAllButton1.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
    [viewAllButton1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [viewAllButton1 addTarget:self action:@selector(viewAll1:) forControlEvents:UIControlEventTouchUpInside];
    [mainScrollView addSubview:viewAllButton1];
    
    scrollView1 = [[UIScrollView alloc]init];
    scrollView1.frame = CGRectMake(0, 50, self.view.bounds.size.width, 110);
    scrollView1.showsHorizontalScrollIndicator = NO;
    scrollView1.userInteractionEnabled = YES;
    scrollView1.bounces = YES;
    [scrollView1 setContentSize:CGSizeMake(564, 106)];
    scrollView1.backgroundColor=[UIColor clearColor];
    [mainScrollView addSubview:scrollView1];
    
    buttonOne1= [[UIButton alloc]initWithFrame:CGRectMake(16, 0, 72, 72)];
    [buttonOne1 setImage:[UIImage imageNamed:@"麺☆恋.png"] forState:UIControlStateNormal];
    [buttonOne1 addTarget:self
                action:@selector(buttonOne1Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView1 addSubview:buttonOne1];
    
    buttonOne2= [[UIButton alloc]initWithFrame:CGRectMake(108, 0, 72, 72)];
    [buttonOne2 setImage:[UIImage imageNamed:@"塩焼きそば　麺’sRUNRUN.png"] forState:UIControlStateNormal];
    [buttonOne2 addTarget:self
                   action:@selector(buttonOne2Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView1 addSubview:buttonOne2];
    
    buttonOne3= [[UIButton alloc]initWithFrame:CGRectMake(200, 0, 72, 72)];
    [buttonOne3 setImage:[UIImage imageNamed:@"鉄板職人.jpg"] forState:UIControlStateNormal];
    [buttonOne3 addTarget:self
                   action:@selector(buttonOne3Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView1 addSubview:buttonOne3];
    
    buttonOne4= [[UIButton alloc]initWithFrame:CGRectMake(292, 0, 72, 72)];
    [buttonOne4 setImage:[UIImage imageNamed:@"俺のケバブ.jpg"] forState:UIControlStateNormal];
    [buttonOne4 addTarget:self
                   action:@selector(buttonOne4Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView1 addSubview:buttonOne4];
    
    buttonOne5= [[UIButton alloc]initWithFrame:CGRectMake(384, 0, 72, 72)];
    [buttonOne5 setImage:[UIImage imageNamed:@"クレープブレーク.png"] forState:UIControlStateNormal];
    [buttonOne5 addTarget:self
                    action:@selector(buttonOne5Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView1 addSubview:buttonOne5];
    
    buttonOne6= [[UIButton alloc]initWithFrame:CGRectMake(476, 0, 72, 72)];
    [buttonOne6 setImage:[UIImage imageNamed:@"Flapjack.png"] forState:UIControlStateNormal];
    [buttonOne6 addTarget:self
                   action:@selector(buttonOne6Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView1 addSubview:buttonOne6];
    
    buttonOne1Label = [[UILabel alloc]initWithFrame:CGRectMake(16, 80, 72, 14)];
    buttonOne1Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonOne1Label.text = @"麺☆恋";
    buttonOne1Label.numberOfLines = 0;
    [buttonOne1Label sizeToFit];
    [scrollView1 addSubview:buttonOne1Label];
    
    buttonOne2Label = [[UILabel alloc]initWithFrame:CGRectMake(108, 80, 72, 14)];
    buttonOne2Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonOne2Label.text = @"麺’sRUNRUN";
    buttonOne2Label.numberOfLines = 0;
    [buttonOne2Label sizeToFit];
    [scrollView1 addSubview:buttonOne2Label];
    
    buttonOne3Label = [[UILabel alloc]initWithFrame:CGRectMake(200, 80, 72, 14)];
    buttonOne3Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonOne3Label.text = @"鉄板職人";
    buttonOne3Label.numberOfLines = 0;
    [buttonOne3Label sizeToFit];
    [scrollView1 addSubview:buttonOne3Label];
    
    buttonOne4Label = [[UILabel alloc]initWithFrame:CGRectMake(292, 80, 72, 14)];
    buttonOne4Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonOne4Label.text = @"俺のケバブ";
    buttonOne4Label.numberOfLines = 0;
    [buttonOne4Label sizeToFit];
    [scrollView1 addSubview:buttonOne4Label];
    
    buttonOne5Label = [[UILabel alloc]initWithFrame:CGRectMake(384, 80, 72, 14)];
    buttonOne5Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonOne5Label.text = @"クレープブレーク";
    buttonOne5Label.numberOfLines = 0;
    [buttonOne5Label sizeToFit];
    [scrollView1 addSubview:buttonOne5Label];
    
    buttonOne6Label = [[UILabel alloc]initWithFrame:CGRectMake(476, 80, 72, 14)];
    buttonOne6Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonOne6Label.text = @"Flapjack";
    buttonOne6Label.numberOfLines = 0;
    [buttonOne6Label sizeToFit];
    [scrollView1 addSubview:buttonOne6Label];
    
    
    
    displayLabel = [[UILabel alloc]initWithFrame:CGRectMake(16,192, 60, 22)];
    displayLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:18];
    displayLabel.text = @"Display";
    [mainScrollView addSubview:displayLabel];
    
    viewAllButton2 = [[UIButton alloc]initWithFrame:CGRectMake(240, 195, 64, 12)];
    [viewAllButton2 setTitle:@"すべて見る" forState:UIControlStateNormal];
    viewAllButton2.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
    [viewAllButton2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [viewAllButton2 addTarget:self action:@selector(viewAll2:) forControlEvents:UIControlEventTouchUpInside];
    [mainScrollView addSubview:viewAllButton2];
    
    scrollView2 = [[UIScrollView alloc]init];
    scrollView2.frame = CGRectMake(0, 226, self.view.bounds.size.width, 110);
    scrollView2.showsHorizontalScrollIndicator = NO;
    scrollView2.userInteractionEnabled = YES;
    scrollView2.bounces = YES;
    [scrollView2 setContentSize:CGSizeMake(472, 106)];
    scrollView2.backgroundColor=[UIColor clearColor];
    [mainScrollView addSubview:scrollView2];
    
    buttonTwo1= [[UIButton alloc]initWithFrame:CGRectMake(16, 0, 72, 72)];
    [buttonTwo1 setImage:[UIImage imageNamed:@"英語劇.png"] forState:UIControlStateNormal];
    [buttonTwo1 addTarget:self
                   action:@selector(buttonTwo1Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo1];
    
    buttonTwo2= [[UIButton alloc]initWithFrame:CGRectMake(108, 0, 72, 72)];
    [buttonTwo2 setImage:[UIImage imageNamed:@"高3英語劇.png"] forState:UIControlStateNormal];
    [buttonTwo2 addTarget:self
                   action:@selector(buttonTwo2Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo2];
    
    buttonTwo3= [[UIButton alloc]initWithFrame:CGRectMake(200, 0, 72, 72)];
    [buttonTwo3 setImage:[UIImage imageNamed:@"迷いの国のアリス.png"] forState:UIControlStateNormal];
    [buttonTwo3 addTarget:self
                     action:@selector(buttonTwo3Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo3];
    
    buttonTwo4= [[UIButton alloc]initWithFrame:CGRectMake(292, 0, 72, 72)];
    [buttonTwo4 setImage:[UIImage imageNamed:@"Trick×Hark.jpg"] forState:UIControlStateNormal];
    [buttonTwo4 addTarget:self
                    action:@selector(buttonTwo4Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo4];
    
    buttonTwo5= [[UIButton alloc]initWithFrame:CGRectMake(384, 0, 72, 72)];
    [buttonTwo5 setImage:[UIImage imageNamed:@"インターアクト.png"] forState:UIControlStateNormal];
    [buttonTwo5 addTarget:self
                    action:@selector(buttonTwo5Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo5];
    
    buttonTwo1Label = [[UILabel alloc]initWithFrame:CGRectMake(16, 80, 72, 14)];
    buttonTwo1Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonTwo1Label.text = @"英語劇";
    buttonTwo1Label.numberOfLines = 0;
    [buttonTwo1Label sizeToFit];
    [scrollView2 addSubview:buttonTwo1Label];
    
    buttonTwo2Label = [[UILabel alloc]initWithFrame:CGRectMake(108, 80, 72, 14)];
    buttonTwo2Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonTwo2Label.text = @"高3英語劇";
    buttonTwo2Label.numberOfLines = 0;
    [buttonTwo2Label sizeToFit];
    [scrollView2 addSubview:buttonTwo2Label];
    
    buttonTwo3Label = [[UILabel alloc]initWithFrame:CGRectMake(200, 80, 72, 14)];
    buttonTwo3Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonTwo3Label.text = @"迷いの国のアリス";
    buttonTwo3Label.numberOfLines = 0;
    [buttonTwo3Label sizeToFit];
    [scrollView2 addSubview:buttonTwo3Label];
    
    buttonTwo4Label = [[UILabel alloc]initWithFrame:CGRectMake(292, 80, 72, 14)];
    buttonTwo4Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonTwo4Label.text = @"Trick×Hark";
    buttonTwo4Label.numberOfLines = 0;
    [buttonTwo4Label sizeToFit];
    [scrollView2 addSubview:buttonTwo4Label];
    
    buttonTwo5Label = [[UILabel alloc]initWithFrame:CGRectMake(384, 80, 72, 14)];
    buttonTwo5Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonTwo5Label.text = @"インターアクトクラブ";
    buttonTwo5Label.numberOfLines = 0;
    [buttonTwo5Label sizeToFit];
    [scrollView2 addSubview:buttonTwo5Label];
    
    
    bandLabel = [[UILabel alloc]initWithFrame:CGRectMake(16,368, 60, 22)];
    bandLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:18];
    bandLabel.text = @"Band";
    [mainScrollView addSubview:bandLabel];
    
    viewAllBUtton3 = [[UIButton alloc]initWithFrame:CGRectMake(240, 371, 64, 12)];
    [viewAllBUtton3 setTitle:@"すべて見る" forState:UIControlStateNormal];
    viewAllBUtton3.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
    [viewAllBUtton3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [viewAllBUtton3 addTarget:self action:@selector(viewAll3:) forControlEvents:UIControlEventTouchUpInside];
    [mainScrollView addSubview:viewAllBUtton3];
    
    scrollView3 = [[UIScrollView alloc]init];
    scrollView3.frame = CGRectMake(0, 402, self.view.bounds.size.width, 110);
    scrollView3.showsHorizontalScrollIndicator = NO;
    scrollView3.userInteractionEnabled = YES;
    scrollView3.bounces = YES;
    [scrollView3 setContentSize:CGSizeMake(564, 110)];
    scrollView3.backgroundColor=[UIColor clearColor];
    [mainScrollView addSubview:scrollView3];
    
    buttonThree1= [[UIButton alloc]initWithFrame:CGRectMake(16, 0, 72, 72)];
    [buttonThree1 setImage:[UIImage imageNamed:@"Chaos-illusion.png"] forState:UIControlStateNormal];
    [buttonThree1 addTarget:self
                   action:@selector(buttonThree1Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView3 addSubview:buttonThree1];
    
    buttonThree2= [[UIButton alloc]initWithFrame:CGRectMake(108, 0, 72, 72)];
    [buttonThree2 setImage:[UIImage imageNamed:@"Flat-Flight.png"] forState:UIControlStateNormal];
    [buttonThree2 addTarget:self
                   action:@selector(buttonThree2Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView3 addSubview:buttonThree2];
    
    buttonThree3= [[UIButton alloc]initWithFrame:CGRectMake(200, 0, 72, 72)];
    [buttonThree3 setImage:[UIImage imageNamed:@"M&A.png"] forState:UIControlStateNormal];
    [buttonThree3 addTarget:self
                   action:@selector(buttonThree3Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView3 addSubview:buttonThree3];
    
    buttonThree4= [[UIButton alloc]initWithFrame:CGRectMake(292, 0, 72, 72)];
    [buttonThree4 setImage:[UIImage imageNamed:@"WEAK-END.png"] forState:UIControlStateNormal];
    [buttonThree4 addTarget:self
                   action:@selector(buttonThree4Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView3 addSubview:buttonThree4];
    
    buttonThree5= [[UIButton alloc]initWithFrame:CGRectMake(384, 0, 72, 72)];
    [buttonThree5 setImage:[UIImage imageNamed:@"エストレーラ.png"] forState:UIControlStateNormal];
    [buttonThree5 addTarget:self
                   action:@selector(buttonThree5Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView3 addSubview:buttonThree5];
    
    buttonThree6= [[UIButton alloc]initWithFrame:CGRectMake(476, 0, 72, 72)];
    [buttonThree6 setImage:[UIImage imageNamed:@"蜃気楼.png"] forState:UIControlStateNormal];
    [buttonThree6 addTarget:self
                     action:@selector(buttonThree6Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView3 addSubview:buttonThree6];
    
    buttonThree1Label = [[UILabel alloc]initWithFrame:CGRectMake(16, 80, 72, 14)];
    buttonThree1Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonThree1Label.text = @"Chaos-illusion";
    buttonThree1Label.numberOfLines = 0;
    [buttonThree1Label sizeToFit];
    [scrollView3 addSubview:buttonThree1Label];
    
    buttonThree2Label = [[UILabel alloc]initWithFrame:CGRectMake(108, 80, 72, 14)];
    buttonThree2Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonThree2Label.text = @"Flat-Flight";
    buttonThree2Label.numberOfLines = 0;
    [buttonThree2Label sizeToFit];
    [scrollView3 addSubview:buttonThree2Label];
    
    buttonThree3Label = [[UILabel alloc]initWithFrame:CGRectMake(200, 80, 72, 14)];
    buttonThree3Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonThree3Label.text = @"M&A";
    buttonThree3Label.numberOfLines = 0;
    [buttonThree3Label sizeToFit];
    [scrollView3 addSubview:buttonThree3Label];
    
    buttonThree4Label = [[UILabel alloc]initWithFrame:CGRectMake(292, 80, 72, 14)];
    buttonThree4Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonThree4Label.text = @"WEAK-END";
    buttonThree4Label.numberOfLines = 0;
    [buttonThree4Label sizeToFit];
    [scrollView3 addSubview:buttonThree4Label];
    
    buttonThree5Label = [[UILabel alloc]initWithFrame:CGRectMake(384, 80, 72, 14)];
    buttonThree5Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonThree5Label.text = @"エストレーラ";
    buttonThree5Label.numberOfLines = 0;
    [buttonThree5Label sizeToFit];
    [scrollView3 addSubview:buttonThree5Label];
    
    buttonThree6Label = [[UILabel alloc]initWithFrame:CGRectMake(476, 80, 72, 14)];
    buttonThree6Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonThree6Label.text = @"蜃気楼";
    buttonThree6Label.numberOfLines = 0;
    [buttonThree6Label sizeToFit];
    [scrollView3 addSubview:buttonThree6Label];
    
    
    
    performanceLabel = [[UILabel alloc]initWithFrame:CGRectMake(16,544, 100, 22)];
    performanceLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:18];
    performanceLabel.text = @"Performace";
    [mainScrollView addSubview:performanceLabel];
    
    viewAllButton4 = [[UIButton alloc]initWithFrame:CGRectMake(240, 547, 64, 12)];
    [viewAllButton4 setTitle:@"すべて見る" forState:UIControlStateNormal];
    viewAllButton4.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
    [viewAllButton4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [viewAllButton4 addTarget:self action:@selector(viewAll4:) forControlEvents:UIControlEventTouchUpInside];
    [mainScrollView addSubview:viewAllButton4];
    
    scrollView4 = [[UIScrollView alloc]init];
    scrollView4.frame = CGRectMake(0, 578, self.view.bounds.size.width, 110);
    scrollView4.showsHorizontalScrollIndicator = NO;
    scrollView4.userInteractionEnabled = YES;
    scrollView4.bounces = YES;
    [scrollView4 setContentSize:CGSizeMake(564, 110)];
    scrollView4.backgroundColor=[UIColor clearColor];
    [mainScrollView addSubview:scrollView4];
    
    buttonFour1= [[UIButton alloc]initWithFrame:CGRectMake(16, 0, 72, 72)];
    [buttonFour1 setImage:[UIImage imageNamed:@"Grand-Finale.png"] forState:UIControlStateNormal];
    [buttonFour1 addTarget:self
                     action:@selector(buttonFour1Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView4 addSubview:buttonFour1];
    
    buttonFour2= [[UIButton alloc]initWithFrame:CGRectMake(108, 0, 72, 72)];
    [buttonFour2 setImage:[UIImage imageNamed:@"英語劇講堂劇.png"] forState:UIControlStateNormal];
    [buttonFour2 addTarget:self
                     action:@selector(buttonFour2Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView4 addSubview:buttonFour2];
    
    buttonFour3= [[UIButton alloc]initWithFrame:CGRectMake(200, 0, 72, 72)];
    [buttonFour3 setImage:[UIImage imageNamed:@"ボールぽこぽこ.png"] forState:UIControlStateNormal];
    [buttonFour3 addTarget:self
                     action:@selector(buttonFour3Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView4 addSubview:buttonFour3];
    
    buttonFour4= [[UIButton alloc]initWithFrame:CGRectMake(292, 0, 72, 72)];
    [buttonFour4 setImage:[UIImage imageNamed:@"校長対談.png"] forState:UIControlStateNormal];
    [buttonFour4 addTarget:self
                     action:@selector(buttonFour4Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView4 addSubview:buttonFour4];
    
    buttonFour5= [[UIButton alloc]initWithFrame:CGRectMake(384, 0, 72, 72)];
    [buttonFour5 setImage:[UIImage imageNamed:@"ミュージックサロン.png"] forState:UIControlStateNormal];
    [buttonFour5 addTarget:self
                     action:@selector(buttonFour5Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView4 addSubview:buttonFour5];
    
    buttonFour6= [[UIButton alloc]initWithFrame:CGRectMake(476, 0, 72, 72)];
    [buttonFour6 setImage:[UIImage imageNamed:@"グリークラブ.png"] forState:UIControlStateNormal];
    [buttonFour6 addTarget:self
                    action:@selector(buttonFour6Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView4 addSubview:buttonFour6];
    
    buttonFour1Label = [[UILabel alloc]initWithFrame:CGRectMake(16, 80, 72, 14)];
    buttonFour1Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonFour1Label.text = @"Grand-Finale";
    buttonFour1Label.numberOfLines = 0;
    [buttonFour1Label sizeToFit];
    [scrollView4 addSubview:buttonFour1Label];
    
    buttonFour2Label = [[UILabel alloc]initWithFrame:CGRectMake(108, 80, 72, 14)];
    buttonFour2Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonFour2Label.text = @"英語劇";
    buttonFour2Label.numberOfLines = 0;
    [buttonFour2Label sizeToFit];
    [scrollView4 addSubview:buttonFour2Label];
    
    buttonFour3Label = [[UILabel alloc]initWithFrame:CGRectMake(200, 80, 72, 14)];
    buttonFour3Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonFour3Label.text = @"ボールぽこぽこ";
    buttonFour3Label.numberOfLines = 0;
    [buttonFour3Label sizeToFit];
    [scrollView4 addSubview:buttonFour3Label];
    
    buttonFour4Label = [[UILabel alloc]initWithFrame:CGRectMake(292, 80, 72, 14)];
    buttonFour4Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonFour4Label.text = @"校長対談";
    buttonFour4Label.numberOfLines = 0;
    [buttonFour4Label sizeToFit];
    [scrollView4 addSubview:buttonFour4Label];
    
    buttonFour5Label = [[UILabel alloc]initWithFrame:CGRectMake(384, 80, 72, 14)];
    buttonFour5Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonFour5Label.text = @"ミュージックサロン";
    buttonFour5Label.numberOfLines = 0;
    [buttonFour5Label sizeToFit];
    [scrollView4 addSubview:buttonFour5Label];
    
    buttonFour6Label = [[UILabel alloc]initWithFrame:CGRectMake(476, 80, 72, 14)];
    buttonFour6Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonFour6Label.text = @"グリークラブ";
    buttonFour6Label.numberOfLines = 0;
    [buttonFour6Label sizeToFit];
    [scrollView4 addSubview:buttonFour6Label];
    
    
    
    stageLabel = [[UILabel alloc]initWithFrame:CGRectMake(16,720, 50, 22)];
    stageLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:18];
    stageLabel.text = @"Stage";
    [mainScrollView addSubview:stageLabel];
    
    viewAllButton5 = [[UIButton alloc]initWithFrame:CGRectMake(240, 725, 64, 12)];
    [viewAllButton5 setTitle:@"すべて見る" forState:UIControlStateNormal];
    viewAllButton5.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
    [viewAllButton5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [viewAllButton5 addTarget:self action:@selector(viewAll5:) forControlEvents:UIControlEventTouchUpInside];
    [mainScrollView addSubview:viewAllButton5];
    
    scrollView5 = [[UIScrollView alloc]init];
    scrollView5.frame = CGRectMake(0, 754, self.view.bounds.size.width, 110);
    scrollView5.showsHorizontalScrollIndicator = NO;
    scrollView5.userInteractionEnabled = YES;
    scrollView5.bounces = YES;
    [scrollView5 setContentSize:CGSizeMake(564, 110)];
    scrollView5.backgroundColor=[UIColor clearColor];
    [mainScrollView addSubview:scrollView5];
    
    buttonFive1= [[UIButton alloc]initWithFrame:CGRectMake(16, 0, 72, 72)];
    [buttonFive1 setImage:[UIImage imageNamed:@"春夜祭.png"] forState:UIControlStateNormal];
    [buttonFive1 addTarget:self
                    action:@selector(buttonFive1Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView5 addSubview:buttonFive1];
    
    buttonFive2= [[UIButton alloc]initWithFrame:CGRectMake(108, 0, 72, 72)];
    [buttonFive2 setImage:[UIImage imageNamed:@"フォークダンス.png"] forState:UIControlStateNormal];
    [buttonFive2 addTarget:self
                    action:@selector(buttonFive2Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView5 addSubview:buttonFive2];
    
    buttonFive3= [[UIButton alloc]initWithFrame:CGRectMake(200, 0, 72, 72)];
    [buttonFive3 setImage:[UIImage imageNamed:@"○○男子No.1決定戦.png"] forState:UIControlStateNormal];
    [buttonFive3 addTarget:self
                    action:@selector(buttonFive3Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView5 addSubview:buttonFive3];
    
    buttonFive4= [[UIButton alloc]initWithFrame:CGRectMake(292, 0, 72, 72)];
    [buttonFive4 setImage:[UIImage imageNamed:@"Mr.聖光.png"] forState:UIControlStateNormal];
    [buttonFive4 addTarget:self
                    action:@selector(buttonFive4Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView5 addSubview:buttonFive4];
    
    buttonFive5= [[UIButton alloc]initWithFrame:CGRectMake(384, 0, 72, 72)];
    [buttonFive5 setImage:[UIImage imageNamed:@"S-O-S.png"] forState:UIControlStateNormal];
    [buttonFive5 addTarget:self
                    action:@selector(buttonFive5Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView5 addSubview:buttonFive5];
    
    buttonFive6= [[UIButton alloc]initWithFrame:CGRectMake(476, 0, 72, 72)];
    [buttonFive6 setImage:[UIImage imageNamed:@"替え歌選手権.png"] forState:UIControlStateNormal];
    [buttonFive6 addTarget:self
                    action:@selector(buttonFive6Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView5 addSubview:buttonFive6];
    
    buttonFive1Label = [[UILabel alloc]initWithFrame:CGRectMake(16, 80, 72, 14)];
    buttonFive1Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonFive1Label.text = @"春夜祭";
    buttonFive1Label.numberOfLines = 0;
    [buttonFive1Label sizeToFit];
    [scrollView5 addSubview:buttonFive1Label];
    
    buttonFive2Label = [[UILabel alloc]initWithFrame:CGRectMake(108, 80, 72, 14)];
    buttonFive2Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonFive2Label.text = @"フォークダンス";
    buttonFive2Label.numberOfLines = 0;
    [buttonFive2Label sizeToFit];
    [scrollView5 addSubview:buttonFive2Label];
    
    buttonFive3Label = [[UILabel alloc]initWithFrame:CGRectMake(200, 80, 72, 14)];
    buttonFive3Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonFive3Label.text = @"○○男子No.1決定戦";
    buttonFive3Label.numberOfLines = 0;
    [buttonFive3Label sizeToFit];
    [scrollView5 addSubview:buttonFive3Label];
    
    buttonFive4Label = [[UILabel alloc]initWithFrame:CGRectMake(292, 80, 72, 14)];
    buttonFive4Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonFive4Label.text = @"Mr.聖光";
    buttonFive4Label.numberOfLines = 0;
    [buttonFive4Label sizeToFit];
    [scrollView5 addSubview:buttonFive4Label];
    
    buttonFive5Label = [[UILabel alloc]initWithFrame:CGRectMake(384, 80, 72, 14)];
    buttonFive5Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonFive5Label.text = @"S-O-S";
    buttonFive5Label.numberOfLines = 0;
    [buttonFive5Label sizeToFit];
    [scrollView5 addSubview:buttonFive5Label];
    
    buttonFive6Label = [[UILabel alloc]initWithFrame:CGRectMake(476, 80, 72, 14)];
    buttonFive6Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonFive6Label.text = @"替え歌選手権";
    buttonFive6Label.numberOfLines = 0;
    [buttonFive6Label sizeToFit];
    [scrollView5 addSubview:buttonFive6Label];
    
    [self.view addSubview:mainScrollView];
    
    
    UIView *horizontal1 = [[UIView alloc] initWithFrame:CGRectMake(16, 176, self.view.bounds.size.width - 16, 0.5)];
    horizontal1.backgroundColor = [UIColor colorWithRed:140.0/255.0 green:140.0/255.0 blue:140.0/255.0 alpha:1.0];
    [mainScrollView addSubview:horizontal1];
    
    UIView *horizontal2 = [[UIView alloc] initWithFrame:CGRectMake(16, 352, self.view.bounds.size.width - 16, 0.5)];
    horizontal2.backgroundColor = [UIColor colorWithRed:140.0/255.0 green:140.0/255.0 blue:140.0/255.0 alpha:1.0];
    [mainScrollView addSubview:horizontal2];
    
    UIView *horizontal3 = [[UIView alloc] initWithFrame:CGRectMake(16, 528, self.view.bounds.size.width - 16, 0.5)];
    horizontal3.backgroundColor = [UIColor colorWithRed:140.0/255.0 green:140.0/255.0 blue:140.0/255.0 alpha:1.0];
    [mainScrollView addSubview:horizontal3];
    
    UIView *horizontal4 = [[UIView alloc] initWithFrame:CGRectMake(16, 704, self.view.bounds.size.width - 16, 0.5)];
    horizontal4.backgroundColor = [UIColor colorWithRed:140.0/255.0 green:140.0/255.0 blue:140.0/255.0 alpha:1.0];
    [mainScrollView addSubview:horizontal4];
    
    UIView *horizontal5= [[UIView alloc] initWithFrame:CGRectMake(0, 516, self.view.bounds.size.width, 3)];
    horizontal5.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:horizontal5];
    
    self.navigationController.navigationBar.tintColor=[UIColor orangeColor];
    self.tabBarController.tabBar.barTintColor = [UIColor blackColor];
    self.tabBarController.tabBar.tintColor = [UIColor whiteColor];
  
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)featuredImageIn{
    
    if (imageNumber == organizationFeaturedImages.count) {
        
        imageNumber = 0;
        
    } else if (imageNumber > organizationFeaturedImages.count) {
        
        imageNumber = 1;
        
    }
    
    featuredImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@", organizationFeaturedImages[imageNumber]]];
    [featuredImageButton setImage:featuredImage forState:UIControlStateNormal];
    [featuredImageButton addTarget:self
                            action:@selector(featuredDetail:) forControlEvents:UIControlEventTouchUpInside];
    featuredImageButton.tag = imageNumber;
    
    [self.view addSubview:featuredImageButton];
    
    UIViewAnimationOptions animeOptions = UIViewAnimationOptionCurveLinear;
    
    [UIView animateWithDuration:0.5 delay:0.0 options:animeOptions animations:^{
        
        featuredImageButton.frame = CGRectMake(0, 64, 320, 130);
        
    }completion:^(BOOL finished){
        
        [self performSelector:@selector(featuredImageOut) withObject:nil afterDelay:2.0];
        
    }];
    
    imageNumber = imageNumber + 2;

}

-(void)featuredImageOut{
    
    UIViewAnimationOptions animeOptions = UIViewAnimationOptionCurveLinear;
    
    [UIView animateWithDuration:0.5 delay:0.0 options:animeOptions animations:^{
        
        featuredImageButton.frame = CGRectMake(-320, 64, 320, 130);
        
    }completion:^(BOOL finished){
    }];
    
    [self featuredImage2In];
    [self performSelector:@selector(featuredImageReady) withObject:nil afterDelay:0.6];
    
}

-(void)featuredImageReady{
    
    featuredImageButton.frame = CGRectMake(320, 64, 320, 130);
    
}

-(void)featuredImage2In{
    
    if (imageNumber2 > organizationFeaturedImages.count) {
    
        imageNumber2 = 1;
        
    }else if (imageNumber2 == organizationFeaturedImages.count) {
        
        imageNumber2 = 0;
        
    }
    
    featuredImage2 = [UIImage imageNamed:[NSString stringWithFormat:@"%@", organizationFeaturedImages[imageNumber2]]];
    [featuredImageButton2 setImage:featuredImage2 forState:UIControlStateNormal];
    [featuredImageButton2 addTarget:self
                            action:@selector(featuredDetail2:) forControlEvents:UIControlEventTouchUpInside];
    featuredImageButton2.tag = imageNumber2;
    
    [self.view addSubview:featuredImageButton2];
    
    UIViewAnimationOptions animeOptions = UIViewAnimationOptionCurveLinear;
    
    [UIView animateWithDuration:0.5 delay:0.0 options:animeOptions animations:^{
        
        featuredImageButton2.frame = CGRectMake(0, 64, 320, 130);
        
    }completion:^(BOOL finished){
        
        [self performSelector:@selector(featuredImage2Out) withObject:nil afterDelay:2.0];
        
    }];
    
    imageNumber2 = imageNumber2 + 2;
    
}

-(void)featuredImage2Out{
    
    UIViewAnimationOptions animeOptions = UIViewAnimationOptionCurveLinear;
    
    [UIView animateWithDuration:0.5 delay:0.0 options:animeOptions animations:^{
        
        featuredImageButton2.frame = CGRectMake(-320, 64, 320, 130);
        
    }completion:^(BOOL finished){
    }];
    
    [self featuredImageIn];
    [self performSelector:@selector(featuredImage2Ready) withObject:nil afterDelay:0.6];
    
}

-(void)featuredImage2Ready{
    
    featuredImageButton2.frame = CGRectMake(320, 64, 320, 130);
    
}

-(void)featuredDetail:(UIButton *)button{
    
    if (featuredImageButton.tag == 0) {
        flag = 2;
        whichList = @"performance";
    }else if (featuredImageButton.tag == 1) {
        flag = 3;
        whichList = @"performance";
    }else if (featuredImageButton.tag == 2) {
        flag = 5;
        whichList = @"performance";
    }
    
    [self performSegueWithIdentifier:@"showDirect" sender:self];
    
}

-(void)featuredDetail2:(UIButton *)button{
    
    if (featuredImageButton2.tag == 0) {
        flag = 2;
        whichList = @"performance";
    }else if (featuredImageButton2.tag == 1) {
        flag = 3;
        whichList = @"performance";
    }else if (featuredImageButton2.tag == 2) {
        flag = 5;
        whichList = @"performance";
    }
    
    [self performSegueWithIdentifier:@"showDirect" sender:self];
    
}

-(void)buttonOne1Detail:(UIButton *)button{
    whichList = @"food";
    flag = 1;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonOne2Detail:(UIButton *)button{
    whichList = @"food";
    flag = 2;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonOne3Detail:(UIButton *)button{
    whichList = @"food";
    flag = 3;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonOne4Detail:(UIButton *)button{
    whichList = @"food";
    flag = 4;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonOne5Detail:(UIButton *)button{
    whichList = @"food";
    flag = 5;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonOne6Detail:(UIButton *)button{
    whichList = @"food";
    flag = 6;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo1Detail:(UIButton *)button{
    whichList = @"display";
    flag = 1;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo2Detail:(UIButton *)button{
    whichList = @"display";
    flag = 2;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo3Detail:(UIButton *)button{
    whichList = @"display";
    flag = 3;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo4Detail:(UIButton *)button{
    whichList = @"display";
    flag = 4;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo5Detail:(UIButton *)button{
    whichList = @"display";
    flag = 5;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonThree1Detail:(UIButton *)button{
    whichList = @"band";
    flag = 1;
    [self performSegueWithIdentifier:@"showDirect" sender:self];

}

-(void)buttonThree2Detail:(UIButton *)button{
    whichList = @"band";
    flag = 2;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonThree3Detail:(UIButton *)button{
    whichList = @"band";
    flag = 3;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonThree4Detail:(UIButton *)button{
    whichList = @"band";
    flag = 4;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonThree5Detail:(UIButton *)button{
    whichList = @"band";
    flag = 5;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonThree6Detail:(UIButton *)button{
    whichList = @"band";
    flag = 6;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonFour1Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 1;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonFour2Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 2;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonFour3Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 3;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonFour4Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 4;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonFour5Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 5;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonFour6Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 6;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonFive1Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 1;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonFive2Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 2;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonFive3Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 3;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonFive4Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 4;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonFive5Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 5;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonFive6Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 6;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)viewAll1:(UIButton *)button{
    
    whichList = @"food";
    [self performSegueWithIdentifier:@"showList" sender:self];
    
}

-(void)viewAll2:(UIButton *)button{
    
    whichList = @"display";
    [self performSegueWithIdentifier:@"showList" sender:self];
    
}

-(void)viewAll3:(UIButton *)button{
    
    whichList = @"band";
    [self performSegueWithIdentifier:@"showList" sender:self];
    
}

-(void)viewAll4:(UIButton *)button{
    
    whichList = @"performance";
    [self performSegueWithIdentifier:@"showList" sender:self];
    
}

-(void)viewAll5:(UIButton *)button{
    
    whichList = @"stage";
    [self performSegueWithIdentifier:@"showList" sender:self];
    
}

#pragma mark -値を受け渡す
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showDirect"]) {
        DetailView *detailView = segue.destinationViewController;
        detailView.flag = flag;
        detailView.whatList = whichList;
    
    }
    
    else if ([segue.identifier isEqualToString:@"showList"]) {
        ListView *listView = segue.destinationViewController;
        listView.whatList = whichList;
    }
}

@end
