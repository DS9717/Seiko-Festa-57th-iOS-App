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
    
    //左(右)余白
    int spaceLeft;
    //画像サイズ(self.view.bounds.size.width / 2 - spaceLeft * 2)(画像間隔は spaceLeft * 2)
    int length;
    //画像-テキスト間隔
    int spaceH;
    //テキストフォント
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
    UIButton *button15;
    UIButton *button16;
    UIButton *button17;
    UIButton *button18;
    UIButton *button19;
    UIButton *button20;
    UIButton *button21;
    UIButton *button22;
    UIButton *button23;
    UIButton *button24;
    UIButton *button25;
    UIButton *button26;
    UIButton *button27;
    UIButton *button28;
    UIButton *button29;
    UIButton *button30;
    UIButton *button31;
    UIButton *button32;
    UIButton *button33;
    UIButton *button34;
    UIButton *button35;
    UIButton *button36;
    UIButton *button37;
    UIButton *button38;
    UIButton *button39;
    UIButton *button40;
    UIButton *button41;
    
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
    UILabel *label15;
    UILabel *label16;
    UILabel *label17;
    UILabel *label18;
    UILabel *label19;
    UILabel *label20;
    UILabel *label21;
    UILabel *label22;
    UILabel *label23;
    UILabel *label24;
    UILabel *label25;
    UILabel *label26;
    UILabel *label27;
    UILabel *label28;
    UILabel *label29;
    UILabel *label30;
    UILabel *label31;
    UILabel *label32;
    UILabel *label33;
    UILabel *label34;
    UILabel *label35;
    UILabel *label36;
    UILabel *label37;
    UILabel *label38;
    UILabel *label39;
    UILabel *label40;
    UILabel *label41;
    
    NSString *whichList;
    
    UILabel *nav_title;
    
}
@property(nonatomic) int flag;
@property(nonatomic) NSString *whatList;
@end
