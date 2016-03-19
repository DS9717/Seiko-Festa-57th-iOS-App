//
//  ListView.m
//  Seiko Festa 57th
//
//  Created by Yuya Imanari on 2016/01/25(月).
//  Copyright © 2016年 Daisuke Masuda. All rights reserved.
//

#import "ListView.h"

@interface ListView ()

@end

@implementation ListView
@synthesize flag;
@synthesize whatList = _whatList;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //iOSのバージョンで分岐
    float iOSVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    
    //iOS8以降
    if(iOSVersion >= 8.0f){
        
        scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        
    }else{
        
        scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-113)];
        
    }
    
    //横スクロールのインジケータを非表示にする
    scrollView.showsHorizontalScrollIndicator = NO;
    
    scrollView.userInteractionEnabled = YES;
    scrollView.directionalLockEnabled = YES;
    scrollView.bounces = YES;
    scrollView.backgroundColor = [UIColor clearColor];
    
    
    if ([_whatList isEqualToString:@"food"]) {
        
        self.navigationItem.title = @"Food";
        
        button1= [[UIButton alloc]initWithFrame:CGRectMake(16, 16, 128, 128)];
        [button1 setImage:[UIImage imageNamed:@"鉄板職人.jpg"] forState:UIControlStateNormal];
        [button1 addTarget:self
                       action:@selector(buttonOne1Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button1];
        
        label1 = [[UILabel alloc]initWithFrame:CGRectMake(16, 152, 128, 20)];
        label1.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label1.text = @"鉄板職人";
        label1.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label1];
        
        button2= [[UIButton alloc]initWithFrame:CGRectMake(176, 16, 128, 128)];
        [button2 setImage:[UIImage imageNamed:@"塩焼きそば　麺’sRUNRUN.png"] forState:UIControlStateNormal];
        [button2 addTarget:self
                    action:@selector(buttonOne2Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button2];
        
        label2 = [[UILabel alloc]initWithFrame:CGRectMake(176, 152, 128, 20)];
        label2.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label2.text = @"麺'sRUNRUN";
        label2.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label2];
        
        button3= [[UIButton alloc]initWithFrame:CGRectMake(16, 196, 128, 128)];
        [button3 setImage:[UIImage imageNamed:@"麺☆恋.png"] forState:UIControlStateNormal];
        [button3 addTarget:self
                    action:@selector(buttonOne3Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button3];
        
        label3 = [[UILabel alloc]initWithFrame:CGRectMake(16, 332, 128, 20)];
        label3.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label3.text = @"麺☆恋";
        label3.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label3];
        
        button4= [[UIButton alloc]initWithFrame:CGRectMake(176, 196, 128, 128)];
        [button4 setImage:[UIImage imageNamed:@"俺のケバブ.jpg"] forState:UIControlStateNormal];
        [button4 addTarget:self
                    action:@selector(buttonOne4Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button4];
        
        label4 = [[UILabel alloc]initWithFrame:CGRectMake(176, 332, 128, 20)];
        label4.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label4.text = @"俺のケバブ";
        label4.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label4];
        
        button5= [[UIButton alloc]initWithFrame:CGRectMake(16, 376, 128, 128)];
        [button5 setImage:[UIImage imageNamed:@"鳥角.png"] forState:UIControlStateNormal];
        [button5 addTarget:self
                    action:@selector(buttonOne5Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button5];
        
        label5 = [[UILabel alloc]initWithFrame:CGRectMake(16, 512, 128, 20)];
        label5.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label5.text = @"鳥角";
        label5.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label5];
        
        button6= [[UIButton alloc]initWithFrame:CGRectMake(176, 376, 128, 128)];
        [button6 setImage:[UIImage imageNamed:@"クレープブレーク.png"] forState:UIControlStateNormal];
        [button6 addTarget:self
                    action:@selector(buttonOne6Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button6];
        
        label6 = [[UILabel alloc]initWithFrame:CGRectMake(176, 512, 128, 20)];
        label6.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label6.text = @"クレープブレーク";
        label6.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label6];
        
        button7= [[UIButton alloc]initWithFrame:CGRectMake(16, 556, 128, 128)];
        [button7 setImage:[UIImage imageNamed:@"Flapjack.png"] forState:UIControlStateNormal];
        [button7 addTarget:self
                    action:@selector(buttonOne7Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button7];
        
        label7 = [[UILabel alloc]initWithFrame:CGRectMake(16, 692, 128, 20)];
        label7.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label7.text = @"Flapjack";
        label7.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label7];
        
        button8= [[UIButton alloc]initWithFrame:CGRectMake(176, 556, 128, 128)];
        [button8 setImage:[UIImage imageNamed:@"chocolat-π.png"] forState:UIControlStateNormal];
        [button8 addTarget:self
                    action:@selector(buttonOne8Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button8];
        
        label8 = [[UILabel alloc]initWithFrame:CGRectMake(176, 692, 128, 20)];
        label8.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label8.text = @"chocolat π";
        label8.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label8];
        
        button9= [[UIButton alloc]initWithFrame:CGRectMake(16, 736, 128, 128)];
        [button9 setImage:[UIImage imageNamed:@"Juicy-Juicer.png"] forState:UIControlStateNormal];
        [button9 addTarget:self
                    action:@selector(buttonOne9Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button9];
        
        label9 = [[UILabel alloc]initWithFrame:CGRectMake(16, 872, 128, 20)];
        label9.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label9.text = @"Juicy Juicer";
        label9.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label9];
        
        button10= [[UIButton alloc]initWithFrame:CGRectMake(176, 736, 128, 128)];
        [button10 setImage:[UIImage imageNamed:@"綿's-candy.png"] forState:UIControlStateNormal];
        [button10 addTarget:self
                    action:@selector(buttonOne10Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button10];
        
        label10 = [[UILabel alloc]initWithFrame:CGRectMake(176, 872, 128, 20)];
        label10.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label10.text = @"綿's Candy";
        label10.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label10];
        
        button11= [[UIButton alloc]initWithFrame:CGRectMake(16, 916, 128, 128)];
        [button11 setImage:[UIImage imageNamed:@"氷菓.png"] forState:UIControlStateNormal];
        [button11 addTarget:self
                    action:@selector(buttonOne11Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button11];
        
        label11 = [[UILabel alloc]initWithFrame:CGRectMake(16, 1052, 128, 20)];
        label11.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label11.text = @"氷菓";
        label11.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label11];
        
        button12= [[UIButton alloc]initWithFrame:CGRectMake(176, 916, 128, 128)];
        [button12 setImage:[UIImage imageNamed:@"山手の泉.png"] forState:UIControlStateNormal];
        [button12 addTarget:self
                    action:@selector(buttonOne12Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button12];
        
        label12 = [[UILabel alloc]initWithFrame:CGRectMake(176, 1052, 128, 20)];
        label12.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label12.text = @"山手の泉";
        label12.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label12];
        
        button13= [[UIButton alloc]initWithFrame:CGRectMake(16, 1096, 128, 128)];
        [button13 setImage:[UIImage imageNamed:@"題名のない音楽喫茶.png"] forState:UIControlStateNormal];
        [button13 addTarget:self
                    action:@selector(buttonOne13Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button13];
        
        label13 = [[UILabel alloc]initWithFrame:CGRectMake(16, 1232, 128, 20)];
        label13.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label13.text = @"題名のない音楽喫茶";
        label13.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label13];
        
        button14= [[UIButton alloc]initWithFrame:CGRectMake(176, 1096, 128, 128)];
        [button14 setImage:[UIImage imageNamed:@"駅弁.png"] forState:UIControlStateNormal];
        [button14 addTarget:self
                    action:@selector(buttonOne14Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button14];
        
        label14 = [[UILabel alloc]initWithFrame:CGRectMake(176, 1232, 128, 20)];
        label14.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label14.text = @"駅弁";
        label14.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label14];
        
        //スクロールの範囲を設定
        [scrollView setContentSize:CGSizeMake(self.view.bounds.size.width, 1276)];
        
    }else if ([_whatList isEqualToString:@"display"]) {
        
        self.navigationItem.title = @"Display";
        
        button1= [[UIButton alloc]initWithFrame:CGRectMake(16, 16, 128, 128)];
        [button1 setImage:[UIImage imageNamed:@"英語劇.png"] forState:UIControlStateNormal];
        [button1 addTarget:self
                    action:@selector(buttonTwo1Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button1];
        
        label1 = [[UILabel alloc]initWithFrame:CGRectMake(16, 152, 128, 20)];
        label1.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label1.text = @"英語劇";
        label1.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label1];
        
        button2= [[UIButton alloc]initWithFrame:CGRectMake(176, 16, 128, 128)];
        [button2 setImage:[UIImage imageNamed:@"高3英語劇.png"] forState:UIControlStateNormal];
        [button2 addTarget:self
                    action:@selector(buttonTwo2Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button2];
        
        label2 = [[UILabel alloc]initWithFrame:CGRectMake(176, 152, 128, 20)];
        label2.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label2.text = @"高3英語劇";
        label2.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label2];
        
        button3= [[UIButton alloc]initWithFrame:CGRectMake(16, 196, 128, 128)];
        [button3 setImage:[UIImage imageNamed:@"迷いの国のアリス.png"] forState:UIControlStateNormal];
        [button3 addTarget:self
                    action:@selector(buttonTwo3Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button3];
        
        label3 = [[UILabel alloc]initWithFrame:CGRectMake(16, 332, 128, 20)];
        label3.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label3.text = @"迷いの国のアリス";
        label3.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label3];
        
        button4= [[UIButton alloc]initWithFrame:CGRectMake(176, 196, 128, 128)];
        [button4 setImage:[UIImage imageNamed:@"Trick×Hark.jpg"] forState:UIControlStateNormal];
        [button4 addTarget:self
                    action:@selector(buttonTwo4Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button4];
        
        label4 = [[UILabel alloc]initWithFrame:CGRectMake(176, 332, 128, 20)];
        label4.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label4.text = @"Trick×Hark";
        label4.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label4];
        
        button5= [[UIButton alloc]initWithFrame:CGRectMake(16, 376, 128, 128)];
        [button5 setImage:[UIImage imageNamed:@"インターアクト.png"] forState:UIControlStateNormal];
        [button5 addTarget:self
                    action:@selector(buttonTwo5Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button5];
        
        label5 = [[UILabel alloc]initWithFrame:CGRectMake(16, 512, 128, 20)];
        label5.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label5.text = @"インターアクトクラブ";
        label5.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label5];
        
        //スクロールの範囲を設定
        [scrollView setContentSize:CGSizeMake(self.view.bounds.size.width, 556)];
        
        
        
    }else if ([_whatList isEqualToString:@"band"]) {
        
        self.navigationItem.title = @"Band";
        
        button1= [[UIButton alloc]initWithFrame:CGRectMake(16, 16, 128, 128)];
        [button1 setImage:[UIImage imageNamed:@"Chaos-illusion.png"] forState:UIControlStateNormal];
        [button1 addTarget:self
                    action:@selector(buttonThree1Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button1];
        
        label1 = [[UILabel alloc]initWithFrame:CGRectMake(16, 152, 128, 20)];
        label1.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label1.text = @"Chaos-illusion";
        label1.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label1];
        
        button2= [[UIButton alloc]initWithFrame:CGRectMake(176, 16, 128, 128)];
        [button2 setImage:[UIImage imageNamed:@"Flat-Flight.png"] forState:UIControlStateNormal];
        [button2 addTarget:self
                    action:@selector(buttonThree2Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button2];
        
        label2 = [[UILabel alloc]initWithFrame:CGRectMake(176, 152, 128, 20)];
        label2.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label2.text = @"Flat-Flight";
        label2.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label2];
        
        button3= [[UIButton alloc]initWithFrame:CGRectMake(16, 196, 128, 128)];
        [button3 setImage:[UIImage imageNamed:@"M&A.png"] forState:UIControlStateNormal];
        [button3 addTarget:self
                    action:@selector(buttonThree3Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button3];
        
        label3 = [[UILabel alloc]initWithFrame:CGRectMake(16, 332, 128, 20)];
        label3.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label3.text = @"M&A";
        label3.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label3];
        
        button4= [[UIButton alloc]initWithFrame:CGRectMake(176, 196, 128, 128)];
        [button4 setImage:[UIImage imageNamed:@"WEAK-END.png"] forState:UIControlStateNormal];
        [button4 addTarget:self
                    action:@selector(buttonThree4Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button4];
        
        label4 = [[UILabel alloc]initWithFrame:CGRectMake(176, 332, 128, 20)];
        label4.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label4.text = @"WEAK-END";
        label4.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label4];
        
        button5= [[UIButton alloc]initWithFrame:CGRectMake(16, 376, 128, 128)];
        [button5 setImage:[UIImage imageNamed:@"エストレーラ.png"] forState:UIControlStateNormal];
        [button5 addTarget:self
                    action:@selector(buttonThree5Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button5];
        
        label5 = [[UILabel alloc]initWithFrame:CGRectMake(16, 512, 128, 20)];
        label5.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label5.text = @"エストレーラ";
        label5.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label5];
        
        button6= [[UIButton alloc]initWithFrame:CGRectMake(176, 376, 128, 128)];
        [button6 setImage:[UIImage imageNamed:@"蜃気楼.png"] forState:UIControlStateNormal];
        [button6 addTarget:self
                    action:@selector(buttonThree6Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button6];
        
        label6 = [[UILabel alloc]initWithFrame:CGRectMake(176, 512, 128, 20)];
        label6.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label6.text = @"蜃気楼";
        label6.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label6];
        
        //スクロールの範囲を設定
        [scrollView setContentSize:CGSizeMake(self.view.bounds.size.width, 556)];
        
        
        
    }else if ([_whatList isEqualToString:@"performance"]) {
        
        self.navigationItem.title = @"Performance";
        
        button1= [[UIButton alloc]initWithFrame:CGRectMake(16, 16, 128, 128)];
        [button1 setImage:[UIImage imageNamed:@"Grand-Finale.png"] forState:UIControlStateNormal];
        [button1 addTarget:self
                    action:@selector(buttonFour1Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button1];
        
        label1 = [[UILabel alloc]initWithFrame:CGRectMake(16, 152, 128, 20)];
        label1.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label1.text = @"Grand-Finale";
        label1.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label1];
        
        button2= [[UIButton alloc]initWithFrame:CGRectMake(176, 16, 128, 128)];
        [button2 setImage:[UIImage imageNamed:@"英語劇講堂劇.png"] forState:UIControlStateNormal];
        [button2 addTarget:self
                    action:@selector(buttonFour2Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button2];
        
        label2 = [[UILabel alloc]initWithFrame:CGRectMake(176, 152, 128, 20)];
        label2.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label2.text = @"英語劇";
        label2.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label2];
        
        button3= [[UIButton alloc]initWithFrame:CGRectMake(16, 196, 128, 128)];
        [button3 setImage:[UIImage imageNamed:@"ボールぽこぽこ.png"] forState:UIControlStateNormal];
        [button3 addTarget:self
                    action:@selector(buttonFour3Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button3];
        
        label3 = [[UILabel alloc]initWithFrame:CGRectMake(16, 332, 128, 20)];
        label3.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label3.text = @"ボールぽこぽこ";
        label3.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label3];
        
        button4= [[UIButton alloc]initWithFrame:CGRectMake(176, 196, 128, 128)];
        [button4 setImage:[UIImage imageNamed:@"校長対談.png"] forState:UIControlStateNormal];
        [button4 addTarget:self
                    action:@selector(buttonFour4Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button4];
        
        label4 = [[UILabel alloc]initWithFrame:CGRectMake(176, 332, 128, 20)];
        label4.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label4.text = @"校長対談";
        label4.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label4];
        
        button5= [[UIButton alloc]initWithFrame:CGRectMake(16, 376, 128, 128)];
        [button5 setImage:[UIImage imageNamed:@"ミュージックサロン.png"] forState:UIControlStateNormal];
        [button5 addTarget:self
                    action:@selector(buttonFour5Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button5];
        
        label5 = [[UILabel alloc]initWithFrame:CGRectMake(16, 512, 128, 20)];
        label5.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label5.text = @"ミュージックサロン";
        label5.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label5];
        
        button6= [[UIButton alloc]initWithFrame:CGRectMake(176, 376, 128, 128)];
        [button6 setImage:[UIImage imageNamed:@"グリークラブ.png"] forState:UIControlStateNormal];
        [button6 addTarget:self
                    action:@selector(buttonFour6Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button6];
        
        label6 = [[UILabel alloc]initWithFrame:CGRectMake(176, 512, 128, 20)];
        label6.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label6.text = @"グリークラブ";
        label6.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label6];
        
        //スクロールの範囲を設定
        [scrollView setContentSize:CGSizeMake(self.view.bounds.size.width, 556)];
        
        
        
    }else if ([_whatList isEqualToString:@"stage"]) {
        
        self.navigationItem.title = @"Stage";
        
        button1= [[UIButton alloc]initWithFrame:CGRectMake(16, 16, 128, 128)];
        [button1 setImage:[UIImage imageNamed:@"春夜祭.png"] forState:UIControlStateNormal];
        [button1 addTarget:self
                    action:@selector(buttonFive1Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button1];
        
        label1 = [[UILabel alloc]initWithFrame:CGRectMake(16, 152, 128, 20)];
        label1.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label1.text = @"春夜祭";
        label1.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label1];
        
        button2= [[UIButton alloc]initWithFrame:CGRectMake(176, 16, 128, 128)];
        [button2 setImage:[UIImage imageNamed:@"フォークダンス.png"] forState:UIControlStateNormal];
        [button2 addTarget:self
                    action:@selector(buttonFive2Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button2];
        
        label2 = [[UILabel alloc]initWithFrame:CGRectMake(176, 152, 128, 20)];
        label2.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label2.text = @"フォークダンス";
        label2.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label2];
        
        button3= [[UIButton alloc]initWithFrame:CGRectMake(16, 196, 128, 128)];
        [button3 setImage:[UIImage imageNamed:@"○○男子No.1決定戦.png"] forState:UIControlStateNormal];
        [button3 addTarget:self
                    action:@selector(buttonFive3Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button3];
        
        label3 = [[UILabel alloc]initWithFrame:CGRectMake(16, 332, 128, 20)];
        label3.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label3.text = @"○○男子No.1決定戦";
        label3.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label3];
        
        button4= [[UIButton alloc]initWithFrame:CGRectMake(176, 196, 128, 128)];
        [button4 setImage:[UIImage imageNamed:@"Mr.聖光.png"] forState:UIControlStateNormal];
        [button4 addTarget:self
                    action:@selector(buttonFive4Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button4];
        
        label4 = [[UILabel alloc]initWithFrame:CGRectMake(176, 332, 128, 20)];
        label4.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label4.text = @"Mr.聖光";
        label4.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label4];
        
        button5= [[UIButton alloc]initWithFrame:CGRectMake(16, 376, 128, 128)];
        [button5 setImage:[UIImage imageNamed:@"S-O-S.png"] forState:UIControlStateNormal];
        [button5 addTarget:self
                    action:@selector(buttonFive5Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button5];
        
        label5 = [[UILabel alloc]initWithFrame:CGRectMake(16, 512, 128, 20)];
        label5.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label5.text = @"S-O-S";
        label5.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label5];
        
        button6= [[UIButton alloc]initWithFrame:CGRectMake(176, 376, 128, 128)];
        [button6 setImage:[UIImage imageNamed:@"替え歌選手権.png"] forState:UIControlStateNormal];
        [button6 addTarget:self
                    action:@selector(buttonFive6Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button6];
        
        label6 = [[UILabel alloc]initWithFrame:CGRectMake(176, 512, 128, 20)];
        label6.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label6.text = @"替え歌選手権";
        label6.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label6];
        
        //スクロールの範囲を設定
        [scrollView setContentSize:CGSizeMake(self.view.bounds.size.width, 556)];
    }
    
    [self.view addSubview:scrollView];
    self.navigationController.navigationBar.tintColor=[UIColor orangeColor];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)buttonOne1Detail:(UIButton *)button{
    whichList = @"food";
    flag = 1;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonOne2Detail:(UIButton *)button{
    whichList = @"food";
    flag = 2;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonOne3Detail:(UIButton *)button{
    whichList = @"food";
    flag = 3;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonOne4Detail:(UIButton *)button{
    whichList = @"food";
    flag = 4;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonOne5Detail:(UIButton *)button{
    whichList = @"food";
    flag = 5;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonOne6Detail:(UIButton *)button{
    whichList = @"food";
    flag = 6;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonOne7Detail:(UIButton *)button{
    whichList = @"food";
    flag = 7;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonOne8Detail:(UIButton *)button{
    whichList = @"food";
    flag = 8;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonOne9Detail:(UIButton *)button{
    whichList = @"food";
    flag = 9;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonOne10Detail:(UIButton *)button{
    whichList = @"food";
    flag = 10;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonOne11Detail:(UIButton *)button{
    whichList = @"food";
    flag = 11;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonOne12Detail:(UIButton *)button{
    whichList = @"food";
    flag = 12;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonOne13Detail:(UIButton *)button{
    whichList = @"food";
    flag = 13;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonOne14Detail:(UIButton *)button{
    whichList = @"food";
    flag = 14;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo1Detail:(UIButton *)button{
    whichList = @"display";
    flag = 1;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo2Detail:(UIButton *)button{
    whichList = @"display";
    flag = 2;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo3Detail:(UIButton *)button{
    whichList = @"display";
    flag = 3;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo4Detail:(UIButton *)button{
    whichList = @"display";
    flag = 4;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo5Detail:(UIButton *)button{
    whichList = @"display";
    flag = 5;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo6Detail:(UIButton *)button{
    whichList = @"display";
    flag = 6;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonThree1Detail:(UIButton *)button{
    whichList = @"band";
    flag = 1;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
    
}

-(void)buttonThree2Detail:(UIButton *)button{
    whichList = @"band";
    flag = 2;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonThree3Detail:(UIButton *)button{
    whichList = @"band";
    flag = 3;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonThree4Detail:(UIButton *)button{
    whichList = @"band";
    flag = 4;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonThree5Detail:(UIButton *)button{
    whichList = @"band";
    flag = 5;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonThree6Detail:(UIButton *)button{
    whichList = @"band";
    flag = 5;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonFour1Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 1;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonFour2Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 2;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonFour3Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 3;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonFour4Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 4;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonFour5Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 5;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonFour6Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 5;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonFive1Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 1;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonFive2Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 2;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonFive3Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 3;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonFive4Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 4;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonFive5Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 5;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonFive6Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 6;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
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


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailView *detailView = segue.destinationViewController;
    detailView.flag = flag;
    detailView.whatList = whichList;
    
}


@end
