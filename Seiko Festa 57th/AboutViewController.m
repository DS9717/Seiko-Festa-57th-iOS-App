//
//  AboutViewController.m
//  Seiko Festa 57th
//
//  Created by Daisuke  on 2016/04/06.
//  Copyright (c) 2016年 Daisuke Masuda. All rights reserved.
//

#import "AboutViewController.h"
#import "InfoViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController
@synthesize _cellNumber=cellNumber;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:140.0/255.0 green:23.0/255.0 blue:26.0/255.0 alpha:1.0];
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    self.tabBarController.tabBar.barTintColor = [UIColor whiteColor];
    self.tabBarController.tabBar.tintColor = [UIColor colorWithRed:167.0/255.0 green:17.0/255.0 blue:23.0/255.0 alpha:1.0];
    
    //Navigation Itemのタイトルのフォントを設定
    UILabel *nav_title=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.navigationItem.titleView.frame.size.width,40)];
    nav_title.textColor=[UIColor whiteColor];
    
    nav_title.textAlignment=NSTextAlignmentCenter;
    
    [nav_title setFont:[UIFont fontWithName:@"MyriadPro-Regular" size:22]];
    self.navigationItem.titleView=nav_title;
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc]init];
    backButtonItem.title = @"";
    self.navigationItem.backBarButtonItem = backButtonItem;
    
    //画面サイズ取得
    UIScreen *sc = [UIScreen mainScreen];
    
    //ステータスバー込みのサイズ
    CGRect rect = sc.bounds;
    
    
    if (cellNumber==0) {
        
        UIImageView *iconView = [[UIImageView alloc]init];
        iconView.image = [UIImage imageNamed:@"Icon.png"];
        
        UILabel *seikoFesta = [[UILabel alloc]init];
        seikoFesta.text = @"Seiko Festa";
        seikoFesta.textAlignment = NSTextAlignmentCenter;
        
        UILabel *designedBy = [[UILabel alloc]init];
        designedBy.text = @"Designed by";
        designedBy.textAlignment = NSTextAlignmentCenter;
        
        UILabel *designers = [[UILabel alloc]init];
        designers.text = @"Daisuke Masuda, Yuya Imanari";
        designers.textAlignment = NSTextAlignmentCenter;
        
        nav_title.text=@"About";
        
        
        if (rect.size.height==480) {
            
            iconView.frame = CGRectMake(110, 60, 100, 100);
            
            seikoFesta.frame = CGRectMake(0, 170, self.view.bounds.size.width, 22);
            seikoFesta.font = designedBy.font = [UIFont fontWithName:@"MyriadPro-Regular" size:22];
            
            designedBy.frame = CGRectMake(0, 270, self.view.bounds.size.width, 20);
            designedBy.font = [UIFont fontWithName:@"MyriadPro-Regular" size:18];
            
            designers.frame = CGRectMake(0, 300, self.view.bounds.size.width, 20);
            designers.font = [UIFont fontWithName:@"MyriadPro-Regular" size:18];
            
        }else if (rect.size.height==568) {
            
            iconView.frame = CGRectMake(110, 70, 100, 100);
            
            seikoFesta.frame = CGRectMake(0, 180, self.view.bounds.size.width, 22);
            seikoFesta.font = designedBy.font = [UIFont fontWithName:@"MyriadPro-Regular" size:22];
            
            designedBy.frame = CGRectMake(0, 320, self.view.bounds.size.width, 20);
            designedBy.font = [UIFont fontWithName:@"MyriadPro-Regular" size:18];
            
            designers.frame = CGRectMake(0, 350, self.view.bounds.size.width, 20);
            designers.font = [UIFont fontWithName:@"MyriadPro-Regular" size:18];
            
            
        }else if (rect.size.height==667) {
            
            iconView.frame = CGRectMake(130, 80, 115, 115);
            
            seikoFesta.frame = CGRectMake(0, 210, self.view.bounds.size.width, 25);
            seikoFesta.font = designedBy.font = [UIFont fontWithName:@"MyriadPro-Regular" size:25];
            
            designedBy.frame = CGRectMake(0, 375, self.view.bounds.size.width, 23);
            designedBy.font = [UIFont fontWithName:@"MyriadPro-Regular" size:21];
            
            designers.frame = CGRectMake(0, 410, self.view.bounds.size.width, 23);
            designers.font = [UIFont fontWithName:@"MyriadPro-Regular" size:21];
            
        }else if (rect.size.height==736) {
            
            iconView.frame = CGRectMake(142, 90, 130, 130);
            
            seikoFesta.frame = CGRectMake(0, 235, self.view.bounds.size.width, 28);
            seikoFesta.font = designedBy.font = [UIFont fontWithName:@"MyriadPro-Regular" size:28];
            
            designedBy.frame = CGRectMake(0, 410, self.view.bounds.size.width, 26);
            designedBy.font = [UIFont fontWithName:@"MyriadPro-Regular" size:23];
            
            designers.frame = CGRectMake(0, 450, self.view.bounds.size.width, 26);
            designers.font = [UIFont fontWithName:@"MyriadPro-Regular" size:23];
        }
        
        [self.view addSubview:iconView];
        [self.view addSubview:seikoFesta];
        [self.view addSubview:designedBy];
        [self.view addSubview:designers];
        
    }else if (cellNumber==1){
        
        nav_title.text=@"Access";
        
        UIImageView *access = [[UIImageView alloc]init];
        access.image = [UIImage imageNamed:@"Access.png"];
        
        UITextView *textView = [[UITextView alloc]init];
        textView.text = @"4/30 - 5/1\n聖光学院中学校高等学校\n\n〒231-0837\n横浜市中区滝之上100番地\n(Tel) 045-621-2051\nJR根岸線山手駅徒歩8分";
        textView.editable = NO;
        textView.selectable=NO;
        
        if (rect.size.height==480) {
            
            access.frame = CGRectMake(40, 20, 240, 240 * 13 / 16);
            
            textView.frame = CGRectMake(30, 220, 260, 210);
            textView.font = [UIFont fontWithName:@"MyriadPro-Regular" size:13];
        
        }else if (rect.size.height==568) {
            
            access.frame = CGRectMake(30, 30, 260, 260 * 13 / 16);
            
            textView.frame = CGRectMake(30, 270, 260, 260);
            textView.font = [UIFont fontWithName:@"MyriadPro-Regular" size:16];
            
        }else if (rect.size.height==667) {
            
            access.frame = CGRectMake(35, 35, 300, 300 * 13 / 16);
            
            textView.frame = CGRectMake(35, 315, 300, 300);
            textView.font = [UIFont fontWithName:@"MyriadPro-Regular" size:16];
            
        }else if (rect.size.height==736) {
            
            access.frame = CGRectMake(40, 40, 334, 334 * 13 / 16);
            
            textView.frame = CGRectMake(40, 350, 334, 334);
            textView.font = [UIFont fontWithName:@"MyriadPro-Regular" size:16];
        }
        
        [self.view addSubview:access];
        [self.view addSubview:textView];
        
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
