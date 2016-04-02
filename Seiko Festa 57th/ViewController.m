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
    
    contentOffsetY = 0;
        
    imageNumber = 0;
    imageNumber2 = 1;
    
    organizationFeaturedImages = @[@"Flat Flight バナー1.jpg", @"ボールぽこぽこ バナー.jpg", @"ミュージックサロン バナー.JPG"];
    
    featuredImageButton = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.width * 0.4)];
    featuredImageButton2 = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.width * 0.4)];
    
    [self featuredImageIn];
    
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:247.0/255.0 green:59.0/255.0 blue:63.0/255.0 alpha:1.0];
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    self.tabBarController.tabBar.barTintColor = [UIColor whiteColor];
    self.tabBarController.tabBar.tintColor = [UIColor colorWithRed:247.0/255.0 green:59.0/255.0 blue:63.0/255.0 alpha:1.0];
    
    //Navigation Itemのタイトルのフォントを設定
    UILabel *nav_title=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.navigationItem.titleView.frame.size.width,40)];
    nav_title.text=@"Welcome";
    nav_title.textColor=[UIColor whiteColor];
    
    nav_title.textAlignment=NSTextAlignmentCenter;
    
    [nav_title setFont:[UIFont fontWithName:@"MyriadPro-Regular" size:22]];
    self.navigationItem.titleView=nav_title;
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc]init];
    backButtonItem.title = @"";
    self.navigationItem.backBarButtonItem = backButtonItem;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //画面サイズ
    CGRect r = [[UIScreen mainScreen] bounds];
    if (r.size.width == 320) {
        //iPhone 4s/5/5c/5s
        spaceLeft = 16;
        length = 72;
        spaceW = 20;
        spaceH = 8;
        allButtonFont = 12; 
        buttonLabelFont = 13;
    } else if (r.size.width == 375) {
        //iPhone 6/6s
        spaceLeft = 15;
        length = 94;
        spaceW = 16;
        spaceH = 12;
        allButtonFont = 12;
        buttonLabelFont = 13;
    } else if (r.size.width == 414) {
        //iPhone 6 plus/6s plus
        spaceLeft = 15;
        length = 94;
        spaceW = 16;
        spaceH = 12;
        allButtonFont = 12;
        buttonLabelFont = 13;
    }
    
    
    // UIScrollViewのインスタンス化
    mainScrollView = [[UIScrollView alloc]init];
    //CGRectMake(0, 64+バナー, 横, 縦-64-バナー-3-49);
    mainScrollView.frame = CGRectMake(0, 0 + self.view.bounds.size.width * 0.4, self.view.bounds.size.width, self.view.bounds.size.height - self.view.bounds.size.width * 0.4 - 49);
    //横スクロールのインジケータを非表示にする
    mainScrollView.showsHorizontalScrollIndicator = NO;
    
    mainScrollView.userInteractionEnabled = YES;
    mainScrollView.directionalLockEnabled = YES;
    mainScrollView.bounces = YES;
    mainScrollView.backgroundColor = [UIColor clearColor];
    //スクロールの範囲を設定
    [mainScrollView setContentSize:CGSizeMake(self.view.bounds.size.width, 1176)];
    [mainScrollView setContentOffset:CGPointMake(0.0, contentOffsetY) animated:NO];
    
    Food = [[UIButton alloc]initWithFrame:CGRectMake(92.5, 16, 135, 90)];
    [Food setImage:[UIImage imageNamed:@"Food-icon"] forState:UIControlStateNormal];
    [Food addTarget:self action:@selector(viewAll1:) forControlEvents:UIControlEventTouchUpInside];
    [mainScrollView addSubview:Food];
    
    viewAllButton1 = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - 60, 16, 60, 90)];
    [viewAllButton1 setImage:[UIImage imageNamed:@"Right-to-List"] forState:UIControlStateNormal];
    viewAllButton1.contentMode = UIViewContentModeScaleAspectFill;
    [viewAllButton1 addTarget:self action:@selector(viewAll1:) forControlEvents:UIControlEventTouchUpInside];
    [mainScrollView addSubview:viewAllButton1];
    
    scrollView1 = [[UIScrollView alloc]init];
    scrollView1.frame = CGRectMake(0, 106, self.view.bounds.size.width, length + spaceH + buttonLabelFont + 33);
    scrollView1.showsHorizontalScrollIndicator = NO;
    scrollView1.userInteractionEnabled = YES;
    scrollView1.bounces = YES;
    [scrollView1 setContentSize:CGSizeMake(spaceLeft + (spaceW + length) * 14, length + spaceH + buttonLabelFont + 1)];
    [scrollView1 setContentOffset:CGPointMake(contentOffsetX1, 0.0) animated:NO];
    scrollView1.backgroundColor=[UIColor clearColor];
    [mainScrollView addSubview:scrollView1];
    
    buttonOne1= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 0, 0, length, length)];
    [buttonOne1 setImage:[UIImage imageNamed:@"鉄板職人.png"] forState:UIControlStateNormal];
    [buttonOne1 addTarget:self
                   action:@selector(buttonOne1Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView1 addSubview:buttonOne1];
    
    buttonOne2= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 1, 0, length, length)];
    [buttonOne2 setImage:[UIImage imageNamed:@"塩焼きそば-麺’sRUNRUN.png"] forState:UIControlStateNormal];
    [buttonOne2 addTarget:self
                   action:@selector(buttonOne2Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView1 addSubview:buttonOne2];
    
    buttonOne3= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 2, 0, length, length)];
    [buttonOne3 setImage:[UIImage imageNamed:@"麺☆恋.png"] forState:UIControlStateNormal];
    [buttonOne3 addTarget:self
                   action:@selector(buttonOne3Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView1 addSubview:buttonOne3];
    
    buttonOne4= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 3, 0, length, length)];
    [buttonOne4 setImage:[UIImage imageNamed:@"俺のケバブ.png"] forState:UIControlStateNormal];
    [buttonOne4 addTarget:self
                   action:@selector(buttonOne4Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView1 addSubview:buttonOne4];
    
    buttonOne5= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 4, 0, length, length)];
    [buttonOne5 setImage:[UIImage imageNamed:@"鳥角.png"] forState:UIControlStateNormal];
    [buttonOne5 addTarget:self
                   action:@selector(buttonOne5Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView1 addSubview:buttonOne5];
    
    buttonOne6= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 5, 0, length, length)];
    [buttonOne6 setImage:[UIImage imageNamed:@"クレープブレーク.png"] forState:UIControlStateNormal];
    [buttonOne6 addTarget:self
                   action:@selector(buttonOne6Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView1 addSubview:buttonOne6];
    
    buttonOne7= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 6, 0, length, length)];
    [buttonOne7 setImage:[UIImage imageNamed:@"Flapjack.png"] forState:UIControlStateNormal];
    [buttonOne7 addTarget:self
                   action:@selector(buttonOne7Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView1 addSubview:buttonOne7];
    
    buttonOne8= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 7, 0, length, length)];
    [buttonOne8 setImage:[UIImage imageNamed:@"chocolat-π.png"] forState:UIControlStateNormal];
    [buttonOne8 addTarget:self
                   action:@selector(buttonOne8Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView1 addSubview:buttonOne8];
    
    buttonOne9= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 8, 0, length, length)];
    [buttonOne9 setImage:[UIImage imageNamed:@"Juicy-Juicer.png"] forState:UIControlStateNormal];
    [buttonOne9 addTarget:self
                   action:@selector(buttonOne9Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView1 addSubview:buttonOne9];
    
    buttonOne10= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 9, 0, length, length)];
    [buttonOne10 setImage:[UIImage imageNamed:@"綿's-candy.png"] forState:UIControlStateNormal];
    [buttonOne10 addTarget:self
                   action:@selector(buttonOne10Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView1 addSubview:buttonOne10];
    
    buttonOne11= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 10, 0, length, length)];
    [buttonOne11 setImage:[UIImage imageNamed:@"氷菓.png"] forState:UIControlStateNormal];
    [buttonOne11 addTarget:self
                   action:@selector(buttonOne11Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView1 addSubview:buttonOne11];
    
    buttonOne12= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 11, 0, length, length)];
    [buttonOne12 setImage:[UIImage imageNamed:@"山手の泉.png"] forState:UIControlStateNormal];
    [buttonOne12 addTarget:self
                   action:@selector(buttonOne12Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView1 addSubview:buttonOne12];
    
    buttonOne13= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 12, 0, length, length)];
    [buttonOne13 setImage:[UIImage imageNamed:@"題名のない音楽喫茶.png"] forState:UIControlStateNormal];
    [buttonOne13 addTarget:self
                   action:@selector(buttonOne13Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView1 addSubview:buttonOne13];
    
    buttonOne14= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 13, 0, length, length)];
    [buttonOne14 setImage:[UIImage imageNamed:@"駅弁.png"] forState:UIControlStateNormal];
    [buttonOne14 addTarget:self
                   action:@selector(buttonOne14Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView1 addSubview:buttonOne14];
    
    
    buttonOne1Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 0, length + spaceH, length, buttonLabelFont + 1)];
    buttonOne1Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonOne1Label.text = @"鉄板職人";
    buttonOne1Label.numberOfLines = 0;
    [buttonOne1Label sizeToFit];
    [scrollView1 addSubview:buttonOne1Label];
    
    buttonOne2Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 1, length + spaceH, length, buttonLabelFont + 1)];
    buttonOne2Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonOne2Label.text = @"麺’sRUNRUN";
    buttonOne2Label.numberOfLines = 0;
    [buttonOne2Label sizeToFit];
    [scrollView1 addSubview:buttonOne2Label];
    
    buttonOne3Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 2, length + spaceH, length, buttonLabelFont + 1)];
    buttonOne3Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonOne3Label.text = @"麺☆恋";
    buttonOne3Label.numberOfLines = 0;
    [buttonOne3Label sizeToFit];
    [scrollView1 addSubview:buttonOne3Label];
    
    buttonOne4Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 3, length + spaceH, length, buttonLabelFont + 1)];
    buttonOne4Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonOne4Label.text = @"俺のケバブ";
    buttonOne4Label.numberOfLines = 0;
    [buttonOne4Label sizeToFit];
    [scrollView1 addSubview:buttonOne4Label];
    
    buttonOne5Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 4, length + spaceH, length, buttonLabelFont + 1)];
    buttonOne5Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonOne5Label.text = @"鳥角";
    buttonOne5Label.numberOfLines = 0;
    [buttonOne5Label sizeToFit];
    [scrollView1 addSubview:buttonOne5Label];
    
    buttonOne6Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 5, length + spaceH, length, buttonLabelFont + 1)];
    buttonOne6Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonOne6Label.text = @"クレープブレーク";
    buttonOne6Label.numberOfLines = 0;
    [buttonOne6Label sizeToFit];
    [scrollView1 addSubview:buttonOne6Label];
    
    buttonOne7Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 6, length + spaceH, length, buttonLabelFont + 1)];
    buttonOne7Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonOne7Label.text = @"Flapjack";
    buttonOne7Label.numberOfLines = 0;
    [buttonOne7Label sizeToFit];
    [scrollView1 addSubview:buttonOne7Label];
    
    buttonOne8Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 7, length + spaceH, length, buttonLabelFont + 1)];
    buttonOne8Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonOne8Label.text = @"chocolat π";
    buttonOne8Label.numberOfLines = 0;
    [buttonOne8Label sizeToFit];
    [scrollView1 addSubview:buttonOne8Label];
    
    buttonOne9Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 8, length + spaceH, length, buttonLabelFont + 1)];
    buttonOne9Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonOne9Label.text = @"Juicy Juicer";
    buttonOne9Label.numberOfLines = 0;
    [buttonOne9Label sizeToFit];
    [scrollView1 addSubview:buttonOne9Label];
    
    buttonOne10Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 9, length + spaceH, length, buttonLabelFont + 1)];
    buttonOne10Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonOne10Label.text = @"綿's Candy";
    buttonOne10Label.numberOfLines = 0;
    [buttonOne10Label sizeToFit];
    [scrollView1 addSubview:buttonOne10Label];
    
    buttonOne11Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 10, length + spaceH, length, buttonLabelFont + 1)];
    buttonOne11Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonOne11Label.text = @"氷菓";
    buttonOne11Label.numberOfLines = 0;
    [buttonOne11Label sizeToFit];
    [scrollView1 addSubview:buttonOne11Label];
    
    buttonOne12Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 11, length + spaceH, length, buttonLabelFont + 1)];
    buttonOne12Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonOne12Label.text = @"山手の泉";
    buttonOne12Label.numberOfLines = 0;
    [buttonOne12Label sizeToFit];
    [scrollView1 addSubview:buttonOne12Label];
    
    buttonOne13Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 12, length + spaceH, length, buttonLabelFont + 1)];
    buttonOne13Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonOne13Label.text = @"題名のない音楽喫茶";
    buttonOne13Label.numberOfLines = 0;
    [buttonOne13Label sizeToFit];
    [scrollView1 addSubview:buttonOne13Label];
    
    buttonOne14Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 13, length + spaceH, length, buttonLabelFont + 1)];
    buttonOne14Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonOne14Label.text = @"駅弁";
    buttonOne14Label.numberOfLines = 0;
    [buttonOne14Label sizeToFit];
    [scrollView1 addSubview:buttonOne14Label];
    
    
    
    
    //趣味研
    Display = [[UIButton alloc]initWithFrame:CGRectMake(92.5, 248, 135, 90)];
    [Display setImage:[UIImage imageNamed:@"Display-icon"] forState:UIControlStateNormal];
    [Display addTarget:self action:@selector(viewAll2:) forControlEvents:UIControlEventTouchUpInside];
    [mainScrollView addSubview:Display];
    
    viewAllButton2 = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - 60, 248, 60, 90)];
    [viewAllButton2 setImage:[UIImage imageNamed:@"Right-to-List"] forState:UIControlStateNormal];
    viewAllButton2.contentMode = UIViewContentModeCenter;
    [viewAllButton2 addTarget:self action:@selector(viewAll2:) forControlEvents:UIControlEventTouchUpInside];
    [mainScrollView addSubview:viewAllButton2];
    
    scrollView2 = [[UIScrollView alloc]init];
    scrollView2.frame = CGRectMake(0, 338, self.view.bounds.size.width, length + spaceH + buttonLabelFont + 33);
    scrollView2.showsHorizontalScrollIndicator = NO;
    scrollView2.userInteractionEnabled = YES;
    scrollView2.bounces = YES;
    [scrollView2 setContentSize:CGSizeMake(spaceLeft + (spaceW + length) * 41, length + spaceH + buttonLabelFont + 1)];
    [scrollView2 setContentOffset:CGPointMake(contentOffsetX2, 0.0) animated:NO];
    scrollView2.backgroundColor=[UIColor clearColor];
    [mainScrollView addSubview:scrollView2];
    
    buttonTwo1= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 0, 0, length, length)];
    [buttonTwo1 setImage:[UIImage imageNamed:@"英語劇.png"] forState:UIControlStateNormal];
    [buttonTwo1 addTarget:self
                   action:@selector(buttonTwo1Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo1];
    
    buttonTwo2= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 1, 0, length, length)];
    [buttonTwo2 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo2 addTarget:self
                   action:@selector(buttonTwo2Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo2];
    
    buttonTwo3= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 2, 0, length, length)];
    [buttonTwo3 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo3 addTarget:self
                   action:@selector(buttonTwo3Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo3];
    
    buttonTwo4= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 3, 0, length, length)];
    [buttonTwo4 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo4 addTarget:self
                   action:@selector(buttonTwo4Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo4];
    
    buttonTwo5= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 4, 0, length, length)];
    [buttonTwo5 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo5 addTarget:self
                   action:@selector(buttonTwo5Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo5];
    
    buttonTwo6= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 5, 0, length, length)];
    [buttonTwo6 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo6 addTarget:self
                   action:@selector(buttonTwo6Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo6];
    
    buttonTwo7= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 6, 0, length, length)];
    [buttonTwo7 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo7 addTarget:self
                   action:@selector(buttonTwo7Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo7];
    
    buttonTwo8= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 7, 0, length, length)];
    [buttonTwo8 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo8 addTarget:self
                   action:@selector(buttonTwo8Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo8];
    
    buttonTwo9= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 8, 0, length, length)];
    [buttonTwo9 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo9 addTarget:self
                   action:@selector(buttonTwo9Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo9];
    
    buttonTwo10= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 9, 0, length, length)];
    [buttonTwo10 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo10 addTarget:self
                   action:@selector(buttonTwo10Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo10];
    
    buttonTwo11= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 10, 0, length, length)];
    [buttonTwo11 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo11 addTarget:self
                    action:@selector(buttonTwo11Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo11];
    
    buttonTwo12= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 11, 0, length, length)];
    [buttonTwo12 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo12 addTarget:self
                    action:@selector(buttonTwo12Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo12];
    
    buttonTwo13= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 12, 0, length, length)];
    [buttonTwo13 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo13 addTarget:self
                    action:@selector(buttonTwo13Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo13];
    
    buttonTwo14= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 13, 0, length, length)];
    [buttonTwo14 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo14 addTarget:self
                    action:@selector(buttonTwo14Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo14];
    
    buttonTwo15= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 14, 0, length, length)];
    [buttonTwo15 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo15 addTarget:self
                    action:@selector(buttonTwo15Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo15];
    
    buttonTwo16= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 15, 0, length, length)];
    [buttonTwo16 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo16 addTarget:self
                    action:@selector(buttonTwo16Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo16];
    
    buttonTwo17= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 16, 0, length, length)];
    [buttonTwo17 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo17 addTarget:self
                    action:@selector(buttonTwo17Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo17];
    
    buttonTwo18= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 17, 0, length, length)];
    [buttonTwo18 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo18 addTarget:self
                    action:@selector(buttonTwo18Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo18];
    
    buttonTwo19= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 18, 0, length, length)];
    [buttonTwo19 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo19 addTarget:self
                    action:@selector(buttonTwo19Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo19];
    
    buttonTwo20= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 19, 0, length, length)];
    [buttonTwo20 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo20 addTarget:self
                    action:@selector(buttonTwo20Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo20];
    
    buttonTwo21= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 20, 0, length, length)];
    [buttonTwo21 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo21 addTarget:self
                    action:@selector(buttonTwo21Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo21];
    
    buttonTwo22= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 21, 0, length, length)];
    [buttonTwo22 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo22 addTarget:self
                    action:@selector(buttonTwo22Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo22];
    
    buttonTwo23= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 22, 0, length, length)];
    [buttonTwo23 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo23 addTarget:self
                    action:@selector(buttonTwo23Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo23];
    
    buttonTwo24= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 23, 0, length, length)];
    [buttonTwo24 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo24 addTarget:self
                    action:@selector(buttonTwo24Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo24];
    
    buttonTwo25= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 24, 0, length, length)];
    [buttonTwo25 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo25 addTarget:self
                    action:@selector(buttonTwo25Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo25];
    
    buttonTwo26= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 25, 0, length, length)];
    [buttonTwo26 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo26 addTarget:self
                    action:@selector(buttonTwo26Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo26];
    
    buttonTwo27= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 26, 0, length, length)];
    [buttonTwo27 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo27 addTarget:self
                    action:@selector(buttonTwo27Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo27];
    
    buttonTwo28= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 27, 0, length, length)];
    [buttonTwo28 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo28 addTarget:self
                    action:@selector(buttonTwo28Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo28];
    
    buttonTwo29= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 28, 0, length, length)];
    [buttonTwo29 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo29 addTarget:self
                    action:@selector(buttonTwo29Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo29];
    
    buttonTwo30= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 29, 0, length, length)];
    [buttonTwo30 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo30 addTarget:self
                    action:@selector(buttonTwo30Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo30];
    
    buttonTwo31= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 30, 0, length, length)];
    [buttonTwo31 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo31 addTarget:self
                    action:@selector(buttonTwo31Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo31];
    
    buttonTwo32= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 31, 0, length, length)];
    [buttonTwo32 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo32 addTarget:self
                    action:@selector(buttonTwo32Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo32];
    
    buttonTwo33= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 32, 0, length, length)];
    [buttonTwo33 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo33 addTarget:self
                    action:@selector(buttonTwo33Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo33];
    
    buttonTwo34= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 33, 0, length, length)];
    [buttonTwo34 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo34 addTarget:self
                    action:@selector(buttonTwo34Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo34];
    
    buttonTwo35= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 34, 0, length, length)];
    [buttonTwo35 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo35 addTarget:self
                    action:@selector(buttonTwo35Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo35];
    
    buttonTwo36= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 35, 0, length, length)];
    [buttonTwo36 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo36 addTarget:self
                    action:@selector(buttonTwo36Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo36];
    
    buttonTwo37= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 36, 0, length, length)];
    [buttonTwo37 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo37 addTarget:self
                    action:@selector(buttonTwo37Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo37];
    
    buttonTwo38= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 37, 0, length, length)];
    [buttonTwo38 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo38 addTarget:self
                    action:@selector(buttonTwo38Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo38];
    
    buttonTwo39= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 38, 0, length, length)];
    [buttonTwo39 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo39 addTarget:self
                    action:@selector(buttonTwo39Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo39];
    
    buttonTwo40= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 39, 0, length, length)];
    [buttonTwo40 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo40 addTarget:self
                    action:@selector(buttonTwo40Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo40];
    
    buttonTwo41= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 40, 0, length, length)];
    [buttonTwo41 setImage:[UIImage imageNamed:@".png"] forState:UIControlStateNormal];
    [buttonTwo41 addTarget:self
                    action:@selector(buttonTwo41Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo41];
    
    
    buttonTwo1Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 0, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo1Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo1Label.text = @"英語劇";
    buttonTwo1Label.numberOfLines = 0;
    [buttonTwo1Label sizeToFit];
    [scrollView2 addSubview:buttonTwo1Label];
    
    buttonTwo2Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 1, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo2Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo2Label.text = @"ポケモンセンターSeiko";
    buttonTwo2Label.numberOfLines = 0;
    [buttonTwo2Label sizeToFit];
    [scrollView2 addSubview:buttonTwo2Label];
    
    buttonTwo3Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 2, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo3Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo3Label.text = @"宇宙戦艦ヤマト研究会";
    buttonTwo3Label.numberOfLines = 0;
    [buttonTwo3Label sizeToFit];
    [scrollView2 addSubview:buttonTwo3Label];
    
    buttonTwo4Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 3, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo4Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo4Label.text = @"とにかく明るいFes村";
    buttonTwo4Label.numberOfLines = 0;
    [buttonTwo4Label sizeToFit];
    [scrollView2 addSubview:buttonTwo4Label];
    
    buttonTwo5Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 4, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo5Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo5Label.text = @"Trick×Hark";
    buttonTwo5Label.numberOfLines = 0;
    [buttonTwo5Label sizeToFit];
    [scrollView2 addSubview:buttonTwo5Label];
    
    buttonTwo6Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 5, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo6Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo6Label.text = @"";
    buttonTwo6Label.numberOfLines = 0;
    [buttonTwo6Label sizeToFit];
    [scrollView2 addSubview:buttonTwo6Label];
    
    buttonTwo7Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 6, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo7Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo7Label.text = @"";
    buttonTwo7Label.numberOfLines = 0;
    [buttonTwo7Label sizeToFit];
    [scrollView2 addSubview:buttonTwo7Label];
    
    buttonTwo8Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 7, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo8Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo8Label.text = @"";
    buttonTwo8Label.numberOfLines = 0;
    [buttonTwo8Label sizeToFit];
    [scrollView2 addSubview:buttonTwo8Label];
    
    buttonTwo9Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 8, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo9Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo9Label.text = @"";
    buttonTwo9Label.numberOfLines = 0;
    [buttonTwo9Label sizeToFit];
    [scrollView2 addSubview:buttonTwo9Label];
    
    buttonTwo10Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 9, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo10Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo10Label.text = @"";
    buttonTwo10Label.numberOfLines = 0;
    [buttonTwo10Label sizeToFit];
    [scrollView2 addSubview:buttonTwo10Label];
    
    buttonTwo11Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 10, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo11Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo11Label.text = @"";
    buttonTwo11Label.numberOfLines = 0;
    [buttonTwo11Label sizeToFit];
    [scrollView2 addSubview:buttonTwo11Label];
    
    buttonTwo12Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 11, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo12Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo12Label.text = @"";
    buttonTwo12Label.numberOfLines = 0;
    [buttonTwo12Label sizeToFit];
    [scrollView2 addSubview:buttonTwo12Label];
    
    buttonTwo13Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 12, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo13Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo13Label.text = @"";
    buttonTwo13Label.numberOfLines = 0;
    [buttonTwo13Label sizeToFit];
    [scrollView2 addSubview:buttonTwo13Label];
    
    buttonTwo14Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 13, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo14Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo14Label.text = @"";
    buttonTwo14Label.numberOfLines = 0;
    [buttonTwo14Label sizeToFit];
    [scrollView2 addSubview:buttonTwo14Label];
    
    buttonTwo15Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 14, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo15Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo1Label.text = @"";
    buttonTwo15Label.numberOfLines = 0;
    [buttonTwo15Label sizeToFit];
    [scrollView2 addSubview:buttonTwo15Label];
    
    buttonTwo16Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 15, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo16Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo16Label.text = @"";
    buttonTwo16Label.numberOfLines = 0;
    [buttonTwo16Label sizeToFit];
    [scrollView2 addSubview:buttonTwo16Label];
    
    buttonTwo17Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 16, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo17Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo17Label.text = @"";
    buttonTwo17Label.numberOfLines = 0;
    [buttonTwo17Label sizeToFit];
    [scrollView2 addSubview:buttonTwo17Label];
    
    buttonTwo18Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 17, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo18Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo18Label.text = @"";
    buttonTwo18Label.numberOfLines = 0;
    [buttonTwo18Label sizeToFit];
    [scrollView2 addSubview:buttonTwo18Label];
    
    buttonTwo19Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 18, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo19Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo19Label.text = @"";
    buttonTwo19Label.numberOfLines = 0;
    [buttonTwo19Label sizeToFit];
    [scrollView2 addSubview:buttonTwo19Label];
    
    buttonTwo20Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 19, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo20Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo20Label.text = @"";
    buttonTwo20Label.numberOfLines = 0;
    [buttonTwo20Label sizeToFit];
    [scrollView2 addSubview:buttonTwo20Label];
    
    buttonTwo21Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 20, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo21Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo21Label.text = @"";
    buttonTwo21Label.numberOfLines = 0;
    [buttonTwo21Label sizeToFit];
    [scrollView2 addSubview:buttonTwo21Label];
    
    buttonTwo22Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 21, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo22Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo22Label.text = @"";
    buttonTwo22Label.numberOfLines = 0;
    [buttonTwo22Label sizeToFit];
    [scrollView2 addSubview:buttonTwo22Label];
    
    buttonTwo23Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 22, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo23Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo23Label.text = @"";
    buttonTwo23Label.numberOfLines = 0;
    [buttonTwo23Label sizeToFit];
    [scrollView2 addSubview:buttonTwo23Label];
    
    buttonTwo24Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 23, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo24Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo24Label.text = @"";
    buttonTwo24Label.numberOfLines = 0;
    [buttonTwo24Label sizeToFit];
    [scrollView2 addSubview:buttonTwo24Label];
    
    buttonTwo25Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 24, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo25Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo25Label.text = @"";
    buttonTwo25Label.numberOfLines = 0;
    [buttonTwo25Label sizeToFit];
    [scrollView2 addSubview:buttonTwo25Label];
    
    buttonTwo26Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 25, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo26Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo26Label.text = @"";
    buttonTwo26Label.numberOfLines = 0;
    [buttonTwo26Label sizeToFit];
    [scrollView2 addSubview:buttonTwo26Label];
    
    buttonTwo27Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 26, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo27Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo27Label.text = @"";
    buttonTwo27Label.numberOfLines = 0;
    [buttonTwo27Label sizeToFit];
    [scrollView2 addSubview:buttonTwo27Label];
    
    buttonTwo28Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 27, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo28Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo28Label.text = @"";
    buttonTwo28Label.numberOfLines = 0;
    [buttonTwo28Label sizeToFit];
    [scrollView2 addSubview:buttonTwo28Label];
    
    buttonTwo29Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 28, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo29Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo29Label.text = @"";
    buttonTwo29Label.numberOfLines = 0;
    [buttonTwo29Label sizeToFit];
    [scrollView2 addSubview:buttonTwo29Label];
    
    buttonTwo30Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 29, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo30Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo30Label.text = @"";
    buttonTwo30Label.numberOfLines = 0;
    [buttonTwo30Label sizeToFit];
    [scrollView2 addSubview:buttonTwo30Label];
    
    buttonTwo31Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 30, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo31Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo31Label.text = @"";
    buttonTwo31Label.numberOfLines = 0;
    [buttonTwo31Label sizeToFit];
    [scrollView2 addSubview:buttonTwo31Label];
    
    buttonTwo32Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 31, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo32Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo32Label.text = @"";
    buttonTwo32Label.numberOfLines = 0;
    [buttonTwo32Label sizeToFit];
    [scrollView2 addSubview:buttonTwo32Label];
    
    buttonTwo33Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 32, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo33Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo33Label.text = @"";
    buttonTwo33Label.numberOfLines = 0;
    [buttonTwo33Label sizeToFit];
    [scrollView2 addSubview:buttonTwo33Label];
    
    buttonTwo34Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 33, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo34Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo34Label.text = @"";
    buttonTwo34Label.numberOfLines = 0;
    [buttonTwo34Label sizeToFit];
    [scrollView2 addSubview:buttonTwo34Label];
    
    buttonTwo35Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 34, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo35Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo35Label.text = @"";
    buttonTwo35Label.numberOfLines = 0;
    [buttonTwo35Label sizeToFit];
    [scrollView2 addSubview:buttonTwo35Label];
    
    buttonTwo36Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 35, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo36Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo36Label.text = @"";
    buttonTwo36Label.numberOfLines = 0;
    [buttonTwo36Label sizeToFit];
    [scrollView2 addSubview:buttonTwo36Label];
    
    buttonTwo37Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 36, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo37Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo37Label.text = @"";
    buttonTwo37Label.numberOfLines = 0;
    [buttonTwo37Label sizeToFit];
    [scrollView2 addSubview:buttonTwo37Label];
    
    buttonTwo38Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 37, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo38Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo38Label.text = @"";
    buttonTwo38Label.numberOfLines = 0;
    [buttonTwo38Label sizeToFit];
    [scrollView2 addSubview:buttonTwo38Label];
    
    buttonTwo39Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 38, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo39Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo39Label.text = @"";
    buttonTwo39Label.numberOfLines = 0;
    [buttonTwo39Label sizeToFit];
    [scrollView2 addSubview:buttonTwo39Label];
    
    buttonTwo40Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 39, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo40Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo40Label.text = @"";
    buttonTwo40Label.numberOfLines = 0;
    [buttonTwo40Label sizeToFit];
    [scrollView2 addSubview:buttonTwo40Label];
    
    buttonTwo41Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 40, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo41Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo41Label.text = @"";
    buttonTwo41Label.numberOfLines = 0;
    [buttonTwo40Label sizeToFit];
    [scrollView2 addSubview:buttonTwo41Label];
    
    
    
    
    
    //バンド
    Band = [[UIButton alloc]initWithFrame:CGRectMake(92.5, 480, 135, 90)];
    [Band setImage:[UIImage imageNamed:@"Band-icon"] forState:UIControlStateNormal];
    [Band addTarget:self action:@selector(viewAll3:) forControlEvents:UIControlEventTouchUpInside];
    [mainScrollView addSubview:Band];
    
    viewAllButton3 = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - 60, 480, 60, 90)];
    [viewAllButton3 setImage:[UIImage imageNamed:@"Right-to-List"] forState:UIControlStateNormal];
    viewAllButton3.contentMode = UIViewContentModeCenter;
    [viewAllButton3 addTarget:self action:@selector(viewAll3:) forControlEvents:UIControlEventTouchUpInside];
    [mainScrollView addSubview:viewAllButton3];
    
    scrollView3 = [[UIScrollView alloc]init];
    scrollView3.frame = CGRectMake(0, 570, self.view.bounds.size.width, length + spaceH + buttonLabelFont + 33);
    scrollView3.showsHorizontalScrollIndicator = NO;
    scrollView3.userInteractionEnabled = YES;
    scrollView3.bounces = YES;
    [scrollView3 setContentSize:CGSizeMake(spaceLeft + (spaceW + length) * 12, length + spaceH + buttonLabelFont + 1)];
    [scrollView3 setContentOffset:CGPointMake(contentOffsetX3, 0.0) animated:NO];
    scrollView3.backgroundColor=[UIColor clearColor];
    [mainScrollView addSubview:scrollView3];
    
    buttonThree1= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 0, 0, length, length)];
    [buttonThree1 setImage:[UIImage imageNamed:@"M&A.png"] forState:UIControlStateNormal];
    [buttonThree1 addTarget:self
                     action:@selector(buttonThree1Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView3 addSubview:buttonThree1];
    
    buttonThree2= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 1, 0, length, length)];
    [buttonThree2 setImage:[UIImage imageNamed:@"Flat-Flight.png"] forState:UIControlStateNormal];
    [buttonThree2 addTarget:self
                     action:@selector(buttonThree2Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView3 addSubview:buttonThree2];
    
    buttonThree3= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 2, 0, length, length)];
    [buttonThree3 setImage:[UIImage imageNamed:@"蜃気楼.png"] forState:UIControlStateNormal];
    [buttonThree3 addTarget:self
                     action:@selector(buttonThree3Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView3 addSubview:buttonThree3];
    
    buttonThree4= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 3, 0, length, length)];
    [buttonThree4 setImage:[UIImage imageNamed:@"ぽんでっくす.png"] forState:UIControlStateNormal];
    [buttonThree4 addTarget:self
                     action:@selector(buttonThree4Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView3 addSubview:buttonThree4];
    
    buttonThree5= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 4, 0, length, length)];
    [buttonThree5 setImage:[UIImage imageNamed:@"エストレーラ.png"] forState:UIControlStateNormal];
    [buttonThree5 addTarget:self
                     action:@selector(buttonThree5Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView3 addSubview:buttonThree5];
    
    buttonThree6= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 5, 0, length, length)];
    [buttonThree6 setImage:[UIImage imageNamed:@"Яooz-Leef.png"] forState:UIControlStateNormal];
    [buttonThree6 addTarget:self
                     action:@selector(buttonThree6Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView3 addSubview:buttonThree6];
    
    buttonThree7= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 6, 0, length, length)];
    [buttonThree7 setImage:[UIImage imageNamed:@"WEAK-END.png"] forState:UIControlStateNormal];
    [buttonThree7 addTarget:self
                     action:@selector(buttonThree7Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView3 addSubview:buttonThree7];
    
    buttonThree8= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 7, 0, length, length)];
    [buttonThree8 setImage:[UIImage imageNamed:@"Million-Dollars.png"] forState:UIControlStateNormal];
    [buttonThree8 addTarget:self
                     action:@selector(buttonThree8Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView3 addSubview:buttonThree8];
    
    buttonThree9= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 8, 0, length, length)];
    [buttonThree9 setImage:[UIImage imageNamed:@"せいとんがかり.png"] forState:UIControlStateNormal];
    [buttonThree9 addTarget:self
                     action:@selector(buttonThree9Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView3 addSubview:buttonThree9];
    
    buttonThree10= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 9, 0, length, length)];
    [buttonThree10 setImage:[UIImage imageNamed:@"Chaos-illusion.png"] forState:UIControlStateNormal];
    [buttonThree10 addTarget:self
                     action:@selector(buttonThree10Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView3 addSubview:buttonThree10];
    
    buttonThree11= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 10, 0, length, length)];
    [buttonThree11 setImage:[UIImage imageNamed:@"Addiction？.png"] forState:UIControlStateNormal];
    [buttonThree11 addTarget:self
                     action:@selector(buttonThree11Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView3 addSubview:buttonThree11];
    
    buttonThree12= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 11, 0, length, length)];
    [buttonThree12 setImage:[UIImage imageNamed:@"奴等.png"] forState:UIControlStateNormal];
    [buttonThree12 addTarget:self
                     action:@selector(buttonThree12Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView3 addSubview:buttonThree12];
    
    
    buttonThree1Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 0, length + spaceH, length, buttonLabelFont + 1)];
    buttonThree1Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonThree1Label.text = @"M&A";
    buttonThree1Label.numberOfLines = 0;
    [buttonThree1Label sizeToFit];
    [scrollView3 addSubview:buttonThree1Label];
    
    buttonThree2Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 1, length + spaceH, length, buttonLabelFont + 1)];
    buttonThree2Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonThree2Label.text = @"Flat Flight";
    buttonThree2Label.numberOfLines = 0;
    [buttonThree2Label sizeToFit];
    [scrollView3 addSubview:buttonThree2Label];
    
    buttonThree3Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 2, length + spaceH, length, buttonLabelFont + 1)];
    buttonThree3Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonThree3Label.text = @"蜃気楼";
    buttonThree3Label.numberOfLines = 0;
    [buttonThree3Label sizeToFit];
    [scrollView3 addSubview:buttonThree3Label];
    
    buttonThree4Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 3, length + spaceH, length, buttonLabelFont + 1)];
    buttonThree4Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonThree4Label.text = @"ぽんでっくす";
    buttonThree4Label.numberOfLines = 0;
    [buttonThree4Label sizeToFit];
    [scrollView3 addSubview:buttonThree4Label];
    
    buttonThree5Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 4, length + spaceH, length, buttonLabelFont + 1)];
    buttonThree5Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonThree5Label.text = @"エストレーラ";
    buttonThree5Label.numberOfLines = 0;
    [buttonThree5Label sizeToFit];
    [scrollView3 addSubview:buttonThree5Label];
    
    buttonThree6Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 5, length + spaceH, length, buttonLabelFont + 1)];
    buttonThree6Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonThree6Label.text = @"Яooz Leef";
    buttonThree6Label.numberOfLines = 0;
    [buttonThree6Label sizeToFit];
    [scrollView3 addSubview:buttonThree6Label];
    
    buttonThree7Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 6, length + spaceH, length, buttonLabelFont + 1)];
    buttonThree7Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonThree7Label.text = @"WEAK-END";
    buttonThree7Label.numberOfLines = 0;
    [buttonThree7Label sizeToFit];
    [scrollView3 addSubview:buttonThree7Label];
    
    buttonThree8Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 7, length + spaceH, length, buttonLabelFont + 1)];
    buttonThree8Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonThree8Label.text = @"Million Dollars";
    buttonThree8Label.numberOfLines = 0;
    [buttonThree8Label sizeToFit];
    [scrollView3 addSubview:buttonThree8Label];
    
    buttonThree9Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 8, length + spaceH, length, buttonLabelFont + 1)];
    buttonThree9Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonThree9Label.text = @"せいとんがかり";
    buttonThree9Label.numberOfLines = 0;
    [buttonThree9Label sizeToFit];
    [scrollView3 addSubview:buttonThree9Label];
    
    buttonThree10Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 9, length + spaceH, length, buttonLabelFont + 1)];
    buttonThree10Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonThree10Label.text = @"Chaos illusion";
    buttonThree10Label.numberOfLines = 0;
    [buttonThree10Label sizeToFit];
    [scrollView3 addSubview:buttonThree10Label];
    
    buttonThree11Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 10, length + spaceH, length, buttonLabelFont + 1)];
    buttonThree11Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonThree11Label.text = @"Addiction？";
    buttonThree11Label.numberOfLines = 0;
    [buttonThree11Label sizeToFit];
    [scrollView3 addSubview:buttonThree11Label];
    
    buttonThree12Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 11, length + spaceH, length, buttonLabelFont + 1)];
    buttonThree12Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonThree12Label.text = @"奴等";
    buttonThree12Label.numberOfLines = 0;
    [buttonThree12Label sizeToFit];
    [scrollView3 addSubview:buttonThree12Label];
    
    
    
    
    
    //講堂･小講堂
    Performance = [[UIButton alloc]initWithFrame:CGRectMake(92.5, 712, 135, 90)];
    [Performance setImage:[UIImage imageNamed:@"Performance-icon"] forState:UIControlStateNormal];
    [Performance addTarget:self action:@selector(viewAll4:) forControlEvents:UIControlEventTouchUpInside];
    [mainScrollView addSubview:Performance];
    
    viewAllButton4 = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - 60, 712, 60, 90)];
    [viewAllButton4 setImage:[UIImage imageNamed:@"Right-to-List"] forState:UIControlStateNormal];
    viewAllButton4.contentMode = UIViewContentModeCenter;
    [viewAllButton4 addTarget:self action:@selector(viewAll4:) forControlEvents:UIControlEventTouchUpInside];
    [mainScrollView addSubview:viewAllButton4];
    
    scrollView4 = [[UIScrollView alloc]init];
    scrollView4.frame = CGRectMake(0, 802, self.view.bounds.size.width, length + spaceH + buttonLabelFont + 33);
    scrollView4.showsHorizontalScrollIndicator = NO;
    scrollView4.userInteractionEnabled = YES;
    scrollView4.bounces = YES;
    [scrollView4 setContentSize:CGSizeMake(spaceLeft + (spaceW + length) * 13, length + spaceH + buttonLabelFont + 1)];
    [scrollView4 setContentOffset:CGPointMake(contentOffsetX4, 0.0) animated:NO];
    scrollView4.backgroundColor=[UIColor clearColor];
    [mainScrollView addSubview:scrollView4];
    
    buttonFour1= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 0, 0, length, length)];
    [buttonFour1 setImage:[UIImage imageNamed:@"Grand-Finale.png"] forState:UIControlStateNormal];
    [buttonFour1 addTarget:self
                    action:@selector(buttonFour1Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView4 addSubview:buttonFour1];
    
    buttonFour2= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 1, 0, length, length)];
    [buttonFour2 setImage:[UIImage imageNamed:@"英語劇講堂劇.png"] forState:UIControlStateNormal];
    [buttonFour2 addTarget:self
                    action:@selector(buttonFour2Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView4 addSubview:buttonFour2];
    
    buttonFour3= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 2, 0, length, length)];
    [buttonFour3 setImage:[UIImage imageNamed:@"ボールぽこぽこ.png"] forState:UIControlStateNormal];
    [buttonFour3 addTarget:self
                    action:@selector(buttonFour3Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView4 addSubview:buttonFour3];
    
    buttonFour4= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 3, 0, length, length)];
    [buttonFour4 setImage:[UIImage imageNamed:@"グリークラブ.png"] forState:UIControlStateNormal];
    [buttonFour4 addTarget:self
                    action:@selector(buttonFour4Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView4 addSubview:buttonFour4];
    
    buttonFour5= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 4, 0, length, length)];
    [buttonFour5 setImage:[UIImage imageNamed:@"弦楽オーケストラ部.png"] forState:UIControlStateNormal];
    [buttonFour5 addTarget:self
                    action:@selector(buttonFour5Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView4 addSubview:buttonFour5];
    
    buttonFour6= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 5, 0, length, length)];
    [buttonFour6 setImage:[UIImage imageNamed:@"恋愛偏差値.png"] forState:UIControlStateNormal];
    [buttonFour6 addTarget:self
                    action:@selector(buttonFour6Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView4 addSubview:buttonFour6];
    
    buttonFour7= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 6, 0, length, length)];
    [buttonFour7 setImage:[UIImage imageNamed:@"校長対談.png"] forState:UIControlStateNormal];
    [buttonFour7 addTarget:self
                    action:@selector(buttonFour7Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView4 addSubview:buttonFour7];
    
    buttonFour8= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 7, 0, length, length)];
    [buttonFour8 setImage:[UIImage imageNamed:@"吹奏楽部.png"] forState:UIControlStateNormal];
    [buttonFour8 addTarget:self
                    action:@selector(buttonFour8Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView4 addSubview:buttonFour8];
    
    buttonFour9= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 8, 0, length, length)];
    [buttonFour9 setImage:[UIImage imageNamed:@"ミュージックサロン.png"] forState:UIControlStateNormal];
    [buttonFour9 addTarget:self
                    action:@selector(buttonFour9Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView4 addSubview:buttonFour9];
    
    buttonFour10= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 9, 0, length, length)];
    [buttonFour10 setImage:[UIImage imageNamed:@"天使の歌声.png"] forState:UIControlStateNormal];
    [buttonFour10 addTarget:self
                    action:@selector(buttonFour10Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView4 addSubview:buttonFour10];
    
    buttonFour11= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 10, 0, length, length)];
    [buttonFour11 setImage:[UIImage imageNamed:@"数学研究会模擬講義.png"] forState:UIControlStateNormal];
    [buttonFour11 addTarget:self
                    action:@selector(buttonFour11Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView4 addSubview:buttonFour11];
    
    buttonFour12= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 11, 0, length, length)];
    [buttonFour12 setImage:[UIImage imageNamed:@"少林寺拳法部演武会.png"] forState:UIControlStateNormal];
    [buttonFour12 addTarget:self
                    action:@selector(buttonFour12Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView4 addSubview:buttonFour12];
    
    buttonFour13= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 12, 0, length, length)];
    [buttonFour13 setImage:[UIImage imageNamed:@"剣道部.png"] forState:UIControlStateNormal];
    [buttonFour13 addTarget:self
                    action:@selector(buttonFour13Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView4 addSubview:buttonFour13];
    
    buttonFour1Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 0, length + spaceH, length, buttonLabelFont + 1)];
    buttonFour1Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonFour1Label.text = @"Grand Finale";
    buttonFour1Label.numberOfLines = 0;
    [buttonFour1Label sizeToFit];
    [scrollView4 addSubview:buttonFour1Label];
    
    buttonFour2Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 1, length + spaceH, length, buttonLabelFont + 1)];
    buttonFour2Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonFour2Label.text = @"英語劇";
    buttonFour2Label.numberOfLines = 0;
    [buttonFour2Label sizeToFit];
    [scrollView4 addSubview:buttonFour2Label];
    
    buttonFour3Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 2, length + spaceH, length, buttonLabelFont + 1)];
    buttonFour3Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonFour3Label.text = @"ボールぽこぽこ";
    buttonFour3Label.numberOfLines = 0;
    [buttonFour3Label sizeToFit];
    [scrollView4 addSubview:buttonFour3Label];
    
    buttonFour4Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 3, length + spaceH, length, buttonLabelFont + 1)];
    buttonFour4Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonFour4Label.text = @"グリークラブ";
    buttonFour4Label.numberOfLines = 0;
    [buttonFour4Label sizeToFit];
    [scrollView4 addSubview:buttonFour4Label];
    
    buttonFour5Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 4, length + spaceH, length, buttonLabelFont + 1)];
    buttonFour5Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonFour5Label.text = @"弦楽オーケストラ部";
    buttonFour5Label.numberOfLines = 0;
    [buttonFour5Label sizeToFit];
    [scrollView4 addSubview:buttonFour5Label];
    
    buttonFour6Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 5, length + spaceH, length, buttonLabelFont + 1)];
    buttonFour6Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonFour6Label.text = @"恋愛偏差値";
    buttonFour6Label.numberOfLines = 0;
    [buttonFour6Label sizeToFit];
    [scrollView4 addSubview:buttonFour6Label];
    
    buttonFour7Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 6, length + spaceH, length, buttonLabelFont + 1)];
    buttonFour7Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonFour7Label.text = @"校長対談";
    buttonFour7Label.numberOfLines = 0;
    [buttonFour7Label sizeToFit];
    [scrollView4 addSubview:buttonFour7Label];
    
    buttonFour8Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 7, length + spaceH, length, buttonLabelFont + 1)];
    buttonFour8Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonFour8Label.text = @"吹奏楽部";
    buttonFour8Label.numberOfLines = 0;
    [buttonFour8Label sizeToFit];
    [scrollView4 addSubview:buttonFour8Label];
    
    buttonFour9Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 8, length + spaceH, length, buttonLabelFont + 1)];
    buttonFour9Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonFour9Label.text = @"ミュージックサロン";
    buttonFour9Label.numberOfLines = 0;
    [buttonFour9Label sizeToFit];
    [scrollView4 addSubview:buttonFour9Label];
    
    buttonFour10Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 9, length + spaceH, length, buttonLabelFont + 1)];
    buttonFour10Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonFour10Label.text = @"天使の歌声";
    buttonFour10Label.numberOfLines = 0;
    [buttonFour10Label sizeToFit];
    [scrollView4 addSubview:buttonFour10Label];
    
    buttonFour11Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 10, length + spaceH, length, buttonLabelFont + 1)];
    buttonFour11Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonFour11Label.text = @"数学研究会模擬講義";
    buttonFour11Label.numberOfLines = 0;
    [buttonFour11Label sizeToFit];
    [scrollView4 addSubview:buttonFour11Label];
    
    buttonFour12Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 11, length + spaceH, length, buttonLabelFont + 1)];
    buttonFour12Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonFour12Label.text = @"少林寺拳法部演武会";
    buttonFour12Label.numberOfLines = 0;
    [buttonFour12Label sizeToFit];
    [scrollView4 addSubview:buttonFour12Label];
    
    buttonFour13Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 12, length + spaceH, length, buttonLabelFont + 1)];
    buttonFour13Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonFour13Label.text = @"剣道部";
    buttonFour13Label.numberOfLines = 0;
    [buttonFour13Label sizeToFit];
    [scrollView4 addSubview:buttonFour13Label];
    
    
    
    
    //ステージ
    Stage = [[UIButton alloc]initWithFrame:CGRectMake(92.5, 944, 135, 90)];
    [Stage setImage:[UIImage imageNamed:@"Stage-icon.png"] forState:UIControlStateNormal];
    [Stage addTarget:self action:@selector(viewAll5:) forControlEvents:UIControlEventTouchUpInside];
    [mainScrollView addSubview:Stage];
    
    viewAllButton5 = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - 60, 944, 60, 90)];
    [viewAllButton5 setImage:[UIImage imageNamed:@"Right-to-List"] forState:UIControlStateNormal];
    viewAllButton5.contentMode = UIViewContentModeCenter;
    [viewAllButton5 addTarget:self action:@selector(viewAll5:) forControlEvents:UIControlEventTouchUpInside];
    [mainScrollView addSubview:viewAllButton5];
    
    scrollView5 = [[UIScrollView alloc]init];
    scrollView5.frame = CGRectMake(0, 1034, self.view.bounds.size.width, length + spaceH + buttonLabelFont + 33);
    scrollView5.showsHorizontalScrollIndicator = NO;
    scrollView5.userInteractionEnabled = YES;
    scrollView5.bounces = YES;
    [scrollView5 setContentSize:CGSizeMake(spaceLeft + (spaceW + length) * 11, length + spaceH + buttonLabelFont + 1)];
    [scrollView5 setContentOffset:CGPointMake(contentOffsetX5, 0.0) animated:NO];
    scrollView5.backgroundColor=[UIColor clearColor];
    [mainScrollView addSubview:scrollView5];
    
    buttonFive1= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 0, 0, length, length)];
    [buttonFive1 setImage:[UIImage imageNamed:@"フォークダンス.png"] forState:UIControlStateNormal];
    [buttonFive1 addTarget:self
                    action:@selector(buttonFive1Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView5 addSubview:buttonFive1];
    
    buttonFive2= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 1, 0, length, length)];
    [buttonFive2 setImage:[UIImage imageNamed:@"春夜祭.png"] forState:UIControlStateNormal];
    [buttonFive2 addTarget:self
                    action:@selector(buttonFive2Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView5 addSubview:buttonFive2];
    
    buttonFive3= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 2, 0, length, length)];
    [buttonFive3 setImage:[UIImage imageNamed:@"Mr.聖光.png"] forState:UIControlStateNormal];
    [buttonFive3 addTarget:self
                    action:@selector(buttonFive3Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView5 addSubview:buttonFive3];
    
    buttonFive4= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 3, 0, length, length)];
    [buttonFive4 setImage:[UIImage imageNamed:@"Seiko-Dance-Performance.png"] forState:UIControlStateNormal];
    [buttonFive4 addTarget:self
                    action:@selector(buttonFive4Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView5 addSubview:buttonFive4];
    
    buttonFive5= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 4, 0, length, length)];
    [buttonFive5 setImage:[UIImage imageNamed:@"のど自慢.png"] forState:UIControlStateNormal];
    [buttonFive5 addTarget:self
                    action:@selector(buttonFive5Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView5 addSubview:buttonFive5];
    
    buttonFive6= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 5, 0, length, length)];
    [buttonFive6 setImage:[UIImage imageNamed:@"ギネスに挑戦！！.png"] forState:UIControlStateNormal];
    [buttonFive6 addTarget:self
                    action:@selector(buttonFive6Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView5 addSubview:buttonFive6];
    
    buttonFive7= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 6, 0, length, length)];
    [buttonFive7 setImage:[UIImage imageNamed:@"コミュ力の窓.png"] forState:UIControlStateNormal];
    [buttonFive7 addTarget:self
                    action:@selector(buttonFive7Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView5 addSubview:buttonFive7];
    
    buttonFive8= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 7, 0, length, length)];
    [buttonFive8 setImage:[UIImage imageNamed:@"The 笑-1 GP.png"] forState:UIControlStateNormal];
    [buttonFive8 addTarget:self
                    action:@selector(buttonFive8Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView5 addSubview:buttonFive8];
    
    buttonFive9= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 8, 0, length, length)];
    [buttonFive9 setImage:[UIImage imageNamed:@"替え歌選手権.png"] forState:UIControlStateNormal];
    [buttonFive9 addTarget:self
                    action:@selector(buttonFive9Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView5 addSubview:buttonFive9];
    
    buttonFive10= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 9, 0, length, length)];
    [buttonFive10 setImage:[UIImage imageNamed:@"○○男子No.1決定戦.png"] forState:UIControlStateNormal];
    [buttonFive10 addTarget:self
                    action:@selector(buttonFive10Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView5 addSubview:buttonFive10];
    
    buttonFive11= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 10, 0, length, length)];
    [buttonFive11 setImage:[UIImage imageNamed:@"S-O-S.png"] forState:UIControlStateNormal];
    [buttonFive11 addTarget:self
                     action:@selector(buttonFive11Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView5 addSubview:buttonFive11];
    
    buttonFive1Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 0, length + spaceH, length, buttonLabelFont + 1)];
    buttonFive1Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonFive1Label.text = @"フォークダンス";
    buttonFive1Label.numberOfLines = 0;
    [buttonFive1Label sizeToFit];
    [scrollView5 addSubview:buttonFive1Label];
    
    buttonFive2Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 1, length + spaceH, length, buttonLabelFont + 1)];
    buttonFive2Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonFive2Label.text = @"春夜祭";
    buttonFive2Label.numberOfLines = 0;
    [buttonFive2Label sizeToFit];
    [scrollView5 addSubview:buttonFive2Label];
    
    buttonFive3Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 2, length + spaceH, length, buttonLabelFont + 1)];
    buttonFive3Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonFive3Label.text = @"Mr.聖光";
    buttonFive3Label.numberOfLines = 0;
    [buttonFive3Label sizeToFit];
    [scrollView5 addSubview:buttonFive3Label];
    
    buttonFive4Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 3, length + spaceH, length, buttonLabelFont + 1)];
    buttonFive4Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonFive4Label.text = @"Seiko Dance Performance";
    buttonFive4Label.numberOfLines = 0;
    [buttonFive4Label sizeToFit];
    [scrollView5 addSubview:buttonFive4Label];
    
    buttonFive5Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 4, length + spaceH, length, buttonLabelFont + 1)];
    buttonFive5Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonFive5Label.text = @"のど自慢";
    buttonFive5Label.numberOfLines = 0;
    [buttonFive5Label sizeToFit];
    [scrollView5 addSubview:buttonFive5Label];
    
    buttonFive6Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 5, length + spaceH, length, buttonLabelFont + 1)];
    buttonFive6Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonFive6Label.text = @"ギネスに挑戦！！";
    buttonFive6Label.numberOfLines = 0;
    [buttonFive6Label sizeToFit];
    [scrollView5 addSubview:buttonFive6Label];
    
    buttonFive7Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 6, length + spaceH, length, buttonLabelFont + 1)];
    buttonFive7Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonFive7Label.text = @"コミュ力の窓";
    buttonFive7Label.numberOfLines = 0;
    [buttonFive7Label sizeToFit];
    [scrollView5 addSubview:buttonFive7Label];
    
    buttonFive8Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 7, length + spaceH, length, buttonLabelFont + 1)];
    buttonFive8Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonFive8Label.text = @"The 笑-1 GP";
    buttonFive8Label.numberOfLines = 0;
    [buttonFive8Label sizeToFit];
    [scrollView5 addSubview:buttonFive8Label];
    
    buttonFive9Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 8, length + spaceH, length, buttonLabelFont + 1)];
    buttonFive9Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonFive9Label.text = @"替え歌選手権";
    buttonFive9Label.numberOfLines = 0;
    [buttonFive9Label sizeToFit];
    [scrollView5 addSubview:buttonFive9Label];
    
    buttonFive10Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 9, length + spaceH, length, buttonLabelFont + 1)];
    buttonFive10Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonFive10Label.text = @"○○男子No.1決定戦";
    buttonFive10Label.numberOfLines = 0;
    [buttonFive10Label sizeToFit];
    [scrollView5 addSubview:buttonFive10Label];
    
    buttonFive11Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 10, length + spaceH, length, buttonLabelFont + 1)];
    buttonFive11Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonFive11Label.text = @"S.O.S";
    buttonFive11Label.numberOfLines = 0;
    [buttonFive11Label sizeToFit];
    [scrollView5 addSubview:buttonFive11Label];
    
    [self.view addSubview:mainScrollView];
    
    //CGRectMake(spaceLeft, 50 + length + spaceH + buttonLabelFont + 32, self.view.bounds.size.width - 15, 0.5)
    
}

