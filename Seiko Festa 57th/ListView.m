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
        
        scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-49)];
        
    }else{
        
        scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-113)];
        
    }
    
    //横スクロールのインジケータを非表示にする
    scrollView.showsHorizontalScrollIndicator = NO;
    
    scrollView.userInteractionEnabled = YES;
    scrollView.directionalLockEnabled = YES;
    scrollView.bounces = YES;
    scrollView.backgroundColor = [UIColor clearColor];
    //スクロールの範囲を設定
    [scrollView setContentSize:CGSizeMake(self.view.bounds.size.width, 780)];
    
    [self.view addSubview:scrollView];
    
    
    if ([_whatList isEqualToString:@"food"]) {
        
        self.navigationItem.title = @"Food";
        
        button1= [[UIButton alloc]initWithFrame:CGRectMake(16, 16, 128, 128)];
        [button1 setImage:[UIImage imageNamed:@"講堂劇 アイコン.png"] forState:UIControlStateNormal];
        [button1 addTarget:self
                       action:@selector(buttonOne1Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button1];
        
        label1 = [[UILabel alloc]initWithFrame:CGRectMake(16, 152, 128, 20)];
        label1.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label1.text = @"お好み焼き";
        label1.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label1];
        
        button2= [[UIButton alloc]initWithFrame:CGRectMake(176, 16, 128, 128)];
        [button2 setImage:[UIImage imageNamed:@"ウータン.png"] forState:UIControlStateNormal];
        [button2 addTarget:self
                    action:@selector(buttonOne2Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button2];
        
        label2 = [[UILabel alloc]initWithFrame:CGRectMake(176, 152, 128, 20)];
        label2.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label2.text = @"お好み焼き";
        label2.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label2];
        
        button3= [[UIButton alloc]initWithFrame:CGRectMake(16, 196, 128, 128)];
        [button3 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
        [button3 addTarget:self
                    action:@selector(buttonOne3Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button3];
        
        label3 = [[UILabel alloc]initWithFrame:CGRectMake(16, 332, 128, 20)];
        label3.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label3.text = @"お好み焼き";
        label3.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label3];
        
        button4= [[UIButton alloc]initWithFrame:CGRectMake(176, 196, 128, 128)];
        [button4 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
        [button4 addTarget:self
                    action:@selector(buttonOne4Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button4];
        
        label4 = [[UILabel alloc]initWithFrame:CGRectMake(176, 332, 128, 20)];
        label4.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label4.text = @"お好み焼き";
        label4.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label4];
        
    }else if ([_whatList isEqualToString:@"display"]) {
        
        self.navigationItem.title = @"Display";
        
        button1= [[UIButton alloc]initWithFrame:CGRectMake(16, 16, 128, 128)];
        [button1 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
        [button1 addTarget:self
                    action:@selector(buttonTwo1Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button1];
        
        label1 = [[UILabel alloc]initWithFrame:CGRectMake(16, 152, 128, 20)];
        label1.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label1.text = @"お好み焼き";
        label1.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label1];
        
        button2= [[UIButton alloc]initWithFrame:CGRectMake(176, 16, 128, 128)];
        [button2 setImage:[UIImage imageNamed:@"ウータン.png"] forState:UIControlStateNormal];
        [button2 addTarget:self
                    action:@selector(buttonTwo2Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button2];
        
        label2 = [[UILabel alloc]initWithFrame:CGRectMake(176, 152, 128, 20)];
        label2.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label2.text = @"お好み焼き";
        label2.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label2];
        
        button3= [[UIButton alloc]initWithFrame:CGRectMake(16, 196, 128, 128)];
        [button3 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
        [button3 addTarget:self
                    action:@selector(buttonTwo3Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button3];
        
        label3 = [[UILabel alloc]initWithFrame:CGRectMake(16, 332, 128, 20)];
        label3.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label3.text = @"お好み焼き";
        label3.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label3];
        
        button4= [[UIButton alloc]initWithFrame:CGRectMake(176, 196, 128, 128)];
        [button4 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
        [button4 addTarget:self
                    action:@selector(buttonTwo4Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button4];
        
        label4 = [[UILabel alloc]initWithFrame:CGRectMake(176, 332, 128, 20)];
        label4.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label4.text = @"お好み焼き";
        label4.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label4];
        
    }else if ([_whatList isEqualToString:@"band"]) {
        
        self.navigationItem.title = @"Band";
        
        button1= [[UIButton alloc]initWithFrame:CGRectMake(16, 16, 128, 128)];
        [button1 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
        [button1 addTarget:self
                    action:@selector(buttonThree1Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button1];
        
        label1 = [[UILabel alloc]initWithFrame:CGRectMake(16, 152, 128, 20)];
        label1.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label1.text = @"お好み焼き";
        label1.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label1];
        
        button2= [[UIButton alloc]initWithFrame:CGRectMake(176, 16, 128, 128)];
        [button2 setImage:[UIImage imageNamed:@"ウータン.png"] forState:UIControlStateNormal];
        [button2 addTarget:self
                    action:@selector(buttonThree2Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button2];
        
        label2 = [[UILabel alloc]initWithFrame:CGRectMake(176, 152, 128, 20)];
        label2.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label2.text = @"お好み焼き";
        label2.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label2];
        
        button3= [[UIButton alloc]initWithFrame:CGRectMake(16, 196, 128, 128)];
        [button3 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
        [button3 addTarget:self
                    action:@selector(buttonThree3Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button3];
        
        label3 = [[UILabel alloc]initWithFrame:CGRectMake(16, 332, 128, 20)];
        label3.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label3.text = @"お好み焼き";
        label3.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label3];
        
        button4= [[UIButton alloc]initWithFrame:CGRectMake(176, 196, 128, 128)];
        [button4 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
        [button4 addTarget:self
                    action:@selector(buttonThree4Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button4];
        
        label4 = [[UILabel alloc]initWithFrame:CGRectMake(176, 332, 128, 20)];
        label4.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label4.text = @"お好み焼き";
        label4.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label4];
        
    }else if ([_whatList isEqualToString:@"performance"]) {
        
        self.navigationItem.title = @"Performance";
        
        button1= [[UIButton alloc]initWithFrame:CGRectMake(16, 16, 128, 128)];
        [button1 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
        [button1 addTarget:self
                    action:@selector(buttonFour1Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button1];
        
        label1 = [[UILabel alloc]initWithFrame:CGRectMake(16, 152, 128, 20)];
        label1.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label1.text = @"お好み焼き";
        label1.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label1];
        
        button2= [[UIButton alloc]initWithFrame:CGRectMake(176, 16, 128, 128)];
        [button2 setImage:[UIImage imageNamed:@"ウータン.png"] forState:UIControlStateNormal];
        [button2 addTarget:self
                    action:@selector(buttonFour2Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button2];
        
        label2 = [[UILabel alloc]initWithFrame:CGRectMake(176, 152, 128, 20)];
        label2.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label2.text = @"お好み焼き";
        label2.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label2];
        
        button3= [[UIButton alloc]initWithFrame:CGRectMake(16, 196, 128, 128)];
        [button3 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
        [button3 addTarget:self
                    action:@selector(buttonFour3Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button3];
        
        label3 = [[UILabel alloc]initWithFrame:CGRectMake(16, 332, 128, 20)];
        label3.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label3.text = @"お好み焼き";
        label3.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label3];
        
        button4= [[UIButton alloc]initWithFrame:CGRectMake(176, 196, 128, 128)];
        [button4 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
        [button4 addTarget:self
                    action:@selector(buttonFour4Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button4];
        
        label4 = [[UILabel alloc]initWithFrame:CGRectMake(176, 332, 128, 20)];
        label4.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label4.text = @"お好み焼き";
        label4.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label4];
        
    }else if ([_whatList isEqualToString:@"stage"]) {
        
        self.navigationItem.title = @"Stage";
        
        button1= [[UIButton alloc]initWithFrame:CGRectMake(16, 16, 128, 128)];
        [button1 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
        [button1 addTarget:self
                    action:@selector(buttonFive1Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button1];
        
        label1 = [[UILabel alloc]initWithFrame:CGRectMake(16, 152, 128, 20)];
        label1.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label1.text = @"お好み焼き";
        label1.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label1];
        
        button2= [[UIButton alloc]initWithFrame:CGRectMake(176, 16, 128, 128)];
        [button2 setImage:[UIImage imageNamed:@"ウータン.png"] forState:UIControlStateNormal];
        [button2 addTarget:self
                    action:@selector(buttonFive2Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button2];
        
        label2 = [[UILabel alloc]initWithFrame:CGRectMake(176, 152, 128, 20)];
        label2.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label2.text = @"お好み焼き";
        label2.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label2];
        
        button3= [[UIButton alloc]initWithFrame:CGRectMake(16, 196, 128, 128)];
        [button3 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
        [button3 addTarget:self
                    action:@selector(buttonFive3Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button3];
        
        label3 = [[UILabel alloc]initWithFrame:CGRectMake(16, 332, 128, 20)];
        label3.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label3.text = @"お好み焼き";
        label3.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label3];
        
        button4= [[UIButton alloc]initWithFrame:CGRectMake(176, 196, 128, 128)];
        [button4 setImage:[UIImage imageNamed:@"お好み焼き.jpg"] forState:UIControlStateNormal];
        [button4 addTarget:self
                    action:@selector(buttonFive4Detail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button4];
        
        label4 = [[UILabel alloc]initWithFrame:CGRectMake(176, 332, 128, 20)];
        label4.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
        label4.text = @"お好み焼き";
        label4.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label4];
        
    }
    
    button1.clipsToBounds=YES;
    button1.layer.cornerRadius=27.0;
    button1.layer.borderWidth=0.7;
    button1.layer.borderColor=[UIColor colorWithRed:211.0/255.0 green:211.0/255.0 blue:211.0/255.0 alpha:1.0].CGColor;
    button2.clipsToBounds=YES;
    button2.layer.cornerRadius=27.0;
    button2.layer.borderWidth=0.7;
    button2.layer.borderColor=[UIColor colorWithRed:211.0/255.0 green:211.0/255.0 blue:211.0/255.0 alpha:1.0].CGColor;
    button3.clipsToBounds=YES;
    button3.layer.cornerRadius=27.0;
    button3.layer.borderWidth=0.7;
    button3.layer.borderColor=[UIColor colorWithRed:211.0/255.0 green:211.0/255.0 blue:211.0/255.0 alpha:1.0].CGColor;
    button4.clipsToBounds=YES;
    button4.layer.cornerRadius=27.0;
    button4.layer.borderWidth=0.7;
    button4.layer.borderColor=[UIColor colorWithRed:211.0/255.0 green:211.0/255.0 blue:211.0/255.0 alpha:1.0].CGColor;
    
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

-(void)buttonFive1Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 1;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonFive2Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 1;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonFive3Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 1;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonFive4Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 1;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

-(void)buttonFive5Detail:(UIButton *)button{
    whichList = @"stage";
    flag = 1;
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
