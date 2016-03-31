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
        scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-64)];
    }else{
        scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-113)];
    }
    
    //画面サイズ
    CGRect r = [[UIScreen mainScreen] bounds];
    if (r.size.width == 320) {
        //iPhone 4s/5/5c/5s
        spaceLeft = 38;
        length = 84;
        spaceH = 8;
        fontSize = 15;
    } else if (r.size.width == 375) {
        //iPhone 6/6s
        spaceLeft = 16;
        length = 155.5;
        spaceH = 8;
        fontSize = 15;
    } else if (r.size.width == 414) {
        //iPhone 6 plus/6s plus
        spaceLeft = 16;
        length = 175;
        spaceH = 8;
        fontSize = 15;
    }
    
    
    //Navigation Itemのタイトルのフォントを設定
    nav_title=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.navigationItem.titleView.frame.size.width,40)];
    nav_title.textColor=[UIColor whiteColor];
    
    nav_title.textAlignment=NSTextAlignmentCenter;
    
    [nav_title setFont:[UIFont fontWithName:@"MyriadPro-Regular" size:22]];
    self.navigationItem.titleView=nav_title;
    
    
    //横スクロールのインジケータを非表示にする
    scrollView.showsHorizontalScrollIndicator = NO;
    
    scrollView.userInteractionEnabled = YES;
    scrollView.directionalLockEnabled = YES;
    scrollView.bounces = YES;
    scrollView.backgroundColor = [UIColor clearColor];
    
    
    //食品
    if ([_whatList isEqualToString:@"food"]) {
        
        nav_title.text=@"Food";
        
        //スクロールの範囲を設定
        [scrollView setContentSize:CGSizeMake(self.view.bounds.size.width, 16 + (length + spaceH + fontSize + 29) * 7)];
        
        button1= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + fontSize + 29) * 0, length, length)];
        [button1 setImage:[UIImage imageNamed:@"鉄板職人.png"] forState:UIControlStateNormal];
        [button1 addTarget:self
                       action:@selector(buttonOne1Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button1];
        
        label1 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 0, length, fontSize + 5)];
        label1.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label1.text = @"鉄板職人";
        label1.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label1];
        
        button2= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16, length, length)];
        [button2 setImage:[UIImage imageNamed:@"塩焼きそば　麺’sRUNRUN.png"] forState:UIControlStateNormal];
        [button2 addTarget:self
                    action:@selector(buttonOne2Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button2];
        
        label2 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, length + 24, length, fontSize + 5)];
        label2.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label2.text = @"麺'sRUNRUN";
        label2.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label2];
        
        button3= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + fontSize + 29) * 1, length, length)];
        [button3 setImage:[UIImage imageNamed:@"麺☆恋.png"] forState:UIControlStateNormal];
        [button3 addTarget:self
                    action:@selector(buttonOne3Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button3];
        
        label3 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 1, length, fontSize + 5)];
        label3.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label3.text = @"麺☆恋";
        label3.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label3];
        
        button4= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + (length + spaceH + fontSize + 29) * 1, length, length)];
        [button4 setImage:[UIImage imageNamed:@"俺のケバブ.jpg"] forState:UIControlStateNormal];
        [button4 addTarget:self
                    action:@selector(buttonOne4Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button4];
        
        label4 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 1, length, fontSize + 5)];
        label4.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label4.text = @"俺のケバブ";
        label4.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label4];
        
        button5= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + fontSize + 29) * 2, length, length)];
        [button5 setImage:[UIImage imageNamed:@"鳥角.png"] forState:UIControlStateNormal];
        [button5 addTarget:self
                    action:@selector(buttonOne5Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button5];
        
        label5 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 2, length, fontSize + 5)];
        label5.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label5.text = @"鳥角";
        label5.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label5];
        
        button6= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + (length + spaceH + fontSize + 29) * 2, length, length)];
        [button6 setImage:[UIImage imageNamed:@"クレープブレーク.png"] forState:UIControlStateNormal];
        [button6 addTarget:self
                    action:@selector(buttonOne6Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button6];
        
        label6 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 2, length, fontSize + 5)];
        label6.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label6.text = @"クレープブレーク";
        label6.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label6];
        
        button7= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + fontSize + 29) * 3, length, length)];
        [button7 setImage:[UIImage imageNamed:@"Flapjack.png"] forState:UIControlStateNormal];
        [button7 addTarget:self
                    action:@selector(buttonOne7Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button7];
        
        label7 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 3, length, fontSize + 5)];
        label7.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label7.text = @"Flapjack";
        label7.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label7];
        
        button8= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + (length + spaceH + fontSize + 29) * 3, length, length)];
        [button8 setImage:[UIImage imageNamed:@"chocolat-π.png"] forState:UIControlStateNormal];
        [button8 addTarget:self
                    action:@selector(buttonOne8Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button8];
        
        label8 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 3, length, fontSize + 5)];
        label8.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label8.text = @"chocolat π";
        label8.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label8];
        
        button9= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + fontSize + 29) * 4, length, length)];
        [button9 setImage:[UIImage imageNamed:@"Juicy-Juicer.png"] forState:UIControlStateNormal];
        [button9 addTarget:self
                    action:@selector(buttonOne9Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button9];
        
        label9 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 4, length, fontSize + 5)];
        label9.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label9.text = @"Juicy Juicer";
        label9.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label9];
        
        button10= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + (length + spaceH + fontSize + 29) * 4, length, length)];
        [button10 setImage:[UIImage imageNamed:@"綿's-candy.png"] forState:UIControlStateNormal];
        [button10 addTarget:self
                    action:@selector(buttonOne10Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button10];
        
        label10 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 4, length, fontSize + 5)];
        label10.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label10.text = @"綿's Candy";
        label10.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label10];
        
        button11= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + fontSize + 29) * 5, length, length)];
        [button11 setImage:[UIImage imageNamed:@"氷菓.png"] forState:UIControlStateNormal];
        [button11 addTarget:self
                    action:@selector(buttonOne11Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button11];
        
        label11 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 5, length, fontSize + 5)];
        label11.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label11.text = @"氷菓";
        label11.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label11];
        
        button12= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + (length + spaceH + fontSize + 29) * 5, length, length)];
        [button12 setImage:[UIImage imageNamed:@"山手の泉.png"] forState:UIControlStateNormal];
        [button12 addTarget:self
                    action:@selector(buttonOne12Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button12];
        
        label12 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 5, length, fontSize + 5)];
        label12.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label12.text = @"山手の泉";
        label12.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label12];
        
        button13= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + fontSize + 29) * 6, length, length)];
        [button13 setImage:[UIImage imageNamed:@"題名のない音楽喫茶.png"] forState:UIControlStateNormal];
        [button13 addTarget:self
                    action:@selector(buttonOne13Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button13];
        
        label13 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 6, length, fontSize + 5)];
        label13.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label13.text = @"題名のない音楽喫茶";
        label13.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label13];
        
        button14= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + (length + spaceH + fontSize + 29) * 6, length, length)];
        [button14 setImage:[UIImage imageNamed:@"駅弁.png"] forState:UIControlStateNormal];
        [button14 addTarget:self
                    action:@selector(buttonOne14Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button14];
        
        label14 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 6, length, fontSize + 5)];
        label14.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label14.text = @"駅弁";
        label14.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label14];
        
        
        
        
        
    //趣味研
    }else if ([_whatList isEqualToString:@"display"]) {
        
        nav_title.text=@"Display";
        
        //スクロールの範囲を設定
        [scrollView setContentSize:CGSizeMake(self.view.bounds.size.width, 16 + (length + spaceH + fontSize + 29) * 7)];
        
        button1= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + fontSize + 29) * 0, length, length)];
        [button1 setImage:[UIImage imageNamed:@"英語劇.png"] forState:UIControlStateNormal];
        [button1 addTarget:self
                    action:@selector(buttonOne1Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button1];
        
        label1 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 0, length, fontSize + 5)];
        label1.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label1.text = @"英語劇";
        label1.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label1];
        
        button2= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16, length, length)];
        [button2 setImage:[UIImage imageNamed:@"ポケモンセンターSeiko.png"] forState:UIControlStateNormal];
        [button2 addTarget:self
                    action:@selector(buttonOne2Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button2];
        
        label2 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, length + 24, length, fontSize + 5)];
        label2.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label2.text = @"ポケモンセンターSeiko";
        label2.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label2];
        
        button3= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + fontSize + 29) * 1, length, length)];
        [button3 setImage:[UIImage imageNamed:@"宇宙戦艦ヤマト研究会.jpg"] forState:UIControlStateNormal];
        [button3 addTarget:self
                    action:@selector(buttonOne3Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button3];
        
        label3 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 1, length, fontSize + 5)];
        label3.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label3.text = @"宇宙戦艦ヤマト研究会";
        label3.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label3];
        
        button4= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + (length + spaceH + fontSize + 29) * 1, length, length)];
        [button4 setImage:[UIImage imageNamed:@"とにかく明るいＦｅｓ村.png"] forState:UIControlStateNormal];
        [button4 addTarget:self
                    action:@selector(buttonOne4Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button4];
        
        label4 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 1, length, fontSize + 5)];
        label4.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label4.text = @"とにかく明るいFes村";
        label4.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label4];
        
        button5= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + fontSize + 29) * 2, length, length)];
        [button5 setImage:[UIImage imageNamed:@"Trick×Hark.jpg"] forState:UIControlStateNormal];
        [button5 addTarget:self
                    action:@selector(buttonOne5Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button5];
        
        label5 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 2, length, fontSize + 5)];
        label5.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label5.text = @"Trick×Hark";
        label5.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label5];
        
        button6= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + (length + spaceH + fontSize + 29) * 2, length, length)];
        [button6 setImage:[UIImage imageNamed:@"ぎゃんぶる。.jpg"] forState:UIControlStateNormal];
        [button6 addTarget:self
                    action:@selector(buttonOne6Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button6];
        
        label6 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 2, length, fontSize + 5)];
        label6.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label6.text = @"ぎゃんぶる。";
        label6.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label6];
        
        button7= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + fontSize + 29) * 3, length, length)];
        [button7 setImage:[UIImage imageNamed:@"高3英語劇.png"] forState:UIControlStateNormal];
        [button7 addTarget:self
                    action:@selector(buttonOne7Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button7];
        
        label7 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 3, length, fontSize + 5)];
        label7.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label7.text = @"高3英語劇";
        label7.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label7];
        
        button8= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + (length + spaceH + fontSize + 29) * 3, length, length)];
        [button8 setImage:[UIImage imageNamed:@"交通研究部.jpg"] forState:UIControlStateNormal];
        [button8 addTarget:self
                    action:@selector(buttonOne8Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button8];
        
        label8 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 3, length, fontSize + 5)];
        label8.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label8.text = @"交通研究部";
        label8.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label8];
        
        button9= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + fontSize + 29) * 4, length, length)];
        [button9 setImage:[UIImage imageNamed:@"藤子・Ｆ・不二雄研究会.png"] forState:UIControlStateNormal];
        [button9 addTarget:self
                    action:@selector(buttonOne9Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button9];
        
        label9 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 4, length, fontSize + 5)];
        label9.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label9.text = @"藤子・Ｆ・不二雄研究会";
        label9.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label9];
        
        button10= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + (length + spaceH + fontSize + 29) * 4, length, length)];
        [button10 setImage:[UIImage imageNamed:@"ベイスターズ研究会.jpg"] forState:UIControlStateNormal];
        [button10 addTarget:self
                     action:@selector(buttonOne10Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button10];
        
        label10 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 4, length, fontSize + 5)];
        label10.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label10.text = @"ベイスターズ研究会";
        label10.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label10];
        
        button11= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + fontSize + 29) * 5, length, length)];
        [button11 setImage:[UIImage imageNamed:@"美術部.png"] forState:UIControlStateNormal];
        [button11 addTarget:self
                     action:@selector(buttonOne11Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button11];
        
        label11 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 5, length, fontSize + 5)];
        label11.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label11.text = @"美術部";
        label11.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label11];
        
        button12= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + (length + spaceH + fontSize + 29) * 5, length, length)];
        [button12 setImage:[UIImage imageNamed:@"魔女の卓球便.png"] forState:UIControlStateNormal];
        [button12 addTarget:self
                     action:@selector(buttonOne12Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button12];
        
        label12 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 5, length, fontSize + 5)];
        label12.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label12.text = @"魔女の卓球便";
        label12.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label12];
        
        button13= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + fontSize + 29) * 6, length, length)];
        [button13 setImage:[UIImage imageNamed:@"聖光道場.jpg"] forState:UIControlStateNormal];
        [button13 addTarget:self
                     action:@selector(buttonOne13Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button13];
        
        label13 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 6, length, fontSize + 5)];
        label13.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label13.text = @"聖光道場";
        label13.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label13];
        
        button14= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + (length + spaceH + fontSize + 29) * 6, length, length)];
        [button14 setImage:[UIImage imageNamed:@"迷いの国のアリス.png"] forState:UIControlStateNormal];
        [button14 addTarget:self
                     action:@selector(buttonOne14Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button14];
        
        label14 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 6, length, fontSize + 5)];
        label14.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label14.text = @"迷いの国のアリス";
        label14.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label14];
    
        
        
        
        
    //バンド
    }else if ([_whatList isEqualToString:@"band"]) {
        
        nav_title.text=@"Band";
        
        //スクロールの範囲を設定
        [scrollView setContentSize:CGSizeMake(self.view.bounds.size.width, 16 + (length + spaceH + fontSize + 29) * 6)];
        
        button1= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + fontSize + 29) * 0, length, length)];
        [button1 setImage:[UIImage imageNamed:@"M&A.png"] forState:UIControlStateNormal];
        [button1 addTarget:self
                    action:@selector(buttonThree1Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button1];
        
        label1 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 0, length, fontSize + 5)];
        label1.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label1.text = @"M&A";
        label1.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label1];
        
        button2= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16, length, length)];
        [button2 setImage:[UIImage imageNamed:@"Flat-Flight.png"] forState:UIControlStateNormal];
        [button2 addTarget:self
                    action:@selector(buttonThree2Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button2];
        
        label2 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, length + 24, length, fontSize + 5)];
        label2.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label2.text = @"Flat-Flight";
        label2.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label2];
        
        button3= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + fontSize + 29) * 1, length, length)];
        [button3 setImage:[UIImage imageNamed:@"蜃気楼.png"] forState:UIControlStateNormal];
        [button3 addTarget:self
                    action:@selector(buttonThree3Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button3];
        
        label3 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 1, length, fontSize + 5)];
        label3.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label3.text = @"蜃気楼";
        label3.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label3];
        
        button4= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + (length + spaceH + fontSize + 29) * 1, length, length)];
        [button4 setImage:[UIImage imageNamed:@"ぽんでっくす.png"] forState:UIControlStateNormal];
        [button4 addTarget:self
                    action:@selector(buttonThree4Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button4];
        
        label4 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 1, length, fontSize + 5)];
        label4.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label4.text = @"ぽんでっくす";
        label4.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label4];
        
        button5= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + fontSize + 29) * 2, length, length)];
        [button5 setImage:[UIImage imageNamed:@"エストレーラ.png"] forState:UIControlStateNormal];
        [button5 addTarget:self
                    action:@selector(buttonThree5Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button5];
        
        label5 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 2, length, fontSize + 5)];
        label5.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label5.text = @"エストレーラ";
        label5.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label5];
        
        button6= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + (length + spaceH + fontSize + 29) * 2, length, length)];
        [button6 setImage:[UIImage imageNamed:@"Яooz-Leef.png"] forState:UIControlStateNormal];
        [button6 addTarget:self
                    action:@selector(buttonThree6Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button6];
        
        label6 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 2, length, fontSize + 5)];
        label6.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label6.text = @"Яooz-Leef";
        label6.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label6];
        
        button7= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + fontSize + 29) * 3, length, length)];
        [button7 setImage:[UIImage imageNamed:@"WEAK-END.png"] forState:UIControlStateNormal];
        [button7 addTarget:self
                    action:@selector(buttonThree7Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button7];
        
        label7 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 3, length, fontSize + 5)];
        label7.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label7.text = @"WEAK END";
        label7.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label7];
        
        button8= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + (length + spaceH + fontSize + 29) * 3, length, length)];
        [button8 setImage:[UIImage imageNamed:@"Million-Dollars.png"] forState:UIControlStateNormal];
        [button8 addTarget:self
                    action:@selector(buttonThree8Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button8];
        
        label8 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 3, length, fontSize + 5)];
        label8.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label8.text = @"Million Dollars";
        label8.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label8];
        
        button9= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + fontSize + 29) * 4, length, length)];
        [button9 setImage:[UIImage imageNamed:@"せいとんがかり.png"] forState:UIControlStateNormal];
        [button9 addTarget:self
                    action:@selector(buttonThree9Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button9];
        
        label9 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 4, length, fontSize + 5)];
        label9.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label9.text = @"せいとんがかり";
        label9.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label9];
        
        button10= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + (length + spaceH + fontSize + 29) * 4, length, length)];
        [button10 setImage:[UIImage imageNamed:@"Chaos-illusion.png"] forState:UIControlStateNormal];
        [button10 addTarget:self
                    action:@selector(buttonThree10Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button10];
        
        label10 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 4, length, fontSize + 5)];
        label10.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label10.text = @"Chaos-illusion";
        label10.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label10];
        
        button11= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + fontSize + 29) * 5, length, length)];
        [button11 setImage:[UIImage imageNamed:@"Addiction？.png"] forState:UIControlStateNormal];
        [button11 addTarget:self
                    action:@selector(buttonThree11Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button11];
        
        label11 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 5, length, fontSize + 5)];
        label11.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label11.text = @"Addiction？";
        label11.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label11];
        
        button12= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + (length + spaceH + fontSize + 29) * 5, length, length)];
        [button12 setImage:[UIImage imageNamed:@"奴等.png"] forState:UIControlStateNormal];
        [button12 addTarget:self
                    action:@selector(buttonThree12Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button12];
        
        label12 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 5, length, fontSize + 5)];
        label12.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label12.text = @"奴等";
        label12.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label12];
        
    
        
        
        
    //講堂･小講堂
    }else if ([_whatList isEqualToString:@"performance"]) {
        
        nav_title.text=@"Performance";
        
        //スクロールの範囲を設定
        [scrollView setContentSize:CGSizeMake(self.view.bounds.size.width, 16 + (length + spaceH + fontSize + 29) * 7)];
        
        button1= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + fontSize + 29) * 0, length, length)];
        [button1 setImage:[UIImage imageNamed:@"Grand-Finale.png"] forState:UIControlStateNormal];
        [button1 addTarget:self
                    action:@selector(buttonFour1Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button1];
        
        label1 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 0, length, fontSize + 5)];
        label1.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label1.text = @"Grand Finale";
        label1.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label1];
        
        button2= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + (length + spaceH + fontSize + 29) * 0, length, length)];
        [button2 setImage:[UIImage imageNamed:@"英語劇講堂劇.png"] forState:UIControlStateNormal];
        [button2 addTarget:self
                    action:@selector(buttonFour2Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button2];
        
        label2 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 0, length, fontSize + 5)];
        label2.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label2.text = @"英語劇";
        label2.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label2];
        
        button3= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + fontSize + 29) * 1, length, length)];
        [button3 setImage:[UIImage imageNamed:@"ボールぽこぽこ.png"] forState:UIControlStateNormal];
        [button3 addTarget:self
                    action:@selector(buttonFour3Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button3];
        
        label3 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 1, length, fontSize + 5)];
        label3.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label3.text = @"ボールぽこぽこ";
        label3.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label3];
        
        button4= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + (length + spaceH + fontSize + 29) * 1, length, length)];
        [button4 setImage:[UIImage imageNamed:@"グリークラブ.png"] forState:UIControlStateNormal];
        [button4 addTarget:self
                    action:@selector(buttonFour4Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button4];
        
        label4 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 1, length, fontSize + 5)];
        label4.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label4.text = @"グリークラブ";
        label4.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label4];
        
        button5= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + fontSize + 29) * 2, length, length)];
        [button5 setImage:[UIImage imageNamed:@"弦楽オーケストラ部.png"] forState:UIControlStateNormal];
        [button5 addTarget:self
                    action:@selector(buttonFour5Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button5];
        
        label5 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 2, length, fontSize + 5)];
        label5.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label5.text = @"弦楽オーケストラ部";
        label5.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label5];
        
        button6= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + (length + spaceH + fontSize + 29) * 2, length, length)];
        [button6 setImage:[UIImage imageNamed:@"恋愛偏差値.png"] forState:UIControlStateNormal];
        [button6 addTarget:self
                    action:@selector(buttonFour6Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button6];
        
        label6 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 2, length, fontSize + 5)];
        label6.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label6.text = @"恋愛偏差値";
        label6.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label6];
        
        button7= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + fontSize + 29) * 3, length, length)];
        [button7 setImage:[UIImage imageNamed:@"校長対談.png"] forState:UIControlStateNormal];
        [button7 addTarget:self
                    action:@selector(buttonFour7Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button7];
        
        label7 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 3, length, fontSize + 5)];
        label7.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label7.text = @"校長対談";
        label7.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label7];
        
        button8= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + (length + spaceH + fontSize + 29) * 3, length, length)];
        [button8 setImage:[UIImage imageNamed:@"吹奏楽部.png"] forState:UIControlStateNormal];
        [button8 addTarget:self
                    action:@selector(buttonFour8Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button8];
        
        label8 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 3, length, fontSize + 5)];
        label8.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label8.text = @"吹奏楽部";
        label8.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label8];
        
        button9= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + fontSize + 29) * 4, length, length)];
        [button9 setImage:[UIImage imageNamed:@"ミュージックサロン.png"] forState:UIControlStateNormal];
        [button9 addTarget:self
                    action:@selector(buttonFour9Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button9];
        
        label9 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 4, length, fontSize + 5)];
        label9.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label9.text = @"ミュージックサロン";
        label9.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label9];
        
        button10= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + (length + spaceH + fontSize + 29) * 4, length, length)];
        [button10 setImage:[UIImage imageNamed:@"天使の歌声.png"] forState:UIControlStateNormal];
        [button10 addTarget:self
                    action:@selector(buttonFour10Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button10];
        
        label10 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 4, length, fontSize + 5)];
        label10.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label10.text = @"天使の歌声";
        label10.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label10];
        
        
        button11= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + fontSize + 29) * 5, length, length)];
        [button11 setImage:[UIImage imageNamed:@"数学研究会模擬講義.png"] forState:UIControlStateNormal];
        [button11 addTarget:self
                    action:@selector(buttonFour11Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button11];
        
        label11 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 5, length, fontSize + 5)];
        label11.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label11.text = @"数学研究会模擬講義";
        label11.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label11];
        
        button12= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + (length + spaceH + fontSize + 29) * 5, length, length)];
        [button12 setImage:[UIImage imageNamed:@"少林寺拳法部演武会.png"] forState:UIControlStateNormal];
        [button12 addTarget:self
                    action:@selector(buttonFour12Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button12];
        
        label12 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 5, length, fontSize + 5)];
        label12.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label12.text = @"少林寺拳法部演武会";
        label12.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label12];
        
        
        button13= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + fontSize + 29) * 6, length, length)];
        [button13 setImage:[UIImage imageNamed:@"剣道部.png"] forState:UIControlStateNormal];
        [button13 addTarget:self
                    action:@selector(buttonFour13Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button13];
        
        label13 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 6, length, fontSize + 5)];
        label13.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label13.text = @"剣道部";
        label13.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label13];
        
        
        
        
        
    //ステージ
    }else if ([_whatList isEqualToString:@"stage"]) {
        
        nav_title.text=@"Stage";
        
        //スクロールの範囲を設定
        [scrollView setContentSize:CGSizeMake(self.view.bounds.size.width, 16 + (length + spaceH + fontSize + 29) * 6)];
        
        button1= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + fontSize + 29) * 0, length, length)];
        [button1 setImage:[UIImage imageNamed:@"フォークダンス.png"] forState:UIControlStateNormal];
        [button1 addTarget:self
                    action:@selector(buttonFive1Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button1];
        
        label1 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 0, length, fontSize + 5)];
        label1.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label1.text = @"フォークダンス";
        label1.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label1];
        
        button2= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16, length, length)];
        [button2 setImage:[UIImage imageNamed:@"春夜祭.png"] forState:UIControlStateNormal];
        [button2 addTarget:self
                    action:@selector(buttonFive2Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button2];
        
        label2 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, length + 24, length, fontSize + 5)];
        label2.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label2.text = @"春夜祭";
        label2.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label2];
        
        button3= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + fontSize + 29) * 1, length, length)];
        [button3 setImage:[UIImage imageNamed:@"Mr.聖光.png"] forState:UIControlStateNormal];
        [button3 addTarget:self
                    action:@selector(buttonFive3Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button3];
        
        label3 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 1, length, fontSize + 5)];
        label3.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label3.text = @"Mr.聖光";
        label3.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label3];
        
        button4= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + (length + spaceH + fontSize + 29) * 1, length, length)];
        [button4 setImage:[UIImage imageNamed:@"Seiko-Dance-Performance.png"] forState:UIControlStateNormal];
        [button4 addTarget:self
                    action:@selector(buttonFive4Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button4];
        
        label4 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 1, length, fontSize + 5)];
        label4.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label4.text = @"Seiko Dance Performance";
        label4.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label4];
        
        button5= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + fontSize + 29) * 2, length, length)];
        [button5 setImage:[UIImage imageNamed:@"のど自慢.png"] forState:UIControlStateNormal];
        [button5 addTarget:self
                    action:@selector(buttonFive5Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button5];
        
        label5 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 2, length, fontSize + 5)];
        label5.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label5.text = @"のど自慢";
        label5.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label5];
        
        button6= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + (length + spaceH + fontSize + 29) * 2, length, length)];
        [button6 setImage:[UIImage imageNamed:@"ギネスに挑戦！！.png"] forState:UIControlStateNormal];
        [button6 addTarget:self
                    action:@selector(buttonFive6Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button6];
        
        label6 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 2, length, fontSize + 5)];
        label6.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label6.text = @"ギネスに挑戦！！";
        label6.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label6];
        
        button7= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + fontSize + 29) * 3, length, length)];
        [button7 setImage:[UIImage imageNamed:@"コミュ力の窓.png"] forState:UIControlStateNormal];
        [button7 addTarget:self
                    action:@selector(buttonFive7Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button7];
        
        label7 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 3, length, fontSize + 5)];
        label7.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label7.text = @"コミュ力の窓";
        label7.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label7];
        
        button8= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + (length + spaceH + fontSize + 29) * 3, length, length)];
        [button8 setImage:[UIImage imageNamed:@"The 笑-1 GP.png"] forState:UIControlStateNormal];
        [button8 addTarget:self
                    action:@selector(buttonFive8Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button8];
        
        label8 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 3, length, fontSize + 5)];
        label8.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label8.text = @"The 笑-1 GP";
        label8.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label8];
        
        button9= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + fontSize + 29) * 4, length, length)];
        [button9 setImage:[UIImage imageNamed:@"替え歌選手権.png"] forState:UIControlStateNormal];
        [button9 addTarget:self
                    action:@selector(buttonFive9Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button9];
        
        label9 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 4, length, fontSize + 5)];
        label9.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label9.text = @"替え歌選手権";
        label9.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label9];
        
        button10= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + (length + spaceH + fontSize + 29) * 4, length, length)];
        [button10 setImage:[UIImage imageNamed:@"○○男子No.1決定戦.png"] forState:UIControlStateNormal];
        [button10 addTarget:self
                    action:@selector(buttonFive10Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button10];
        
        label10 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft + self.view.bounds.size.width / 2, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 4, length, fontSize + 5)];
        label10.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label10.text = @"○○男子No.1決定戦";
        label10.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label10];
        
        button11= [[UIButton alloc]initWithFrame:CGRectMake(spaceLeft, 16 + (length + spaceH + fontSize + 29) * 5, length, length)];
        [button11 setImage:[UIImage imageNamed:@"S-O-S.png"] forState:UIControlStateNormal];
        [button11 addTarget:self
                    action:@selector(buttonFive11Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button11];
        
        label11 = [[UILabel alloc]initWithFrame:CGRectMake(spaceLeft, 16 + length + spaceH + (length + spaceH + fontSize + 29) * 5, length, fontSize + 5)];
        label11.font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
        label11.text = @"S.O.S";
        label11.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label11];
    }
    
    [self.view addSubview:scrollView];
   
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:247.0/255.0 green:59.0/255.0 blue:63.0/255.0 alpha:1.0];
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    
    self.tabBarController.tabBar.barTintColor = [UIColor whiteColor];
    self.tabBarController.tabBar.tintColor = [UIColor colorWithRed:247.0/255.0 green:59.0/255.0 blue:63.0/255.0 alpha:1.0];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc]init];
    backButtonItem.title = @"";
    self.navigationItem.backBarButtonItem = backButtonItem;
    
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


