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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (flag == 1) {
        UIImage *image = [UIImage imageNamed:@"お好み焼き.jpg"];
        _detailImage.image = image;
        _navigationBar.title = @"SchoolFesta";
        _detailTitle.text = @"お好み焼き";
        _explainSentence.text = @"おいしいお好み焼きです!";
    } else if (flag == 2) {
        UIImage *image = [UIImage imageNamed:@"ウータン.png"];
        _detailImage.image = image;
        _navigationBar.title = @"SchoolFesta";
        _detailTitle.text = @"英語劇";
        _explainSentence.text = @"かわいいウータンが待ってます!";
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

@end
