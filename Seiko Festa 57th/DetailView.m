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
            
            detailImage = [UIImage imageNamed:@"麺☆恋.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"麺☆恋";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.text = @"美味しいソース焼きそばです！";
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 2) {
            detailImage = [UIImage imageNamed:@"塩焼きそば　麺’sRUNRUN.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"麺’sRUNRUN";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.text = @"美味しい塩焼きそばです！";
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 3) {
            detailImage = [UIImage imageNamed:@"鉄板職人.jpg"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"鉄板職人";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.text = @"美味しいお好み焼きです!";
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 4) {
            detailImage = [UIImage imageNamed:@"俺のケバブ.jpg"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"俺のケバブ";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.text = @"美味しいケバブです！";
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 5) {
            detailImage = [UIImage imageNamed:@"クレープブレーク.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"クレープブレーク";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.text = @"美味しいクレープです!";
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 6) {
            detailImage = [UIImage imageNamed:@"Flapjack.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"Flapjack";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.text = @"美味しいパンケーキです!";
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
            detailImage = [UIImage imageNamed:@"Trick×Hark.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"Trick×Hark";
            _explainSentence.text = @"素晴らしいマジックです!";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
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
            detailImage = [UIImage imageNamed:@"Chaos-illusion.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"Chaos-illusion";
            _explainSentence.text = @"Chaosです!";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 2) {
            detailImage = [UIImage imageNamed:@"Flat-Flight.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"Flat-Flight";
            _explainSentence.text = @"素晴らしくFlat?です!";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 3) {
            detailImage = [UIImage imageNamed:@"M&A.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"M&A";
            _explainSentence.text = @"素晴らしいバンドです！";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 4) {
            detailImage = [UIImage imageNamed:@"WEAK-END.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"WEAK-END";
            _explainSentence.text = @"素晴らしいWEAK-END！";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 5) {
            detailImage = [UIImage imageNamed:@"エストレーラ.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"エストレーラ";
            _explainSentence.text = @"素晴らしいバンドです!";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 6) {
            detailImage = [UIImage imageNamed:@"蜃気楼.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"蜃気楼";
            _explainSentence.text = @"素晴らしいバンドです!";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        
    }else if ([_whatList isEqualToString:@"performance"]) {
        
        _navigationBar.title = @"Performance";
        
        if (flag == 1) {
            detailImage = [UIImage imageNamed:@"Grand-Finale.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"Grand-Finale";
            _explainSentence.text = @"聖光祭の最後を彩るのはGrand-Finale!";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 2) {
            detailImage = [UIImage imageNamed:@"英語劇講堂劇.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"英語劇";
            _explainSentence.text = @"講堂にも来てね!";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 3) {
            detailImage = [UIImage imageNamed:@"ボールぽこぽこ.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"ボールぽこぽこ";
            _explainSentence.text = @"素晴らしい曲芸です!";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 4) {
            detailImage = [UIImage imageNamed:@"校長対談.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"校長対談";
            _explainSentence.text = @"校長先生とお話し!";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 5) {
            detailImage = [UIImage imageNamed:@"ミュージックサロン.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"ミュージックサロン";
            _explainSentence.text = @"素晴らしい音色です!";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 6) {
            detailImage = [UIImage imageNamed:@"グリークラブ.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"グリークラブ";
            _explainSentence.text = @"素晴らしい歌声です!";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        
    }else if ([_whatList isEqualToString:@"stage"]) {
        
        _navigationBar.title = @"Stage";
        
        if (flag == 1) {
            detailImage = [UIImage imageNamed:@"春夜祭.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"春夜祭";
            _explainSentence.text = @"初日の最後は春夜祭!";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 2) {
            detailImage = [UIImage imageNamed:@"フォークダンス.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"フォークダンス";
            _explainSentence.text = @"踊って騒げ!";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 3) {
            detailImage = [UIImage imageNamed:@"○○男子No.1決定戦.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"○○男子No.1決定戦";
            _explainSentence.text = @"○○男子No.1は誰だ!?";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 4) {
            detailImage = [UIImage imageNamed:@"Mr.聖光.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"Mr.聖光";
            _explainSentence.text = @"Mr.聖光は誰だ!?";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 5) {
            detailImage = [UIImage imageNamed:@"S-O-S.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"S-O-S";
            _explainSentence.text = @"Help me!";
            _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
            _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        }
        else if (flag == 6) {
            detailImage = [UIImage imageNamed:@"替え歌選手権.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"替え歌選手権";
            _explainSentence.text = @"替え歌No.1は誰だ!？";
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