-(void)viewDidDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    contentOffsetY = mainScrollView.contentOffset.y;
    contentOffsetX1 = scrollView1.contentOffset.x;
    contentOffsetX2 = scrollView2.contentOffset.x;
    contentOffsetX3 = scrollView3.contentOffset.x;
    contentOffsetX4 = scrollView4.contentOffset.x;
    contentOffsetX5 = scrollView5.contentOffset.x;
    
    [mainScrollView removeFromSuperview];
    
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
        
        featuredImageButton.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width * 0.4);
        
    }completion:^(BOOL finished){
        
        [self performSelector:@selector(featuredImageOut) withObject:nil afterDelay:2.0];
        
    }];
    
    imageNumber = imageNumber + 2;

}

-(void)featuredImageOut{
    
    UIViewAnimationOptions animeOptions = UIViewAnimationOptionCurveLinear;
    
    [UIView animateWithDuration:0.5 delay:0.0 options:animeOptions animations:^{
        
        featuredImageButton.frame = CGRectMake(-self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.width * 0.4);
        
    }completion:^(BOOL finished){
    }];
    
    [self featuredImage2In];
    [self performSelector:@selector(featuredImageReady) withObject:nil afterDelay:0.6];
    
}

-(void)featuredImageReady{
    
    featuredImageButton.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.width * 0.4);
    
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
        
        featuredImageButton2.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width * 0.4);
        
    }completion:^(BOOL finished){
        
        [self performSelector:@selector(featuredImage2Out) withObject:nil afterDelay:2.0];
        
    }];
    
    imageNumber2 = imageNumber2 + 2;
    
}

