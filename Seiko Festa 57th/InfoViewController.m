//
//  InfoViewController.m
//  Seiko Festa 57th
//
//  Created by Daisuke  on 2016/04/05.
//  Copyright (c) 2016年 Daisuke Masuda. All rights reserved.
//

#import "InfoViewController.h"
#import "AboutViewController.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:140.0/255.0 green:23.0/255.0 blue:26.0/255.0 alpha:1.0];
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    self.tabBarController.tabBar.barTintColor = [UIColor whiteColor];
    self.tabBarController.tabBar.tintColor = [UIColor colorWithRed:167.0/255.0 green:17.0/255.0 blue:23.0/255.0 alpha:1.0];
    
    //Navigation Itemのタイトルのフォントを設定
    UILabel *nav_title=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.navigationItem.titleView.frame.size.width,40)];
    nav_title.text=@"Info";
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


//セクションの数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//セクションの名前
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"";
}

//行数を指定
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

//一つ一つのセルのデータを返す
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // "cell"というkeyでcellデータを取得
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    // cellデータが無い場合、UITableViewCellを生成して、"cell"というkeyでキャッシュする
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    if(indexPath.row == 0) {
        cell.textLabel.text = @"このアプリについて";
    }else if(indexPath.row == 1){
        cell.textLabel.text = @"アクセス";
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES]; // 選択状態の解除をします。
    if(indexPath.section == 0) { // 1個目のセクションです。
        if(indexPath.row == 0) {
            
            cellNumber=0;
            
            [self performSegueWithIdentifier:@"About" sender:self];
            
        }else if(indexPath.row == 1) {
            
            cellNumber=1;
            
            [self performSegueWithIdentifier:@"About" sender:self];
            
        }
        
    }
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //2つ目の画面にパラメータを渡して遷移する
    if ([segue.identifier isEqualToString:@"About"]) {
        //ここでパラメータを渡す
        AboutViewController *aboutViewController = segue.destinationViewController;
        aboutViewController._cellNumber=cellNumber;
        
    }
    
}


@end