//趣味研
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

-(void)buttonTwo7Detail:(UIButton *)button{
    whichList = @"display";
    flag = 7;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo8Detail:(UIButton *)button{
    whichList = @"display";
    flag = 8;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo9Detail:(UIButton *)button{
    whichList = @"display";
    flag = 9;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo10Detail:(UIButton *)button{
    whichList = @"display";
    flag = 10;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo11Detail:(UIButton *)button{
    whichList = @"display";
    flag = 11;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo12Detail:(UIButton *)button{
    whichList = @"display";
    flag = 12;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo13Detail:(UIButton *)button{
    whichList = @"display";
    flag = 13;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo14Detail:(UIButton *)button{
    whichList = @"display";
    flag = 14;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo15Detail:(UIButton *)button{
    whichList = @"display";
    flag = 15;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo16Detail:(UIButton *)button{
    whichList = @"display";
    flag = 16;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo17Detail:(UIButton *)button{
    whichList = @"display";
    flag = 17;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo18Detail:(UIButton *)button{
    whichList = @"display";
    flag = 18;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo19Detail:(UIButton *)button{
    whichList = @"display";
    flag = 19;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo20Detail:(UIButton *)button{
    whichList = @"display";
    flag = 20;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo21Detail:(UIButton *)button{
    whichList = @"display";
    flag = 21;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo22Detail:(UIButton *)button{
    whichList = @"display";
    flag = 22;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo23Detail:(UIButton *)button{
    whichList = @"display";
    flag = 23;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo24Detail:(UIButton *)button{
    whichList = @"display";
    flag = 24;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo25Detail:(UIButton *)button{
    whichList = @"display";
    flag = 25;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo26Detail:(UIButton *)button{
    whichList = @"display";
    flag = 26;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo27Detail:(UIButton *)button{
    whichList = @"display";
    flag = 27;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo28Detail:(UIButton *)button{
    whichList = @"display";
    flag = 28;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo29Detail:(UIButton *)button{
    whichList = @"display";
    flag = 29;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo30Detail:(UIButton *)button{
    whichList = @"display";
    flag = 30;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo31Detail:(UIButton *)button{
    whichList = @"display";
    flag = 31;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo32Detail:(UIButton *)button{
    whichList = @"display";
    flag = 32;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo33Detail:(UIButton *)button{
    whichList = @"display";
    flag = 33;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo34Detail:(UIButton *)button{
    whichList = @"display";
    flag = 34;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo35Detail:(UIButton *)button{
    whichList = @"display";
    flag = 35;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo36Detail:(UIButton *)button{
    whichList = @"display";
    flag = 36;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo37Detail:(UIButton *)button{
    whichList = @"display";
    flag = 37;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo38Detail:(UIButton *)button{
    whichList = @"display";
    flag = 38;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo39Detail:(UIButton *)button{
    whichList = @"display";
    flag = 39;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo40Detail:(UIButton *)button{
    whichList = @"display";
    flag = 40;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonTwo41Detail:(UIButton *)button{
    whichList = @"display";
    flag = 41;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}


//バンド
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
    flag = 6;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonThree7Detail:(UIButton *)button{
    whichList = @"band";
    flag = 7;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonThree8Detail:(UIButton *)button{
    whichList = @"band";
    flag = 8;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonThree9Detail:(UIButton *)button{
    whichList = @"band";
    flag = 9;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonThree10Detail:(UIButton *)button{
    whichList = @"band";
    flag = 10;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonThree11Detail:(UIButton *)button{
    whichList = @"band";
    flag = 11;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonThree12Detail:(UIButton *)button{
    whichList = @"band";
    flag = 12;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}


//講堂･小講堂
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
    flag = 6;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonFour7Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 7;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonFour8Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 8;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonFour9Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 9;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonFour10Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 10;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonFour11Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 11;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonFour12Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 12;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonFour13Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 13;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}


//ステージ
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

-(void)buttonFive7Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 7;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonFive8Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 8;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonFive9Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 9;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonFive10Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 10;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonFive11Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 11;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailView *detailView = segue.destinationViewController;
    detailView.flag = flag;
    detailView.whatList = whichList;
    
}


@end
