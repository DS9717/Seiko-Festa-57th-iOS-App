//
//  ListView.h
//  Seiko Festa 57th
//
//  Created by Yuya Imanari on 2016/01/25(月).
//  Copyright © 2016年 Daisuke Masuda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailView.h"

@interface ListView : UIViewController{
    
    int spaceLeft;
    int length;
    int spaceH;
    int fontSize;
    
    NSString *_whatList;
    
    UIScrollView *scrollView;
    
    UIButton *button1;
    UIButton *button2;
    UIButton *button3;
    UIButton *button4;
    UIButton *button5;
    UIButton *button6;
    UIButton *button7;
    UIButton *button8;
    UIButton *button9;
    UIButton *button10;
    UIButton *button11;
    UIButton *button12;
    UIButton *button13;
    UIButton *button14;
    
    UILabel *label1;
    UILabel *label2;
    UILabel *label3;
    UILabel *label4;
    UILabel *label5;
    UILabel *label6;
    UILabel *label7;
    UILabel *label8;
    UILabel *label9;
    UILabel *label10;
    UILabel *label11;
    UILabel *label12;
    UILabel *label13;
    UILabel *label14;
    
    NSString *whichList;
    
}
@property(nonatomic) int flag;
@property(nonatomic) NSString *whatList;
@end
