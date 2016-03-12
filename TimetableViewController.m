//
//  TimetableViewController.m
//  Seiko Festa 57th
//
//  Created by Daisuke  on 2016/02/21.
//  Copyright (c) 2016年 Daisuke Masuda. All rights reserved.
//

#import "TimetableViewController.h"

@interface TimetableViewController ()

@end

@implementation TimetableViewController
@synthesize flag;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // UIScrollViewのインスタンス化
    mainScrollView = [[UIScrollView alloc]init];
    
    //iOSのバージョンで分岐
    float iOSVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    
    //iOS8以降
    if(iOSVersion >= 8.0f){
        
        mainScrollView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-49);
        
    }else{
        
        mainScrollView.frame = CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-113);
        
    }
    
    //横スクロールのインジケータを非表示にする
    mainScrollView.showsHorizontalScrollIndicator = NO;
    //ページングを有効にする
    mainScrollView.pagingEnabled = YES;
    mainScrollView.userInteractionEnabled = YES;
    //デリゲートを有効にする
    mainScrollView.delegate = self;
    mainScrollView.directionalLockEnabled = YES;
    mainScrollView.bounces = NO;
    mainScrollView.backgroundColor = [UIColor clearColor];
    [mainScrollView setContentSize:CGSizeMake(6*(self.view.bounds.size.width), self.view.bounds.size.height-113)];
    
    scrollView1 = [[UIScrollView alloc]init];
    scrollView1.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-113);
    scrollView1.showsHorizontalScrollIndicator = NO;
    scrollView1.pagingEnabled = NO;
    scrollView1.userInteractionEnabled = YES;
    scrollView1.delegate = self;
    scrollView1.directionalLockEnabled = YES;
    scrollView1.bounces = YES;
    [scrollView1 setContentSize:CGSizeMake(self.view.bounds.size.width, 950)];
    scrollView1.backgroundColor=[UIColor clearColor];
    [mainScrollView addSubview:scrollView1];
    
    scrollView2 = [[UIScrollView alloc]init];
    scrollView2.frame = CGRectMake(320, 0, self.view.bounds.size.width, self.view.bounds.size.height-113);
    scrollView2.showsHorizontalScrollIndicator = NO;
    scrollView2.pagingEnabled = NO;
    scrollView2.userInteractionEnabled = YES;
    scrollView2.delegate = self;
    scrollView2.directionalLockEnabled = YES;
    scrollView2.bounces = YES;
    [scrollView2 setContentSize:CGSizeMake(self.view.bounds.size.width, 950)];
    scrollView2.backgroundColor=[UIColor clearColor];
    [mainScrollView addSubview:scrollView2];
    
    scrollView3 = [[UIScrollView alloc]init];
    scrollView3.frame = CGRectMake(640, 0, self.view.bounds.size.width, self.view.bounds.size.height-113);
    scrollView3.showsHorizontalScrollIndicator = NO;
    scrollView3.pagingEnabled = NO;
    scrollView3.userInteractionEnabled = YES;
    scrollView3.delegate = self;
    scrollView3.directionalLockEnabled = YES;
    scrollView3.bounces = YES;
    [scrollView3 setContentSize:CGSizeMake(self.view.bounds.size.width, 950)];
    scrollView3.backgroundColor=[UIColor clearColor];
    [mainScrollView addSubview:scrollView3];
    
    scrollView4 = [[UIScrollView alloc]init];
    scrollView4.frame = CGRectMake(960, 0, self.view.bounds.size.width, self.view.bounds.size.height-113);
    scrollView4.showsHorizontalScrollIndicator = NO;
    scrollView4.pagingEnabled = NO;
    scrollView4.userInteractionEnabled = YES;
    scrollView4.delegate = self;
    scrollView4.directionalLockEnabled = YES;
    scrollView4.bounces = YES;
    [scrollView4 setContentSize:CGSizeMake(self.view.bounds.size.width, 950)];
    scrollView4.backgroundColor=[UIColor clearColor];
    [mainScrollView addSubview:scrollView4];
    
    scrollView5 = [[UIScrollView alloc]init];
    scrollView5.frame = CGRectMake(1280, 0, self.view.bounds.size.width, self.view.bounds.size.height-113);
    scrollView5.showsHorizontalScrollIndicator = NO;
    scrollView5.pagingEnabled = NO;
    scrollView5.userInteractionEnabled = YES;
    scrollView5.delegate = self;
    scrollView5.directionalLockEnabled = YES;
    scrollView5.bounces = YES;
    [scrollView5 setContentSize:CGSizeMake(self.view.bounds.size.width, 950)];
    scrollView5.backgroundColor=[UIColor clearColor];
    [mainScrollView addSubview:scrollView5];
    
    scrollView6 = [[UIScrollView alloc]init];
    scrollView6.frame = CGRectMake(1600, 0, self.view.bounds.size.width, self.view.bounds.size.height-113);
    scrollView6.showsHorizontalScrollIndicator = NO;
    scrollView6.pagingEnabled = NO;
    scrollView6.userInteractionEnabled = YES;
    scrollView6.delegate = self;
    scrollView6.directionalLockEnabled = YES;
    scrollView6.bounces = YES;
    [scrollView6 setContentSize:CGSizeMake(self.view.bounds.size.width, 950)];
    scrollView6.backgroundColor=[UIColor clearColor];
    [mainScrollView addSubview:scrollView6];
    
    [self.view addSubview:mainScrollView];
    
    //UIPageControlのインスタンス化
    CGFloat x = (self.view.bounds.size.width - 300) / 2;
    pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(x, self.view.bounds.size.height-109, 300, 50)];
    //ドットの色
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    // ページ数を設定
   pageControl.numberOfPages = 6;
    //現在のページを設定
    pageControl.currentPage = 0;
    //ページコントロールをタップされたときに呼ばれるメソッドを設定
    pageControl.userInteractionEnabled = YES;
    [pageControl addTarget:self
                    action:@selector(pageControl_Tapped:)
          forControlEvents:UIControlEventValueChanged];
    //ページコントロールを貼付ける
    [self.view addSubview:pageControl];
    
    self.navigationItem.title=@"講堂";
    
    buttonOne1= [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 320, 190)];
    [buttonOne1 setImage:[UIImage imageNamed:@"英語劇-タイムテーブル.png"] forState:UIControlStateNormal];
    [buttonOne1 addTarget:self
                 action:@selector(buttonOne1Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView1 addSubview:buttonOne1];
    
    buttonOne2= [[UIButton alloc]initWithFrame:CGRectMake(0, 190, 320, 190)];
    [buttonOne2 setImage:[UIImage imageNamed:@"英語劇-タイムテーブル.png"] forState:UIControlStateNormal];
    [buttonOne2 addTarget:self
                   action:@selector(buttonOne2Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView1 addSubview:buttonOne2];
    
    buttonOne3= [[UIButton alloc]initWithFrame:CGRectMake(0, 380, 320, 190)];
    [buttonOne3 setImage:[UIImage imageNamed:@"英語劇-タイムテーブル.png"] forState:UIControlStateNormal];
    [buttonOne3 addTarget:self
                   action:@selector(buttonOne3Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView1 addSubview:buttonOne3];
    
    buttonOne4= [[UIButton alloc]initWithFrame:CGRectMake(0, 570, 320, 190)];
    [buttonOne4 setImage:[UIImage imageNamed:@"英語劇-タイムテーブル.png"] forState:UIControlStateNormal];
    [buttonOne4 addTarget:self
                   action:@selector(buttonOne4Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView1 addSubview:buttonOne4];
    
    buttonOne5= [[UIButton alloc]initWithFrame:CGRectMake(0, 760, 320, 190)];
    [buttonOne5 setImage:[UIImage imageNamed:@"英語劇-タイムテーブル.png"] forState:UIControlStateNormal];
    [buttonOne5 addTarget:self
                   action:@selector(buttonOne5Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView1 addSubview:buttonOne5];
    
    buttonTwo1= [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 320, 190)];
    [buttonTwo1 setImage:[UIImage imageNamed:@"英語劇-タイムテーブル.png"] forState:UIControlStateNormal];
    [buttonTwo1 addTarget:self
                   action:@selector(buttonTwo1Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo1];
    
    buttonTwo2= [[UIButton alloc]initWithFrame:CGRectMake(0, 190, 320, 190)];
    [buttonTwo2 setImage:[UIImage imageNamed:@"英語劇-タイムテーブル.png"] forState:UIControlStateNormal];
    [buttonTwo2 addTarget:self
                   action:@selector(buttonTwo2Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo2];
    
    buttonTwo3= [[UIButton alloc]initWithFrame:CGRectMake(0, 380, 320, 190)];
    [buttonTwo3 setImage:[UIImage imageNamed:@"英語劇-タイムテーブル.png"] forState:UIControlStateNormal];
    [buttonTwo3 addTarget:self
                   action:@selector(buttonTwo3Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo3];
    
    buttonTwo4= [[UIButton alloc]initWithFrame:CGRectMake(0, 570, 320, 190)];
    [buttonTwo4 setImage:[UIImage imageNamed:@"英語劇-タイムテーブル.png"] forState:UIControlStateNormal];
    [buttonTwo4 addTarget:self
                   action:@selector(buttonTwo4Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo4];
    
    buttonTwo5= [[UIButton alloc]initWithFrame:CGRectMake(0, 760, 320, 190)];
    [buttonTwo5 setImage:[UIImage imageNamed:@"英語劇-タイムテーブル.png"] forState:UIControlStateNormal];
    [buttonTwo5 addTarget:self
                   action:@selector(buttonTwo5Detail:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView2 addSubview:buttonTwo5];
    
    self.navigationController.navigationBar.tintColor=[UIColor orangeColor];

    
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


//スクロールされたとき
- (void)scrollViewDidScroll:(UIScrollView *)_scrollView
{
    if ((NSInteger)fmod(mainScrollView.contentOffset.x , mainScrollView.frame.size.width) == 0) {
        
        //ページコントロールに現在のページを設定
        pageControl.currentPage = mainScrollView.contentOffset.x / mainScrollView.frame.size.width;
        
    }
    
    if (pageControl.currentPage==0) {
        self.navigationItem.title=@"講堂";
    }else if (pageControl.currentPage==1) {
        self.navigationItem.title=@"外ステージ";
    }else if (pageControl.currentPage==2) {
        self.navigationItem.title=@"ライブハウス1";
    }else if (pageControl.currentPage==3) {
        self.navigationItem.title=@"ライブハウス2";
    }else if (pageControl.currentPage==4) {
        self.navigationItem.title=@"小講堂";
    }else if (pageControl.currentPage==5) {
        self.navigationItem.title=@"体育館・武道場";
    }
    
}

//ページコントロールがタップされたとき
- (void)pageControl_Tapped:(id)sender
{
    CGRect frame = mainScrollView.frame;
    frame.origin.x = mainScrollView.frame.size.width * pageControl.currentPage;
    [mainScrollView scrollRectToVisible:frame animated:YES];
    
}

-(void)buttonOne1Detail:(UIButton *)button{
    whichList = @"food";
    flag = 1;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonOne2Detail:(UIButton *)button{
    whichList = @"food";
    flag = 2;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonOne3Detail:(UIButton *)button{
    whichList = @"food";
    flag = 3;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonOne4Detail:(UIButton *)button{
    whichList = @"food";
    flag = 4;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonOne5Detail:(UIButton *)button{
    whichList = @"food";
    flag = 5;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo1Detail:(UIButton *)button{
    whichList = @"display";
    flag = 1;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo2Detail:(UIButton *)button{
    whichList = @"display";
    flag = 2;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo3Detail:(UIButton *)button{
    whichList = @"display";
    flag = 3;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo4Detail:(UIButton *)button{
    whichList = @"display";
    flag = 4;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonTwo5Detail:(UIButton *)button{
    whichList = @"display";
    flag = 5;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonThree1Detail:(UIButton *)button{
    whichList = @"band";
    flag = 1;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
    
}

-(void)buttonThree2Detail:(UIButton *)button{
    whichList = @"band";
    flag = 2;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonThree3Detail:(UIButton *)button{
    whichList = @"band";
    flag = 3;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonThree4Detail:(UIButton *)button{
    whichList = @"band";
    flag = 4;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonThree5Detail:(UIButton *)button{
    whichList = @"band";
    flag = 5;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonFour1Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 1;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonFour2Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 2;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonFour3Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 3;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonFour4Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 4;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonFour5Detail:(UIButton *)button{
    whichList = @"performance";
    flag = 5;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonFive1Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 1;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonFive2Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 1;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonFive3Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 1;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonFive4Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 1;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

-(void)buttonFive5Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 1;
    [self performSegueWithIdentifier:@"showDirect" sender:self];
}

@end
