//
//  DetailView.m
//  Seiko Festa 57th
//
//  Created by Yuya Imanari on 2016/01/25(月).
//  Copyright © 2016年 Daisuke Masuda. All rights reserved.
//

#import "DetailView.h"

@interface DetailView ()

@end

@implementation DetailView
@synthesize flag;
@synthesize whatList = _whatList;

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    //[imageScroll setContentSize:CGSizeMake(540, 220)];
    
    imageScroll = [[UIScrollView alloc]init];
    imageScroll.frame = CGRectMake(0, 120, 320, 220);
    //横スクロールのインジケータを非表示にする
    imageScroll.showsHorizontalScrollIndicator = NO;
    imageScroll.userInteractionEnabled = YES;
    imageScroll.directionalLockEnabled = YES;
    imageScroll.bounces = NO;
    imageScroll.pagingEnabled = YES;
    imageScroll.backgroundColor = [UIColor clearColor];
    //スクロールの範囲を設定
    [imageScroll setContentSize:CGSizeMake(640, 220)];

    
    if ([_whatList isEqualToString:@"food"]) {
        
        _navigationBar.title = @"Food";
        
        if (flag == 1) {
            detailImage = [UIImage imageNamed:@"鉄板職人.jpg"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"鉄板職人";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.text = @"";
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 2) {
            detailImage = [UIImage imageNamed:@"塩焼きそば　麺’sRUNRUN.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"麺’sRUNRUN";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.text = @"";
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 3) {
            detailImage = [UIImage imageNamed:@"麺☆恋.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"麺☆恋";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.text = @"";
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 4) {
            detailImage = [UIImage imageNamed:@"俺のケバブ.jpg"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"俺のケバブ";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.text = @"";
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 5) {
            detailImage = [UIImage imageNamed:@"鳥角.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"鳥角";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.text = @"";
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 6) {
            detailImage = [UIImage imageNamed:@"クレープブレーク.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"クレープブレーク";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.text = @"";
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 7) {
            detailImage = [UIImage imageNamed:@"Flapjack.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"Flapjack";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.text = @"";
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 8) {
            detailImage = [UIImage imageNamed:@"chocolat-π.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"chocolat π";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.text = @"";
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 9) {
            detailImage = [UIImage imageNamed:@"Juicy-Juicer.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"Juicy Juicer";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.text = @"";
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 10) {
            detailImage = [UIImage imageNamed:@"綿's-candy.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"綿's Candy";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.text = @"";
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 11) {
            detailImage = [UIImage imageNamed:@"氷菓.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"氷菓";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.text = @"";
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 12) {
            detailImage = [UIImage imageNamed:@"山手の泉.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"山手の泉";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.text = @"";
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 13) {
            detailImage = [UIImage imageNamed:@"題名のない音楽喫茶.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"題名のない音楽喫茶";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.text = @"";
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 14) {
            detailImage = [UIImage imageNamed:@"駅弁.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"駅弁";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.text = @"";
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        
    }else if ([_whatList isEqualToString:@"display"]) {
        
        _navigationBar.title = @"Display";
        
        if (flag == 1) {
            detailImage = [UIImage imageNamed:@"英語劇.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"英語劇";
            _explainSentence.text = @"素晴らしい英語劇です!";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 2) {
            detailImage = [UIImage imageNamed:@"高3英語劇.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"高3英語劇";
            _explainSentence.text = @"素晴らしい高3英語劇!";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 3) {
            detailImage = [UIImage imageNamed:@"迷いの国のアリス.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"迷いの国のアリス";
            _explainSentence.text = @"素晴らしいアリスです!";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 4) {
            detailImage = [UIImage imageNamed:@"Trick×Hark.jpg"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"Trick×Hark";
            _explainSentence.text = @"素晴らしいマジックです!";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 5) {
            detailImage = [UIImage imageNamed:@"インターアクト.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"インターアクトクラブ";
            _explainSentence.text = @"素晴らしいインターアクトクラブです!";
        }
        else if (flag == 6) {
            detailImage = [UIImage imageNamed:@"インターアクト.JPG"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"インターアクトクラブ";
            _explainSentence.text = @"素晴らしいインターアクトクラブです!";
        }
        else if (flag == 5) {
            detailImage = [UIImage imageNamed:@"インターアクト.JPG"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"インターアクトクラブ";
            _explainSentence.text = @"素晴らしいインターアクトクラブです!";
        }
        else if (flag == 5) {
            detailImage = [UIImage imageNamed:@"インターアクト.JPG"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"インターアクトクラブ";
            _explainSentence.text = @"素晴らしいインターアクトクラブです!";
        }
        else if (flag == 5) {
            detailImage = [UIImage imageNamed:@"インターアクト.JPG"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"インターアクトクラブ";
            _explainSentence.text = @"素晴らしいインターアクトクラブです!";
        }
        else if (flag == 5) {
            detailImage = [UIImage imageNamed:@"インターアクト.JPG"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"インターアクトクラブ";
            _explainSentence.text = @"素晴らしいインターアクトクラブです!";
        }
        else if (flag == 5) {
            detailImage = [UIImage imageNamed:@"インターアクト.JPG"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"インターアクトクラブ";
            _explainSentence.text = @"素晴らしいインターアクトクラブです!";
        }
        else if (flag == 5) {
            detailImage = [UIImage imageNamed:@"インターアクト.JPG"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"インターアクトクラブ";
            _explainSentence.text = @"素晴らしいインターアクトクラブです!";
        }
        
    }else if ([_whatList isEqualToString:@"band"]) {
        
        _navigationBar.title = @"Band";
        
        if (flag == 1) {
            detailImage = [UIImage imageNamed:@"M&A.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"M&A";
            _explainSentence.text = @"";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 2) {
            detailImage = [UIImage imageNamed:@"Flat-Flight.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"Flat-Flight";
            _explainSentence.text = @"";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 3) {
            detailImage = [UIImage imageNamed:@"蜃気楼.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"蜃気楼";
            _explainSentence.text = @"";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 4) {
            detailImage = [UIImage imageNamed:@"ぽんでっくす.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"ぽんでっくす";
            _explainSentence.text = @"";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 5) {
            detailImage = [UIImage imageNamed:@"エストレーラ.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"エストレーラ";
            _explainSentence.text = @"";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 6) {
            detailImage = [UIImage imageNamed:@"Яooz-Leef.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"Яooz-Leef";
            _explainSentence.text = @"";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 7) {
            detailImage = [UIImage imageNamed:@"WEAK-END.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"WEAK END";
            _explainSentence.text = @"素晴らしいバンドです!";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 8) {
            detailImage = [UIImage imageNamed:@"Million-Dollars.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"Million Dollars";
            _explainSentence.text = @"";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 9) {
            detailImage = [UIImage imageNamed:@"Coming-Soon.jpg"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"せいとんがかり";
            _explainSentence.text = @"";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 10) {
            detailImage = [UIImage imageNamed:@"Chaos-illusion.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"Chaos illusion";
            _explainSentence.text = @"";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 11) {
            detailImage = [UIImage imageNamed:@"Addiction？.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"Addiction？";
            _explainSentence.text = @"";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 12) {
            detailImage = [UIImage imageNamed:@"奴等.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"奴等";
            _explainSentence.text = @"";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        
    }else if ([_whatList isEqualToString:@"performance"]) {
        
        _navigationBar.title = @"Performance";
        
        if (flag == 1) {
            detailImage = [UIImage imageNamed:@"Grand-Finale.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"Grand Finale";
            _explainSentence.text = @"";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 2) {
            detailImage = [UIImage imageNamed:@"英語劇講堂劇.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"英語劇";
            _explainSentence.text = @"";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 3) {
            detailImage = [UIImage imageNamed:@"ボールぽこぽこ.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"ボールぽこぽこ";
            _explainSentence.text = @"";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 4) {
            detailImage = [UIImage imageNamed:@"グリークラブ.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"グリークラブ";
            _explainSentence.text = @"";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 5) {
            detailImage = [UIImage imageNamed:@"弦楽オーケストラ部.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"弦楽オーケストラ部";
            _explainSentence.text = @"";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 6) {
            detailImage = [UIImage imageNamed:@"恋愛偏差値.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"恋愛偏差値";
            _explainSentence.text = @"";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 7) {
            detailImage = [UIImage imageNamed:@"校長対談.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"校長対談";
            _explainSentence.text = @"";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 8) {
            detailImage = [UIImage imageNamed:@"吹奏楽部.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"吹奏楽部";
            _explainSentence.text = @"";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 9) {
            detailImage = [UIImage imageNamed:@"ミュージックサロン.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"ミュージックサロン";
            _explainSentence.text = @"";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 10) {
            detailImage = [UIImage imageNamed:@"天使の歌声.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"天使の歌声";
            _explainSentence.text = @"";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 11) {
            detailImage = [UIImage imageNamed:@"数学研究会模擬講義.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"数学研究会模擬講義";
            _explainSentence.text = @"";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 12) {
            detailImage = [UIImage imageNamed:@"少林寺拳法部演武会.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"少林寺拳法部演武会";
            _explainSentence.text = @"";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 13) {
            detailImage = [UIImage imageNamed:@"剣道部.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"剣道部";
            _explainSentence.text = @"";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        
    }else if ([_whatList isEqualToString:@"stage"]) {
        
        _navigationBar.title = @"Stage";
        
        if (flag == 1) {
            detailImage = [UIImage imageNamed:@"フォークダンス.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"フォークダンス";
            _explainSentence.text = @"";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 2) {
            detailImage = [UIImage imageNamed:@"春夜祭.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"春夜祭";
            _explainSentence.text = @"";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 3) {
            detailImage = [UIImage imageNamed:@"Mr.聖光.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"Mr.聖光";
            _explainSentence.text = @"";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 4) {
            detailImage = [UIImage imageNamed:@"Seiko-Dance-Performance.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"Seiko Dance Performance";
            _explainSentence.text = @"";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 5) {
            detailImage = [UIImage imageNamed:@"のど自慢.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"のど自慢";
            _explainSentence.text = @"";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 6) {
            detailImage = [UIImage imageNamed:@"ギネスに挑戦！！.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"ギネスに挑戦！！";
            _explainSentence.text = @"";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 7) {
            detailImage = [UIImage imageNamed:@"コミュ力の窓.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"コミュ力の窓";
            _explainSentence.text = @"";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 8) {
            detailImage = [UIImage imageNamed:@"The 笑-1 GP.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"The 笑-1 GP";
            _explainSentence.text = @"";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 9) {
            detailImage = [UIImage imageNamed:@"替え歌選手権.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"替え歌選手権";
            _explainSentence.text = @"";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 10) {
            detailImage = [UIImage imageNamed:@"○○男子No.1決定戦.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"○○男子No.1決定戦";
            _explainSentence.text = @"";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 11) {
            detailImage = [UIImage imageNamed:@"S-O-S.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"S.O.S.";
            _explainSentence.text = @"";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
    }
    
    self.navigationController.navigationBar.tintColor=[UIColor orangeColor];

    right = [[UIButton alloc]initWithFrame:CGRectMake(270, 0, 50, 220)];
    [right setImage:[UIImage imageNamed:@"Right.png"] forState:UIControlStateNormal];
    [right addTarget:self
                   action:@selector(righton:) forControlEvents:UIControlEventTouchUpInside];
    [imageScroll addSubview:right];

    left = [[UIButton alloc]initWithFrame:CGRectMake(320, 0, 50, 220)];
    [left setImage:[UIImage imageNamed:@"Left.png"] forState:UIControlStateNormal];
    [left addTarget:self
              action:@selector(lefton:) forControlEvents:UIControlEventTouchUpInside];
    [imageScroll addSubview:left];
    
    
    detailImageview = [[UIImageView alloc] initWithFrame:CGRectMake(50, 0, 220, 220)];
    detailImageview.image = detailImage;
    mapImageview = [[UIImageView alloc] initWithFrame:CGRectMake(370, 0, 220, 220)];
    mapImageview.image = mapImage;
    [imageScroll addSubview:detailImageview];
    [imageScroll addSubview:mapImageview];
    
    [self.view addSubview:imageScroll];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)righton:(UIButton *)button{
    [imageScroll scrollRectToVisible:CGRectMake(320, 0, 320, 220) animated:YES];
}

-(void)lefton:(UIButton *)button{
    [imageScroll scrollRectToVisible:CGRectMake(0, 0, 270, 220) animated:YES];
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
