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
    
    organizationFeaturedImages = @[@"Flat Flight バナー1.jpg", @"ボールぽこぽこ バナー.jpg", @"ミュージックサロン バナー.JPG"];
    
    featuredImageButton = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width, 64, self.view.bounds.size.width, self.view.bounds.size.width * 0.4)];
    featuredImageButton2 = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width, 64, self.view.bounds.size.width, self.view.bounds.size.width * 0.4)];
    
    [self featuredImageIn];
    
    self.navigationController.navigationBar.tintColor=[UIColor orangeColor];
    self.tabBarController.tabBar.barTintColor = [UIColor blackColor];
    self.tabBarController.tabBar.tintColor = [UIColor whiteColor];
    
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
        labelFont = 18;
        allButtonFont = 12; 
        buttonLabelFont = 13;
    } else if (r.size.width == 375) {
        //iPhone 6/6s
        spaceLeft = 15;
        length = 94;
        spaceW = 16;
        spaceH = 12;
        labelFont = 18;
        allButtonFont = 12;
        buttonLabelFont = 13;
    } else if (r.size.width == 414) {
        //iPhone 6 plus/6s plus
        spaceLeft = 15;
        length = 94;
        spaceW = 16;
        spaceH = 12;
        labelFont = 18;
        allButtonFont = 12;
        buttonLabelFont = 13;
    }
    
    
    // UIScrollViewのインスタンス化
    mainScrollView = [[UIScrollView alloc]init];
    //CGRectMake(0, 64+バナー, 横, 縦-64-バナー-3-49);
    mainScrollView.frame = CGRectMake(0, 64 + self.view.bounds.size.width * 0.4, self.view.bounds.size.width, self.view.bounds.size.height - self.view.bounds.size.width * 0.4 - 116);
    //横スクロールのインジケータを非表示にする
    mainScrollView.showsHorizontalScrollIndicator = NO;
    
    mainScrollView.userInteractionEnabled = YES;
    mainScrollView.directionalLockEnabled = YES;
    mainScrollView.bounces = YES;
    mainScrollView.backgroundColor = [UIColor clearColor];
    //スクロールの範囲を設定
    [mainScrollView setContentSize:CGSizeMake(self.view.bounds.size.width, (length + spaceH + buttonLabelFont + 82) * 5)];
    
    
    foodLabel = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + buttonLabelFont + 84) * 0, 45, labelFont + 4)];
    foodLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:labelFont];
    foodLabel.text = @"Food";
    [mainScrollView addSubview:foodLabel];
    
    viewAllButton1 = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - 80, 19 + (length + spaceH + buttonLabelFont + 82) * 0, 64, allButtonFont)];
    [viewAllButton1 setTitle:@"すべて見る" forState:UIControlStateNormal];
    viewAllButton1.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:allButtonFont];
    [viewAllButton1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [viewAllButton1 addTarget:self action:@selector(viewAll1:) forControlEvents:UIControlEventTouchUpInside];
    [mainScrollView addSubview:viewAllButton1];
    
    scrollView1 = [[UIScrollView alloc]init];
    scrollView1.frame = CGRectMake(0, 50 + (length + spaceH + buttonLabelFont + 82) * 0, self.view.bounds.size.width, length + spaceH + buttonLabelFont + 33);
    scrollView1.showsHorizontalScrollIndicator = NO;
    scrollView1.userInteractionEnabled = YES;
    scrollView1.bounces = YES;
    [scrollView1 setContentSize:CGSizeMake(spaceLeft + (spaceW + length) * 14, length + spaceH + buttonLabelFont + 1)];
    scrollView1.backgroundColor=[UIColor clearColor];
    [mainScrollView addSubview:scrollView1];
    
    buttonOne1= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 0, 0, length, length)];
    [buttonOne1 setImage:[UIImage imageNamed:@"鉄板職人.jpg"] forState:UIControlStateNormal];
    [buttonOne1 addTarget:self
                   action:@selector(buttonOne1Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView1 addSubview:buttonOne1];
    
    buttonOne2= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 1, 0, length, length)];
    [buttonOne2 setImage:[UIImage imageNamed:@"塩焼きそば　麺’sRUNRUN.png"] forState:UIControlStateNormal];
    [buttonOne2 addTarget:self
                   action:@selector(buttonOne2Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView1 addSubview:buttonOne2];
    
    buttonOne3= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 2, 0, length, length)];
    [buttonOne3 setImage:[UIImage imageNamed:@"麺☆恋.png"] forState:UIControlStateNormal];
    [buttonOne3 addTarget:self
                   action:@selector(buttonOne3Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView1 addSubview:buttonOne3];
    
    buttonOne4= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 3, 0, length, length)];
    [buttonOne4 setImage:[UIImage imageNamed:@"俺のケバブ.jpg"] forState:UIControlStateNormal];
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
    
    
    
    
    displayLabel = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + buttonLabelFont + 84) * 1, 60, labelFont + 4)];
    displayLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:labelFont];
    displayLabel.text = @"Display";
    [mainScrollView addSubview:displayLabel];
    
    viewAllButton2 = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - 80, 19 + (length + spaceH + buttonLabelFont + 82) * 1, 64, allButtonFont)];
    [viewAllButton2 setTitle:@"すべて見る" forState:UIControlStateNormal];
    viewAllButton2.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:allButtonFont];
    [viewAllButton2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [viewAllButton2 addTarget:self action:@selector(viewAll2:) forControlEvents:UIControlEventTouchUpInside];
    [mainScrollView addSubview:viewAllButton2];
    
    scrollView2 = [[UIScrollView alloc]init];
    scrollView2.frame = CGRectMake(0, 50 + (length + spaceH + buttonLabelFont + 82) * 1, self.view.bounds.size.width, length + spaceH + buttonLabelFont + 33);
    scrollView2.showsHorizontalScrollIndicator = NO;
    scrollView2.userInteractionEnabled = YES;
    scrollView2.bounces = YES;
    [scrollView2 setContentSize:CGSizeMake(spaceLeft + (spaceW + length) * 5, length + spaceH + buttonLabelFont + 1)];
    scrollView2.backgroundColor=[UIColor clearColor];
    [mainScrollView addSubview:scrollView2];
    
    buttonTwo1= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 0, 0, length, length)];
    [buttonTwo1 setImage:[UIImage imageNamed:@"英語劇.png"] forState:UIControlStateNormal];
    [buttonTwo1 addTarget:self
                   action:@selector(buttonTwo1Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo1];
    
    buttonTwo2= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 1, 0, length, length)];
    [buttonTwo2 setImage:[UIImage imageNamed:@"高3英語劇.png"] forState:UIControlStateNormal];
    [buttonTwo2 addTarget:self
                   action:@selector(buttonTwo2Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo2];
    
    buttonTwo3= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 2, 0, length, length)];
    [buttonTwo3 setImage:[UIImage imageNamed:@"迷いの国のアリス.png"] forState:UIControlStateNormal];
    [buttonTwo3 addTarget:self
                   action:@selector(buttonTwo3Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo3];
    
    buttonTwo4= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 3, 0, length, length)];
    [buttonTwo4 setImage:[UIImage imageNamed:@"Trick×Hark.jpg"] forState:UIControlStateNormal];
    [buttonTwo4 addTarget:self
                   action:@selector(buttonTwo4Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo4];
    
    buttonTwo5= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 4, 0, length, length)];
    [buttonTwo5 setImage:[UIImage imageNamed:@"インターアクト.png"] forState:UIControlStateNormal];
    [buttonTwo5 addTarget:self
                   action:@selector(buttonTwo5Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo5];
    
    buttonTwo1Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 0, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo1Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo1Label.text = @"英語劇";
    buttonTwo1Label.numberOfLines = 0;
    [buttonTwo1Label sizeToFit];
    [scrollView2 addSubview:buttonTwo1Label];
    
    buttonTwo2Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 1, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo2Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo2Label.text = @"高3英語劇";
    buttonTwo2Label.numberOfLines = 0;
    [buttonTwo2Label sizeToFit];
    [scrollView2 addSubview:buttonTwo2Label];
    
    buttonTwo3Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 2, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo3Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo3Label.text = @"迷いの国のアリス";
    buttonTwo3Label.numberOfLines = 0;
    [buttonTwo3Label sizeToFit];
    [scrollView2 addSubview:buttonTwo3Label];
    
    buttonTwo4Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 3, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo4Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo4Label.text = @"Trick×Hark";
    buttonTwo4Label.numberOfLines = 0;
    [buttonTwo4Label sizeToFit];
    [scrollView2 addSubview:buttonTwo4Label];
    
    buttonTwo5Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 4, length + spaceH, length, buttonLabelFont + 1)];
    buttonTwo5Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonTwo5Label.text = @"インターアクトクラブ";
    buttonTwo5Label.numberOfLines = 0;
    [buttonTwo5Label sizeToFit];
    [scrollView2 addSubview:buttonTwo5Label];
    
    
    bandLabel = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + buttonLabelFont + 84) * 2, 60, labelFont + 4)];
    bandLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:labelFont];
    bandLabel.text = @"Band";
    [mainScrollView addSubview:bandLabel];
    
    viewAllBUtton3 = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - 80, 19 + (length + spaceH + buttonLabelFont + 82) * 2, 64, allButtonFont)];
    [viewAllBUtton3 setTitle:@"すべて見る" forState:UIControlStateNormal];
    viewAllBUtton3.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:allButtonFont];
    [viewAllBUtton3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [viewAllBUtton3 addTarget:self action:@selector(viewAll3:) forControlEvents:UIControlEventTouchUpInside];
    [mainScrollView addSubview:viewAllBUtton3];
    
    scrollView3 = [[UIScrollView alloc]init];
    scrollView3.frame = CGRectMake(0, 50 + (length + spaceH + buttonLabelFont + 82) * 2, self.view.bounds.size.width, length + spaceH + buttonLabelFont + 33);
    scrollView3.showsHorizontalScrollIndicator = NO;
    scrollView3.userInteractionEnabled = YES;
    scrollView3.bounces = YES;
    [scrollView3 setContentSize:CGSizeMake(spaceLeft + (spaceW + length) * 12, length + spaceH + buttonLabelFont + 1)];
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
    [buttonThree9 setImage:[UIImage imageNamed:@"Coming-Soon.jpg"] forState:UIControlStateNormal];
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
    buttonThree2Label.text = @"Flat-Flight";
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
    buttonThree6Label.text = @"Яooz-Leef";
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
    
    
    
    performanceLabel = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + buttonLabelFont + 84) * 3, 100, labelFont + 4)];
    performanceLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:labelFont];
    performanceLabel.text = @"Performace";
    [mainScrollView addSubview:performanceLabel];
    
    viewAllButton4 = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - 80, 19 + (length + spaceH + buttonLabelFont + 82) * 3, 64, allButtonFont)];
    [viewAllButton4 setTitle:@"すべて見る" forState:UIControlStateNormal];
    viewAllButton4.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:allButtonFont];
    [viewAllButton4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [viewAllButton4 addTarget:self action:@selector(viewAll4:) forControlEvents:UIControlEventTouchUpInside];
    [mainScrollView addSubview:viewAllButton4];
    
    scrollView4 = [[UIScrollView alloc]init];
    scrollView4.frame = CGRectMake(0, 50 + (length + spaceH + buttonLabelFont + 82) * 3, self.view.bounds.size.width, length + spaceH + buttonLabelFont + 33);
    scrollView4.showsHorizontalScrollIndicator = NO;
    scrollView4.userInteractionEnabled = YES;
    scrollView4.bounces = YES;
    [scrollView4 setContentSize:CGSizeMake(spaceLeft + (spaceW + length) * 6, length + spaceH + buttonLabelFont + 1)];
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
    [buttonFour4 setImage:[UIImage imageNamed:@"校長対談.png"] forState:UIControlStateNormal];
    [buttonFour4 addTarget:self
                    action:@selector(buttonFour4Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView4 addSubview:buttonFour4];
    
    buttonFour5= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 4, 0, length, length)];
    [buttonFour5 setImage:[UIImage imageNamed:@"ミュージックサロン.png"] forState:UIControlStateNormal];
    [buttonFour5 addTarget:self
                    action:@selector(buttonFour5Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView4 addSubview:buttonFour5];
    
    buttonFour6= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 5, 0, length, length)];
    [buttonFour6 setImage:[UIImage imageNamed:@"グリークラブ.png"] forState:UIControlStateNormal];
    [buttonFour6 addTarget:self
                    action:@selector(buttonFour6Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView4 addSubview:buttonFour6];
    
    buttonFour1Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 0, length + spaceH, length, buttonLabelFont + 1)];
    buttonFour1Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonFour1Label.text = @"Grand-Finale";
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
    buttonFour4Label.text = @"校長対談";
    buttonFour4Label.numberOfLines = 0;
    [buttonFour4Label sizeToFit];
    [scrollView4 addSubview:buttonFour4Label];
    
    buttonFour5Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 4, length + spaceH, length, buttonLabelFont + 1)];
    buttonFour5Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonFour5Label.text = @"ミュージックサロン";
    buttonFour5Label.numberOfLines = 0;
    [buttonFour5Label sizeToFit];
    [scrollView4 addSubview:buttonFour5Label];
    
    buttonFour6Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 5, length + spaceH, length, buttonLabelFont + 1)];
    buttonFour6Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonFour6Label.text = @"グリークラブ";
    buttonFour6Label.numberOfLines = 0;
    [buttonFour6Label sizeToFit];
    [scrollView4 addSubview:buttonFour6Label];
    
    
    
    stageLabel = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + buttonLabelFont + 84) * 4, 50, labelFont + 4)];
    stageLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:labelFont];
    stageLabel.text = @"Stage";
    [mainScrollView addSubview:stageLabel];
    
    viewAllButton5 = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - 80, 19 + (length + spaceH + buttonLabelFont + 82) * 4, 64, allButtonFont)];
    [viewAllButton5 setTitle:@"すべて見る" forState:UIControlStateNormal];
    viewAllButton5.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:allButtonFont];
    [viewAllButton5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [viewAllButton5 addTarget:self action:@selector(viewAll5:) forControlEvents:UIControlEventTouchUpInside];
    [mainScrollView addSubview:viewAllButton5];
    
    scrollView5 = [[UIScrollView alloc]init];
    scrollView5.frame = CGRectMake(0, 50 + (length + spaceH + buttonLabelFont + 82) * 4, self.view.bounds.size.width, length + spaceH + buttonLabelFont + 33);
    scrollView5.showsHorizontalScrollIndicator = NO;
    scrollView5.userInteractionEnabled = YES;
    scrollView5.bounces = YES;
    [scrollView5 setContentSize:CGSizeMake(spaceLeft + (spaceW + length) * 6, length + spaceH + buttonLabelFont + 1)];
    scrollView5.backgroundColor=[UIColor clearColor];
    [mainScrollView addSubview:scrollView5];
    
    buttonFive1= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 0, 0, length, length)];
    [buttonFive1 setImage:[UIImage imageNamed:@"春夜祭.png"] forState:UIControlStateNormal];
    [buttonFive1 addTarget:self
                    action:@selector(buttonFive1Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView5 addSubview:buttonFive1];
    
    buttonFive2= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 1, 0, length, length)];
    [buttonFive2 setImage:[UIImage imageNamed:@"フォークダンス.png"] forState:UIControlStateNormal];
    [buttonFive2 addTarget:self
                    action:@selector(buttonFive2Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView5 addSubview:buttonFive2];
    
    buttonFive3= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 2, 0, length, length)];
    [buttonFive3 setImage:[UIImage imageNamed:@"○○男子No.1決定戦.png"] forState:UIControlStateNormal];
    [buttonFive3 addTarget:self
                    action:@selector(buttonFive3Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView5 addSubview:buttonFive3];
    
    buttonFive4= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 3, 0, length, length)];
    [buttonFive4 setImage:[UIImage imageNamed:@"Mr.聖光.png"] forState:UIControlStateNormal];
    [buttonFive4 addTarget:self
                    action:@selector(buttonFive4Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView5 addSubview:buttonFive4];
    
    buttonFive5= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 4, 0, length, length)];
    [buttonFive5 setImage:[UIImage imageNamed:@"S-O-S.png"] forState:UIControlStateNormal];
    [buttonFive5 addTarget:self
                    action:@selector(buttonFive5Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView5 addSubview:buttonFive5];
    
    buttonFive6= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 5, 0, length, length)];
    [buttonFive6 setImage:[UIImage imageNamed:@"替え歌選手権.png"] forState:UIControlStateNormal];
    [buttonFive6 addTarget:self
                    action:@selector(buttonFive6Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView5 addSubview:buttonFive6];
    
    buttonFive1Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 0, length + spaceH, length, buttonLabelFont + 1)];
    buttonFive1Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonFive1Label.text = @"春夜祭";
    buttonFive1Label.numberOfLines = 0;
    [buttonFive1Label sizeToFit];
    [scrollView5 addSubview:buttonFive1Label];
    
    buttonFive2Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 1, length + spaceH, length, buttonLabelFont + 1)];
    buttonFive2Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonFive2Label.text = @"フォークダンス";
    buttonFive2Label.numberOfLines = 0;
    [buttonFive2Label sizeToFit];
    [scrollView5 addSubview:buttonFive2Label];
    
    buttonFive3Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 2, length + spaceH, length, buttonLabelFont + 1)];
    buttonFive3Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonFive3Label.text = @"○○男子No.1決定戦";
    buttonFive3Label.numberOfLines = 0;
    [buttonFive3Label sizeToFit];
    [scrollView5 addSubview:buttonFive3Label];
    
    buttonFive4Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 3, length + spaceH, length, buttonLabelFont + 1)];
    buttonFive4Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonFive4Label.text = @"Mr.聖光";
    buttonFive4Label.numberOfLines = 0;
    [buttonFive4Label sizeToFit];
    [scrollView5 addSubview:buttonFive4Label];
    
    buttonFive5Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 4, length + spaceH, length, buttonLabelFont + 1)];
    buttonFive5Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonFive5Label.text = @"S-O-S";
    buttonFive5Label.numberOfLines = 0;
    [buttonFive5Label sizeToFit];
    [scrollView5 addSubview:buttonFive5Label];
    
    buttonFive6Label = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + (spaceW + length) * 5, length + spaceH, length, buttonLabelFont + 1)];
    buttonFive6Label.font = [UIFont fontWithName:@"HelveticaNeue" size:buttonLabelFont];
    buttonFive6Label.text = @"替え歌選手権";
    buttonFive6Label.numberOfLines = 0;
    [buttonFive6Label sizeToFit];
    [scrollView5 addSubview:buttonFive6Label];
    
    [self.view addSubview:mainScrollView];
    
    //CGRectMake(spaceLeft, 50 + length + spaceH + buttonLabelFont + 32, self.view.bounds.size.width - 15, 0.5)
    UIView *horizontal1 = [[UIView alloc] initWithFrame:CGRectMake(spaceLeft, (length + spaceH + buttonLabelFont + 82) * 1, self.view.bounds.size.width - 15, 0.5)];
    horizontal1.backgroundColor = [UIColor colorWithRed:140.0/255.0 green:140.0/255.0 blue:140.0/255.0 alpha:1.0];
    [mainScrollView addSubview:horizontal1];
    
    UIView *horizontal2 = [[UIView alloc] initWithFrame:CGRectMake(spaceLeft, (length + spaceH + buttonLabelFont + 82) * 2, self.view.bounds.size.width - 15, 0.5)];
    horizontal2.backgroundColor = [UIColor colorWithRed:140.0/255.0 green:140.0/255.0 blue:140.0/255.0 alpha:1.0];
    [mainScrollView addSubview:horizontal2];
    
    UIView *horizontal3 = [[UIView alloc] initWithFrame:CGRectMake(spaceLeft, (length + spaceH + buttonLabelFont + 82) * 3, self.view.bounds.size.width - 15, 0.5)];
    horizontal3.backgroundColor = [UIColor colorWithRed:140.0/255.0 green:140.0/255.0 blue:140.0/255.0 alpha:1.0];
    [mainScrollView addSubview:horizontal3];
    
    UIView *horizontal4 = [[UIView alloc] initWithFrame:CGRectMake(spaceLeft, (length + spaceH + buttonLabelFont + 82) * 4, self.view.bounds.size.width - 15, 0.5)];
    horizontal4.backgroundColor = [UIColor colorWithRed:140.0/255.0 green:140.0/255.0 blue:140.0/255.0 alpha:1.0];
    [mainScrollView addSubview:horizontal4];
    
    UIView *horizontal5= [[UIView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 52, self.view.bounds.size.width, 3)];
    horizontal5.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:horizontal5];
    
}

