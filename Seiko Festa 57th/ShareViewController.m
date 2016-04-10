//
//  ShareViewController.m
//  Seiko Festa 57th
//
//  Created by Daisuke  on 2016/03/30.
//  Copyright (c) 2016年 Daisuke Masuda. All rights reserved.
//

#import "ShareViewController.h"

@interface ShareViewController ()

@end

@implementation ShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //iOSのバージョンで分岐
    iOSVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    
    //iOS8以降
    if(iOSVersion >= 8.0f){
        
        //ブラースタイルの決定
        UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        //VisualEffectViewにVisualEffectを設定
        UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        //VisualEffectViewを_blurViewと同じサイズに設定
        effectView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        
        //_blurViewにVisualEffectViewを追加
        [self.view addSubview:effectView];
        
        onTabBarView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height - 49, self.view.bounds.size.width, 49)];
        onTabBarView.backgroundColor = [UIColor clearColor];
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [appDelegate.window addSubview:onTabBarView];
        
    }
    
    facebookButton = [[UIButton alloc]init];
    [facebookButton setImage:[UIImage imageNamed:@"Facebook icon.png"] forState:UIControlStateNormal];
    [facebookButton addTarget:self
                       action:@selector(shareOnFacebook:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:facebookButton];
    
    
    twitterButton = [[UIButton alloc]init];
    [twitterButton setImage:[UIImage imageNamed:@"Twitter icon.png"] forState:UIControlStateNormal];
    [twitterButton addTarget:self
                      action:@selector(shareOnTwitter:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:twitterButton];
    
    lineButton = [[UIButton alloc]init];
    [lineButton setImage:[UIImage imageNamed:@"LINE icon.png"] forState:UIControlStateNormal];
    [lineButton addTarget:self
                   action:@selector(shareOnLINE:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:lineButton];
    
    cancelButton = [[UIButton alloc]init];
    [cancelButton setImage:[UIImage imageNamed:@"cancel.png"] forState:UIControlStateNormal];
    [cancelButton addTarget:self
                     action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelButton];
    
    //iOS8以降
    if(iOSVersion >= 8.0f){
        
        facebookButton.frame = CGRectMake(0, self.view.bounds.size.height - self.view.bounds.size.width * 3 / 16 * 4 - 49, self.view.bounds.size.width, self.view.bounds.size.width * 3 / 16);
        twitterButton.frame = CGRectMake(0, self.view.bounds.size.height - self.view.bounds.size.width * 3 / 16 * 3 - 49, self.view.bounds.size.width, self.view.bounds.size.width * 3 / 16);
        lineButton.frame = CGRectMake(0, self.view.bounds.size.height - self.view.bounds.size.width * 3 / 16 * 2 - 49, self.view.bounds.size.width, self.view.bounds.size.width * 3 / 16);
        cancelButton.frame = CGRectMake(0, self.view.bounds.size.height - self.view.bounds.size.width * 3 / 16 - 49, self.view.bounds.size.width, self.view.bounds.size.width * 3 / 16);
        
    }else {
        
        facebookButton.frame = CGRectMake(0, self.view.bounds.size.height - self.view.bounds.size.width * 3 / 16 * 4, self.view.bounds.size.width, self.view.bounds.size.width * 3 / 16);
        twitterButton.frame = CGRectMake(0, self.view.bounds.size.height - self.view.bounds.size.width * 3 / 16 * 3, self.view.bounds.size.width, self.view.bounds.size.width * 3 / 16);
        lineButton.frame = CGRectMake(0, self.view.bounds.size.height - self.view.bounds.size.width * 3 / 16 * 2, self.view.bounds.size.width, self.view.bounds.size.width * 3 / 16);
        cancelButton.frame = CGRectMake(0, self.view.bounds.size.height - self.view.bounds.size.width * 3 / 16, self.view.bounds.size.width, self.view.bounds.size.width * 3 / 16);
        
    }
    
    self.view.backgroundColor = [UIColor clearColor];
    
    //起動画面で非表示にしていたステータスバーを非表示
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];

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

-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.barTintColor = [UIColor blackColor];
    
    self.view.backgroundColor = [UIColor clearColor];
    
}

-(void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    [onTabBarView removeFromSuperview];
    
    //起動画面で非表示にしていたステータスバーを表示
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    
}

-(void)shareOnFacebook:(UIButton *)button {
    
    //Facebookに投稿
    facebook = [SLComposeViewController
                composeViewControllerForServiceType:SLServiceTypeFacebook];
    [facebook setInitialText:[NSString stringWithFormat:@"#聖光祭"]];
    [facebook addURL:[NSURL URLWithString:@"https://itunes.apple.com/jp/app/seiko-festa-57th-sheng-guang/id1097079958?l=ja&ls=1&mt=8"]];
    [self presentViewController:facebook animated:YES completion:nil];
    
}

-(void)shareOnTwitter:(UIButton *)button {
    
    //Twitterに投稿
    twitter = [SLComposeViewController
               composeViewControllerForServiceType:SLServiceTypeTwitter];
    [twitter setInitialText:[NSString stringWithFormat:@"#聖光祭"]];
    [twitter addURL:[NSURL URLWithString:@"https://itunes.apple.com/jp/app/seiko-festa-57th-sheng-guang/id1097079958?l=ja&ls=1&mt=8"]];
    [self presentViewController:twitter animated:YES completion:nil];
    
}

-(void)shareOnLINE:(UIButton *)button {
    
    //LINEに投稿
    line = [NSString stringWithFormat:@"https://itunes.apple.com/jp/app/seiko-festa-57th-sheng-guang/id1097079958?l=ja&ls=1&mt=8"];
    
    //エンコード
    line = [line
            stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    LineUrlString = [NSString stringWithFormat:@"line://msg/text/%@",line];
    
    // URLスキームを使ってLINEを起動
    //LINEがインストールされているか確認。されていなければアラート→AppStoreを開く
    if ([[UIApplication sharedApplication]
         canOpenURL:[NSURL URLWithString:LineUrlString]]) {
        [[UIApplication sharedApplication]
         openURL:[NSURL URLWithString:LineUrlString]];
    } else {
        [self cannotOpenAlert];
    }
}

-(void)cancel:(UIButton *)button {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

//アラート
-(void)cannotOpenAlert{
    
    Class class = NSClassFromString(@"UIAlertController");
    if(class){
        // iOS 8の時の処理
        
        // コントローラを生成
        UIAlertController * ac =
        [UIAlertController alertControllerWithTitle:@"LINEがインストールされていません"
                                            message:@"App Storeを開いてLINEをインストールしますか？"
                                     preferredStyle:UIAlertControllerStyleAlert];
        
        // Cancel用のアクションを生成
        UIAlertAction * cancelAction =
        [UIAlertAction actionWithTitle:@"Cancel"
                                 style:UIAlertActionStyleCancel
                               handler:^(UIAlertAction * action) {
                                   // ボタンタップ時の処理
                                   
                               }];
        
        // OK用のアクションを生成
        UIAlertAction * yesAction =
        [UIAlertAction actionWithTitle:@"YES"
                                 style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                                   // ボタンタップ時の処理
                                   
                                   [[UIApplication sharedApplication]
                                    openURL:[NSURL
                                             URLWithString:@"https://itunes.apple.com/jp/app/line/id443904275?mt=8"]];
                                   
                               }];
        
        // コントローラにアクションを追加
        [ac addAction:cancelAction];
        [ac addAction:yesAction];
        
        // アラート表示処理
        [self presentViewController:ac animated:YES completion:nil];
        
    }else{
        // iOS 7の時の処理
        
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"LINEがインストールされていません"
                              message:@"App Storeを開いてLINEをインストールしますか？"
                              delegate:self
                              cancelButtonTitle:@"Cancel"
                              otherButtonTitles:@"YES", nil
                              ];
        [alert show];
        
    }
    
}

-(void)alertView:(UIAlertView*)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0://いいえのとき
            break;
        case 1://はいのとき
            [[UIApplication sharedApplication]
             openURL:[NSURL
                      URLWithString:@"https://itunes.apple.com/jp/app/line/id443904275?mt=8"]];
            break;
    }
}

@end
