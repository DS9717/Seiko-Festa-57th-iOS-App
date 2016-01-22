//
//  ViewController.m
//  Seiko Festa 57th
//
//  Created by Daisuke  on 2016/01/15.
//  Copyright (c) 2016年 Daisuke Masuda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    imageNumber = 0;
    imageNumber2 = 1;
    
    organizationFeaturedImages = @[@"英語劇.png", @"ダンス.png", @"アプリ局.png"];
    
    featuredImageButton = [[UIButton alloc]initWithFrame:CGRectMake(320, 64, 320, 130)];
    featuredImageButton2 = [[UIButton alloc]initWithFrame:CGRectMake(320, 64, 320, 130)];
    
    [self featuredImageIn];
    
    // UIScrollViewのインスタンス化
    mainScrollView = [[UIScrollView alloc]init];
    mainScrollView.frame = CGRectMake(0, 194, self.view.bounds.size.width, self.view.bounds.size.height-243);
    //横スクロールのインジケータを非表示にする
    mainScrollView.showsHorizontalScrollIndicator = NO;
    //デリゲートを有効にする
    mainScrollView.delegate = self;
    mainScrollView.userInteractionEnabled = YES;
    mainScrollView.directionalLockEnabled = YES;
    mainScrollView.bounces = YES;
    mainScrollView.backgroundColor = [UIColor clearColor];
     //スクロールの範囲を設定
    [mainScrollView setContentSize:CGSizeMake(self.view.bounds.size.width, 780)];
    
    
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
    scrollView1.frame = CGRectMake(0, 50, self.view.bounds.size.width, 106);
    scrollView1.showsHorizontalScrollIndicator = NO;
    scrollView1.userInteractionEnabled = YES;
    scrollView1.delegate = self;
    scrollView1.bounces = YES;
    [scrollView1 setContentSize:CGSizeMake(462, 106)];
    scrollView1.backgroundColor=[UIColor clearColor];
    [mainScrollView addSubview:scrollView1];
    
    buttonOne1= [[UIButton alloc]initWithFrame:CGRectMake(16, 0, 70, 70)];
    [buttonOne1 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
    [buttonOne1 addTarget:self
                action:@selector(buttonOne1Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView1 addSubview:buttonOne1];
    
    buttonOne2= [[UIButton alloc]initWithFrame:CGRectMake(106, 0, 70, 70)];
    [buttonOne2 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
    [buttonOne2 addTarget:self
                   action:@selector(buttonOne2Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView1 addSubview:buttonOne2];
    
    buttonOne3= [[UIButton alloc]initWithFrame:CGRectMake(196, 0, 70, 70)];
    [buttonOne3 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
    [buttonOne3 addTarget:self
                   action:@selector(buttonOne3Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView1 addSubview:buttonOne3];
    
    buttonOne4= [[UIButton alloc]initWithFrame:CGRectMake(286, 0, 70, 70)];
    [buttonOne4 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
    [buttonOne4 addTarget:self
                   action:@selector(buttonOne4Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView1 addSubview:buttonOne4];
    
    buttonOne5= [[UIButton alloc]initWithFrame:CGRectMake(376, 0, 70, 70)];
    [buttonOne5 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
    [buttonOne5 addTarget:self
                    action:@selector(buttonOne5Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView1 addSubview:buttonOne5];
    
    
    buttonOne1Label = [[UILabel alloc]initWithFrame:CGRectMake(16, 78, 70, 14)];
    buttonOne1Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonOne1Label.text = @"お好み焼き";
    buttonOne1Label.textAlignment = NSTextAlignmentCenter;
    [scrollView1 addSubview:buttonOne1Label];
    
    buttonOne2Label = [[UILabel alloc]initWithFrame:CGRectMake(106, 78, 70, 14)];
    buttonOne2Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonOne2Label.text = @"お好み焼き";
    buttonOne2Label.textAlignment = NSTextAlignmentCenter;
    [scrollView1 addSubview:buttonOne2Label];
    
    buttonOne3Label = [[UILabel alloc]initWithFrame:CGRectMake(196, 78, 70, 14)];
    buttonOne3Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonOne3Label.text = @"お好み焼き";
    buttonOne3Label.textAlignment = NSTextAlignmentCenter;
    [scrollView1 addSubview:buttonOne3Label];
    
    buttonOne4Label = [[UILabel alloc]initWithFrame:CGRectMake(286, 78, 70, 14)];
    buttonOne4Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonOne4Label.text = @"お好み焼き";
    buttonOne4Label.textAlignment = NSTextAlignmentCenter;
    [scrollView1 addSubview:buttonOne4Label];
    
    buttonOne5Label = [[UILabel alloc]initWithFrame:CGRectMake(376, 78, 70, 14)];
    buttonOne5Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonOne5Label.text = @"お好み焼き";
    buttonOne5Label.textAlignment = NSTextAlignmentCenter;
    [scrollView1 addSubview:buttonOne5Label];
    
    
    displayLabel = [[UILabel alloc]initWithFrame:CGRectMake(16,172, 60, 22)];
    displayLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:18];
    displayLabel.text = @"Display";
    [mainScrollView addSubview:displayLabel];
    
    scrollView2 = [[UIScrollView alloc]init];
    scrollView2.frame = CGRectMake(0, 206, self.view.bounds.size.width, 106);
    scrollView2.showsHorizontalScrollIndicator = NO;
    scrollView2.userInteractionEnabled = YES;
    scrollView2.delegate = self;
    scrollView2.bounces = YES;
    [scrollView2 setContentSize:CGSizeMake(462, 106)];
    scrollView2.backgroundColor=[UIColor clearColor];
    [mainScrollView addSubview:scrollView2];
    
    buttonTwo1= [[UIButton alloc]initWithFrame:CGRectMake(16, 0, 70, 70)];
    [buttonTwo1 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
    [buttonTwo1 addTarget:self
                   action:@selector(buttonTwo1Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo1];
    
    buttonTwo2= [[UIButton alloc]initWithFrame:CGRectMake(106, 0, 70, 70)];
    [buttonTwo2 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
    [buttonTwo2 addTarget:self
                   action:@selector(buttonTwo2Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo2];
    
    buttonTwo3= [[UIButton alloc]initWithFrame:CGRectMake(196, 0, 70, 70)];
    [buttonTwo3 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
    [buttonTwo3 addTarget:self
                     action:@selector(buttonTwo3Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo3];
    
    buttonTwo4= [[UIButton alloc]initWithFrame:CGRectMake(286, 0, 70, 70)];
    [buttonTwo4 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
    [buttonTwo4 addTarget:self
                    action:@selector(buttonTwo4Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo4];
    
    buttonTwo5= [[UIButton alloc]initWithFrame:CGRectMake(376, 0, 70, 70)];
    [buttonTwo5 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
    [buttonTwo5 addTarget:self
                    action:@selector(buttonTwo5Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo5];
    
    buttonTwo1Label = [[UILabel alloc]initWithFrame:CGRectMake(16, 78, 70, 14)];
    buttonTwo1Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonTwo1Label.text = @"お好み焼き";
    buttonTwo1Label.textAlignment = NSTextAlignmentCenter;
    [scrollView2 addSubview:buttonTwo1Label];
    
    buttonTwo2Label = [[UILabel alloc]initWithFrame:CGRectMake(106, 78, 70, 14)];
    buttonTwo2Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonTwo2Label.text = @"お好み焼き";
    buttonTwo2Label.textAlignment = NSTextAlignmentCenter;
    [scrollView2 addSubview:buttonTwo2Label];
    
    buttonTwo3Label = [[UILabel alloc]initWithFrame:CGRectMake(196, 78, 70, 14)];
    buttonTwo3Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonTwo3Label.text = @"お好み焼き";
    buttonTwo3Label.textAlignment = NSTextAlignmentCenter;
    [scrollView2 addSubview:buttonTwo3Label];
    
    buttonTwo4Label = [[UILabel alloc]initWithFrame:CGRectMake(286, 78, 70, 14)];
    buttonTwo4Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonTwo4Label.text = @"お好み焼き";
    buttonTwo4Label.textAlignment = NSTextAlignmentCenter;
    [scrollView2 addSubview:buttonTwo4Label];
    
    buttonTwo5Label = [[UILabel alloc]initWithFrame:CGRectMake(376, 78, 70, 14)];
    buttonTwo5Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonTwo5Label.text = @"お好み焼き";
    buttonTwo5Label.textAlignment = NSTextAlignmentCenter;
    [scrollView2 addSubview:buttonTwo5Label];
    
    
    bandLabel = [[UILabel alloc]initWithFrame:CGRectMake(16,328, 60, 22)];
    bandLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:18];
    bandLabel.text = @"Band";
    [mainScrollView addSubview:bandLabel];
    
    scrollView3 = [[UIScrollView alloc]init];
    scrollView3.frame = CGRectMake(0, 362, self.view.bounds.size.width, 106);
    scrollView3.showsHorizontalScrollIndicator = NO;
    scrollView3.userInteractionEnabled = YES;
    scrollView3.delegate = self;
    scrollView3.bounces = YES;
    [scrollView3 setContentSize:CGSizeMake(462, 106)];
    scrollView3.backgroundColor=[UIColor clearColor];
    [mainScrollView addSubview:scrollView3];
    
    buttonThree1= [[UIButton alloc]initWithFrame:CGRectMake(16, 0, 70, 70)];
    [buttonThree1 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
    [buttonThree1 addTarget:self
                   action:@selector(buttonThree1Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView3 addSubview:buttonThree1];
    
    buttonThree2= [[UIButton alloc]initWithFrame:CGRectMake(106, 0, 70, 70)];
    [buttonThree2 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
    [buttonThree2 addTarget:self
                   action:@selector(buttonThree2Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView3 addSubview:buttonThree2];
    
    buttonThree3= [[UIButton alloc]initWithFrame:CGRectMake(196, 0, 70, 70)];
    [buttonThree3 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
    [buttonThree3 addTarget:self
                   action:@selector(buttonThree3Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView3 addSubview:buttonThree3];
    
    buttonThree4= [[UIButton alloc]initWithFrame:CGRectMake(286, 0, 70, 70)];
    [buttonThree4 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
    [buttonThree4 addTarget:self
                   action:@selector(buttonThree4Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView3 addSubview:buttonThree4];
    
    buttonThree5= [[UIButton alloc]initWithFrame:CGRectMake(376, 0, 70, 70)];
    [buttonThree5 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
    [buttonThree5 addTarget:self
                   action:@selector(buttonThree5Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView3 addSubview:buttonThree5];
    
    buttonThree1Label = [[UILabel alloc]initWithFrame:CGRectMake(16, 78, 70, 14)];
    buttonThree1Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonThree1Label.text = @"お好み焼き";
    buttonThree1Label.textAlignment = NSTextAlignmentCenter;
    [scrollView3 addSubview:buttonThree1Label];
    
    buttonThree2Label = [[UILabel alloc]initWithFrame:CGRectMake(106, 78, 70, 14)];
    buttonThree2Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonThree2Label.text = @"お好み焼き";
    buttonThree2Label.textAlignment = NSTextAlignmentCenter;
    [scrollView3 addSubview:buttonThree2Label];
    
    buttonThree3Label = [[UILabel alloc]initWithFrame:CGRectMake(196, 78, 70, 14)];
    buttonThree3Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonThree3Label.text = @"お好み焼き";
    buttonThree3Label.textAlignment = NSTextAlignmentCenter;
    [scrollView3 addSubview:buttonThree3Label];
    
    buttonThree4Label = [[UILabel alloc]initWithFrame:CGRectMake(286, 78, 70, 14)];
    buttonThree4Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonThree4Label.text = @"お好み焼き";
    buttonThree4Label.textAlignment = NSTextAlignmentCenter;
    [scrollView3 addSubview:buttonThree4Label];
    
    buttonThree5Label = [[UILabel alloc]initWithFrame:CGRectMake(376, 78, 70, 14)];
    buttonThree5Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonThree5Label.text = @"お好み焼き";
    buttonThree5Label.textAlignment = NSTextAlignmentCenter;
    [scrollView3 addSubview:buttonThree5Label];
    
    
    performanceLabel = [[UILabel alloc]initWithFrame:CGRectMake(16,484, 100, 22)];
    performanceLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:18];
    performanceLabel.text = @"Performace";
    [mainScrollView addSubview:performanceLabel];
    
    scrollView4 = [[UIScrollView alloc]init];
    scrollView4.frame = CGRectMake(0, 518, self.view.bounds.size.width, 106);
    scrollView4.showsHorizontalScrollIndicator = NO;
    scrollView4.userInteractionEnabled = YES;
    scrollView4.delegate = self;
    scrollView4.bounces = YES;
    [scrollView4 setContentSize:CGSizeMake(462, 106)];
    scrollView4.backgroundColor=[UIColor clearColor];
    [mainScrollView addSubview:scrollView4];
    
    buttonFour1= [[UIButton alloc]initWithFrame:CGRectMake(16, 0, 70, 70)];
    [buttonFour1 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
    [buttonFour1 addTarget:self
                     action:@selector(buttonFour1Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView4 addSubview:buttonFour1];
    
    buttonFour2= [[UIButton alloc]initWithFrame:CGRectMake(106, 0, 70, 70)];
    [buttonFour2 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
    [buttonFour2 addTarget:self
                     action:@selector(buttonFour2Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView4 addSubview:buttonFour2];
    
    buttonFour3= [[UIButton alloc]initWithFrame:CGRectMake(196, 0, 70, 70)];
    [buttonFour3 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
    [buttonFour3 addTarget:self
                     action:@selector(buttonFour3Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView4 addSubview:buttonFour3];
    
    buttonFour4= [[UIButton alloc]initWithFrame:CGRectMake(286, 0, 70, 70)];
    [buttonFour4 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
    [buttonFour4 addTarget:self
                     action:@selector(buttonFour4Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView4 addSubview:buttonFour4];
    
    buttonFour5= [[UIButton alloc]initWithFrame:CGRectMake(376, 0, 70, 70)];
    [buttonFour5 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
    [buttonFour5 addTarget:self
                     action:@selector(buttonFour5Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView4 addSubview:buttonFour5];
    
    buttonFour1Label = [[UILabel alloc]initWithFrame:CGRectMake(16, 78, 70, 14)];
    buttonFour1Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonFour1Label.text = @"お好み焼き";
    buttonFour1Label.textAlignment = NSTextAlignmentCenter;
    [scrollView4 addSubview:buttonFour1Label];
    
    buttonFour2Label = [[UILabel alloc]initWithFrame:CGRectMake(106, 78, 70, 14)];
    buttonFour2Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonFour2Label.text = @"お好み焼き";
    buttonFour2Label.textAlignment = NSTextAlignmentCenter;
    [scrollView4 addSubview:buttonFour2Label];
    
    buttonFour3Label = [[UILabel alloc]initWithFrame:CGRectMake(196, 78, 70, 14)];
    buttonFour3Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonFour3Label.text = @"お好み焼き";
    buttonFour3Label.textAlignment = NSTextAlignmentCenter;
    [scrollView4 addSubview:buttonFour3Label];
    
    buttonFour4Label = [[UILabel alloc]initWithFrame:CGRectMake(286, 78, 70, 14)];
    buttonFour4Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonFour4Label.text = @"お好み焼き";
    buttonFour4Label.textAlignment = NSTextAlignmentCenter;
    [scrollView4 addSubview:buttonFour4Label];
    
    buttonFour5Label = [[UILabel alloc]initWithFrame:CGRectMake(376, 78, 70, 14)];
    buttonFour5Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonFour5Label.text = @"お好み焼き";
    buttonFour5Label.textAlignment = NSTextAlignmentCenter;
    [scrollView4 addSubview:buttonFour5Label];
    
    
    stageLabel = [[UILabel alloc]initWithFrame:CGRectMake(16,640, 50, 22)];
    stageLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:18];
    stageLabel.text = @"Stage";
    [mainScrollView addSubview:stageLabel];
    
    scrollView5 = [[UIScrollView alloc]init];
    scrollView5.frame = CGRectMake(0, 674, self.view.bounds.size.width, 106);
    scrollView5.showsHorizontalScrollIndicator = NO;
    scrollView5.userInteractionEnabled = YES;
    scrollView5.delegate = self;
    scrollView5.bounces = YES;
    [scrollView5 setContentSize:CGSizeMake(462, 106)];
    scrollView5.backgroundColor=[UIColor clearColor];
    [mainScrollView addSubview:scrollView5];
    
    buttonFive1= [[UIButton alloc]initWithFrame:CGRectMake(16, 0, 70, 70)];
    [buttonFive1 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
    [buttonFive1 addTarget:self
                    action:@selector(buttonFive1Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView5 addSubview:buttonFive1];
    
    buttonFive2= [[UIButton alloc]initWithFrame:CGRectMake(106, 0, 70, 70)];
    [buttonFive2 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
    [buttonFive2 addTarget:self
                    action:@selector(buttonFive2Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView5 addSubview:buttonFive2];
    
    buttonFive3= [[UIButton alloc]initWithFrame:CGRectMake(196, 0, 70, 70)];
    [buttonFive3 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
    [buttonFive3 addTarget:self
                    action:@selector(buttonFive3Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView5 addSubview:buttonFive3];
    
    buttonFive4= [[UIButton alloc]initWithFrame:CGRectMake(286, 0, 70, 70)];
    [buttonFive4 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
    [buttonFive4 addTarget:self
                    action:@selector(buttonFive4Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView5 addSubview:buttonFive4];
    
    buttonFive5= [[UIButton alloc]initWithFrame:CGRectMake(376, 0, 70, 70)];
    [buttonFive5 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
    [buttonFive5 addTarget:self
                    action:@selector(buttonFive5Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView5 addSubview:buttonFive5];
    
    buttonFive1Label = [[UILabel alloc]initWithFrame:CGRectMake(16, 78, 70, 14)];
    buttonFive1Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonFive1Label.text = @"お好み焼き";
    buttonFive1Label.textAlignment = NSTextAlignmentCenter;
    [scrollView5 addSubview:buttonFive1Label];
    
    buttonFive2Label = [[UILabel alloc]initWithFrame:CGRectMake(106, 78, 70, 14)];
    buttonFive2Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonFive2Label.text = @"お好み焼き";
    buttonFive2Label.textAlignment = NSTextAlignmentCenter;
    [scrollView5 addSubview:buttonFive2Label];
    
    buttonFive3Label = [[UILabel alloc]initWithFrame:CGRectMake(196, 78, 70, 14)];
    buttonFive3Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonFive3Label.text = @"お好み焼き";
    buttonFive3Label.textAlignment = NSTextAlignmentCenter;
    [scrollView5 addSubview:buttonFive3Label];
    
    buttonFive4Label = [[UILabel alloc]initWithFrame:CGRectMake(286, 78, 70, 14)];
    buttonFive4Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonFive4Label.text = @"お好み焼き";
    buttonFive4Label.textAlignment = NSTextAlignmentCenter;
    [scrollView5 addSubview:buttonFive4Label];
    
    buttonFive5Label = [[UILabel alloc]initWithFrame:CGRectMake(376, 78, 70, 14)];
    buttonFive5Label.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    buttonFive5Label.text = @"お好み焼き";
    buttonFive5Label.textAlignment = NSTextAlignmentCenter;
    [scrollView5 addSubview:buttonFive5Label];
    
    
    
    [self.view addSubview:mainScrollView];
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
                            action:@selector(featuredDetail:) forControlEvents:UIControlEventTouchUpInside];
    
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
    
    NSLog(@"fiasfh");
    
}

-(void)buttonOne1Detail:(UIButton *)button{
    
}

-(void)buttonOne2Detail:(UIButton *)button{
    
}

-(void)buttonOne3Detail:(UIButton *)button{
    
}

-(void)buttonOne4Detail:(UIButton *)button{
    
}

-(void)buttonOne5Detail:(UIButton *)button{
    
}

-(void)buttonTwo1Detail:(UIButton *)button{
    
}

-(void)buttonTwo2Detail:(UIButton *)button{
    
}

-(void)buttonTwo3Detail:(UIButton *)button{
    
}

-(void)buttonTwo4Detail:(UIButton *)button{
    
}

-(void)buttonTwo5Detail:(UIButton *)button{
    
}

-(void)buttonThree1Detail:(UIButton *)button{
    
}

-(void)buttonThree2Detail:(UIButton *)button{
    
}

-(void)buttonThree3Detail:(UIButton *)button{
    
}

-(void)buttonThree4Detail:(UIButton *)button{
    
}

-(void)buttonThree5Detail:(UIButton *)button{
    
}

-(void)buttonFour1Detail:(UIButton *)button{
    
}

-(void)buttonFour2Detail:(UIButton *)button{
    
}

-(void)buttonFour3Detail:(UIButton *)button{
    
}

-(void)buttonFour4Detail:(UIButton *)button{
    
}

-(void)buttonFour5Detail:(UIButton *)button{
    
}

-(void)buttonFive1Detail:(UIButton *)button{
    
}

-(void)buttonFive2Detail:(UIButton *)button{
    
}

-(void)buttonFive3Detail:(UIButton *)button{
    
}

-(void)buttonFive4Detail:(UIButton *)button{
    
}

-(void)buttonFive5Detail:(UIButton *)button{
    
}

-(void)viewAll1:(UIButton *)button{
    
}

@end