-(void)viewDidDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    [mainScrollView setHidden:YES];
    
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
        
        featuredImageButton.frame = CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.width * 0.4);
        
    }completion:^(BOOL finished){
        
        [self performSelector:@selector(featuredImageOut) withObject:nil afterDelay:2.0];
        
    }];
    
    imageNumber = imageNumber + 2;

}

-(void)featuredImageOut{
    
    UIViewAnimationOptions animeOptions = UIViewAnimationOptionCurveLinear;
    
    [UIView animateWithDuration:0.5 delay:0.0 options:animeOptions animations:^{
        
        featuredImageButton.frame = CGRectMake(-self.view.bounds.size.width, 64, self.view.bounds.size.width, self.view.bounds.size.width * 0.4);
        
    }completion:^(BOOL finished){
    }];
    
    [self featuredImage2In];
    [self performSelector:@selector(featuredImageReady) withObject:nil afterDelay:0.6];
    
}

-(void)featuredImageReady{
    
    featuredImageButton.frame = CGRectMake(self.view.bounds.size.width, 64, self.view.bounds.size.width, self.view.bounds.size.width * 0.4);
    
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
        
        featuredImageButton2.frame = CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.width * 0.4);
        
    }completion:^(BOOL finished){
        
        [self performSelector:@selector(featuredImage2Out) withObject:nil afterDelay:2.0];
        
    }];
    
    imageNumber2 = imageNumber2 + 2;
    
}

-(void)featuredImage2Out{
    
    UIViewAnimationOptions animeOptions = UIViewAnimationOptionCurveLinear;
    
    [UIView animateWithDuration:0.5 delay:0.0 options:animeOptions animations:^{
        
        featuredImageButton2.frame = CGRectMake(- self.view.bounds.size.width, 64, self.view.bounds.size.width, self.view.bounds.size.width * 0.4);
        
    }completion:^(BOOL finished){
    }];
    
    [self featuredImageIn];
    [self performSelector:@selector(featuredImage2Ready) withObject:nil afterDelay:0.6];
    
}

-(void)featuredImage2Ready{
    
    featuredImageButton2.frame = CGRectMake(self.view.bounds.size.width, 64, self.view.bounds.size.width, self.view.bounds.size.width * 0.4);
    
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