-(void)featuredImage2Out{
    
    UIViewAnimationOptions animeOptions = UIViewAnimationOptionCurveLinear;
    
    [UIView animateWithDuration:0.5 delay:0.0 options:animeOptions animations:^{
        
        featuredImageButton2.frame = CGRectMake(- self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.width * 0.4);
        
    }completion:^(BOOL finished){
    }];
    
    [self featuredImageIn];
    [self performSelector:@selector(featuredImage2Ready) withObject:nil afterDelay:0.6];
    
}

-(void)featuredImage2Ready{
    
    featuredImageButton2.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.width * 0.4);
    
}

-(void)featuredDetail:(UIButton *)button{
    
    if (featuredImageButton.tag == 0) {
        flag = 2;
        whichList = @"band";
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
        whichList = @"band";
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

-(void)buttonOne7Detail:(UIButton *)button{
    whichList = @"food";
    flag = 7;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonOne8Detail:(UIButton *)button{
    whichList = @"food";
    flag = 8;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonOne9Detail:(UIButton *)button{
    whichList = @"food";
    flag = 9;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonOne10Detail:(UIButton *)button{
    whichList = @"food";
    flag = 10;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonOne11Detail:(UIButton *)button{
    whichList = @"food";
    flag = 11;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonOne12Detail:(UIButton *)button{
    whichList = @"food";
    flag = 12;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonOne13Detail:(UIButton *)button{
    whichList = @"food";
    flag = 13;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonOne14Detail:(UIButton *)button{
    whichList = @"food";
    flag = 14;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}


//趣味研
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

-(void)buttonTwo6Detail:(UIButton *)button{
    whichList = @"display";
    flag = 6;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo7Detail:(UIButton *)button{
    whichList = @"display";
    flag = 7;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo8Detail:(UIButton *)button{
    whichList = @"display";
    flag = 8;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo9Detail:(UIButton *)button{
    whichList = @"display";
    flag = 9;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo10Detail:(UIButton *)button{
    whichList = @"display";
    flag = 10;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo11Detail:(UIButton *)button{
    whichList = @"display";
    flag = 11;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo12Detail:(UIButton *)button{
    whichList = @"display";
    flag = 12;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo13Detail:(UIButton *)button{
    whichList = @"display";
    flag = 13;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo14Detail:(UIButton *)button{
    whichList = @"display";
    flag = 14;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo15Detail:(UIButton *)button{
    whichList = @"display";
    flag = 15;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo16Detail:(UIButton *)button{
    whichList = @"display";
    flag = 16;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo17Detail:(UIButton *)button{
    whichList = @"display";
    flag = 17;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo18Detail:(UIButton *)button{
    whichList = @"display";
    flag = 18;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo19Detail:(UIButton *)button{
    whichList = @"display";
    flag = 19;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo20Detail:(UIButton *)button{
    whichList = @"display";
    flag = 20;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo21Detail:(UIButton *)button{
    whichList = @"display";
    flag = 21;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo22Detail:(UIButton *)button{
    whichList = @"display";
    flag = 22;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo23Detail:(UIButton *)button{
    whichList = @"display";
    flag = 23;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo24Detail:(UIButton *)button{
    whichList = @"display";
    flag = 24;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo25Detail:(UIButton *)button{
    whichList = @"display";
    flag = 25;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo26Detail:(UIButton *)button{
    whichList = @"display";
    flag = 26;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo27Detail:(UIButton *)button{
    whichList = @"display";
    flag = 27;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo28Detail:(UIButton *)button{
    whichList = @"display";
    flag = 28;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo29Detail:(UIButton *)button{
    whichList = @"display";
    flag = 29;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo30Detail:(UIButton *)button{
    whichList = @"display";
    flag = 30;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo31Detail:(UIButton *)button{
    whichList = @"display";
    flag = 31;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo32Detail:(UIButton *)button{
    whichList = @"display";
    flag = 32;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo33Detail:(UIButton *)button{
    whichList = @"display";
    flag = 33;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo34Detail:(UIButton *)button{
    whichList = @"display";
    flag = 34;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo35Detail:(UIButton *)button{
    whichList = @"display";
    flag = 35;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo36Detail:(UIButton *)button{
    whichList = @"display";
    flag = 36;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo37Detail:(UIButton *)button{
    whichList = @"display";
    flag = 37;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo38Detail:(UIButton *)button{
    whichList = @"display";
    flag = 38;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo39Detail:(UIButton *)button{
    whichList = @"display";
    flag = 39;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo40Detail:(UIButton *)button{
    whichList = @"display";
    flag = 40;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo41Detail:(UIButton *)button{
    whichList = @"display";
    flag = 41;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}


//バンド
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

-(void)buttonThree7Detail:(UIButton *)button{
    whichList = @"band";
    flag = 7;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonThree8Detail:(UIButton *)button{
    whichList = @"band";
    flag = 8;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonThree9Detail:(UIButton *)button{
    whichList = @"band";
    flag = 9;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonThree10Detail:(UIButton *)button{
    whichList = @"band";
    flag = 10;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonThree11Detail:(UIButton *)button{
    whichList = @"band";
    flag = 11;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonThree12Detail:(UIButton *)button{
    whichList = @"band";
    flag = 12;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}


//講堂･小講堂
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

-(void)buttonFour7Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 7;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonFour8Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 8;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonFour9Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 9;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonFour10Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 10;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonFour11Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 11;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonFour12Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 12;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonFour13Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 13;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}


//ステージ
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

-(void)buttonFive7Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 7;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonFive8Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 8;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonFive9Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 9;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonFive10Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 10;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonFive11Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 11;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}


//全て見る
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
