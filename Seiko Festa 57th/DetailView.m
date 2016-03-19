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
            
            detailImage = [UIImage imageNamed:@"講堂劇 アイコン.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"お好み焼き";
            _explainSentence.text = @"レミゼ見ながらお好み焼きbb";
        }
        else if (flag == 2) {
            detailImage = [UIImage imageNamed:@"ウータン.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"お好み焼き";
            _explainSentence.text = @"ウータン ate お好み焼き.";
        }
        else if (flag == 3) {
            detailImage = [UIImage imageNamed:@"お好み焼き.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"お好み焼き";
            _explainSentence.text = @"おいしいお好み焼きです!";
        }
        else if (flag == 4) {
            detailImage = [UIImage imageNamed:@"お好み焼き.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"お好み焼き";
            _explainSentence.text = @"おいしいお好み焼きです!";
        }
        else if (flag == 5) {
            detailImage = [UIImage imageNamed:@"お好み焼き.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"お好み焼き";
            _explainSentence.text = @"おいしいお好み焼きです!";
        }
        
    }else if ([_whatList isEqualToString:@"display"]) {
        
        _navigationBar.title = @"Display";
        
        if (flag == 1) {
            detailImage = [UIImage imageNamed:@"お好み焼き.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"お好み焼き";
            _explainSentence.text = @"おいしいお好み焼きです!";
        }
        else if (flag == 2) {
            detailImage = [UIImage imageNamed:@"ウータン.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"英語劇";
            _explainSentence.text = @"かわいいウータンが待ってます!";
        }
        else if (flag == 3) {
            detailImage = [UIImage imageNamed:@"お好み焼き.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"お好み焼き";
            _explainSentence.text = @"おいしいお好み焼きです!";
        }
        else if (flag == 4) {
            detailImage = [UIImage imageNamed:@"お好み焼き.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"お好み焼き";
            _explainSentence.text = @"おいしいお好み焼きです!";
        }
        else if (flag == 5) {
            detailImage = [UIImage imageNamed:@"お好み焼き.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"お好み焼き";
            _explainSentence.text = @"おいしいお好み焼きです!";
        }
        
    }else if ([_whatList isEqualToString:@"band"]) {
        
        _navigationBar.title = @"Band";
        
        if (flag == 1) {
            detailImage = [UIImage imageNamed:@"お好み焼き.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"お好み焼き";
            _explainSentence.text = @"おいしいお好み焼きです!";
        }
        else if (flag == 2) {
            detailImage = [UIImage imageNamed:@"ウータン.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"英語劇";
            _explainSentence.text = @"かわいいウータンが待ってます!";
        }
        else if (flag == 3) {
            detailImage = [UIImage imageNamed:@"お好み焼き.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"お好み焼き";
            _explainSentence.text = @"おいしいお好み焼きです!";
        }
        else if (flag == 4) {
            detailImage = [UIImage imageNamed:@"お好み焼き.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"お好み焼き";
            _explainSentence.text = @"おいしいお好み焼きです!";
        }
        else if (flag == 5) {
            detailImage = [UIImage imageNamed:@"お好み焼き.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"お好み焼き";
            _explainSentence.text = @"おいしいお好み焼きです!";
        }
        
    }else if ([_whatList isEqualToString:@"performance"]) {
        
        _navigationBar.title = @"Performance";
        
        if (flag == 1) {
            detailImage = [UIImage imageNamed:@"お好み焼き.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"お好み焼き";
            _explainSentence.text = @"おいしいお好み焼きです!";
        }
        else if (flag == 2) {
            detailImage = [UIImage imageNamed:@"ウータン.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"英語劇";
            _explainSentence.text = @"かわいいウータンが待ってます!";
        }
        else if (flag == 3) {
            detailImage = [UIImage imageNamed:@"お好み焼き.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"お好み焼き";
            _explainSentence.text = @"おいしいお好み焼きです!";
        }
        else if (flag == 4) {
            detailImage = [UIImage imageNamed:@"お好み焼き.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"お好み焼き";
            _explainSentence.text = @"おいしいお好み焼きです!";
        }
        else if (flag == 5) {
            detailImage = [UIImage imageNamed:@"お好み焼き.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"お好み焼き";
            _explainSentence.text = @"おいしいお好み焼きです!";
        }
        
    }else if ([_whatList isEqualToString:@"stage"]) {
        
        _navigationBar.title = @"Stage";
        
        if (flag == 1) {
            detailImage = [UIImage imageNamed:@"お好み焼き.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"お好み焼き";
            _explainSentence.text = @"おいしいお好み焼きです!";
        }
        else if (flag == 2) {
            detailImage = [UIImage imageNamed:@"ウータン.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"英語劇";
            _explainSentence.text = @"かわいいウータンが待ってます!";
        }
        else if (flag == 3) {
            detailImage = [UIImage imageNamed:@"お好み焼き.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"お好み焼き";
            _explainSentence.text = @"おいしいお好み焼きです!";
        }
        else if (flag == 4) {
            detailImage = [UIImage imageNamed:@"お好み焼き.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"お好み焼き";
            _explainSentence.text = @"おいしいお好み焼きです!";
        }
        else if (flag == 5) {
            detailImage = [UIImage imageNamed:@"お好み焼き.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"お好み焼き";
            _explainSentence.text = @"おいしいお好み焼きです!";
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
