//
//  ViewController.h
//  Seiko Festa 57th
//
//  Created by Daisuke  on 2016/01/15.
//  Copyright (c) 2016年 Daisuke Masuda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "DetailView.h"
#import "ListView.h"


@interface ViewController : UIViewController <UIApplicationDelegate>{
    
    //左側余白
    int spaceLeft;
    //アイコン縦横長
    int length;
    //アイコン間スペース(横)
    int spaceW;
    //アイコン-テキスト間スペース(縦)
    int spaceH;
    //allButon フォントサイズ
    int allButtonFont;
    //buttonLabel フォントサイズ
    int buttonLabelFont;
    
    
    UIImage *featuredImage;
    UIImage *featuredImage2;
    
    UIButton *featuredImageButton;
    UIButton *featuredImageButton2;
    
    NSArray *organizationFeaturedImages;
    
    int imageNumber;
    int imageNumber2;
    
    UIScrollView *mainScrollView;
    UIScrollView *scrollView1;
    UIScrollView *scrollView2;
    UIScrollView *scrollView3;
    UIScrollView *scrollView4;
    UIScrollView *scrollView5;
    
    //食品
    UIButton *buttonOne1;   //鉄板職人
    UIButton *buttonOne2;   //麺'sRUNRUN
    UIButton *buttonOne3;   //麺☆恋
    UIButton *buttonOne4;   //俺のケバブ
    UIButton *buttonOne5;   //鳥角
    UIButton *buttonOne6;   //クレープブレーク
    UIButton *buttonOne7;   //Flapjack
    UIButton *buttonOne8;   //chocolat π
    UIButton *buttonOne9;   //Juicy Juicer
    UIButton *buttonOne10;  //綿's candy
    UIButton *buttonOne11;  //氷菓
    UIButton *buttonOne12;  //山手の泉
    UIButton *buttonOne13;  //題名のない音楽喫茶
    UIButton *buttonOne14;  //駅弁
    
    UILabel *buttonOne1Label;
    UILabel *buttonOne2Label;
    UILabel *buttonOne3Label;
    UILabel *buttonOne4Label;
    UILabel *buttonOne5Label;
    UILabel *buttonOne6Label;
    UILabel *buttonOne7Label;
    UILabel *buttonOne8Label;
    UILabel *buttonOne9Label;
    UILabel *buttonOne10Label;
    UILabel *buttonOne11Label;
    UILabel *buttonOne12Label;
    UILabel *buttonOne13Label;
    UILabel *buttonOne14Label;
    
    //趣味研
    UIButton *buttonTwo1;   //英語劇
    UIButton *buttonTwo2;   //ポケモンセンターSeiko
    UIButton *buttonTwo3;   //宇宙戦艦ヤマト研究会
    UIButton *buttonTwo4;   //とにかく明るいFes村
    UIButton *buttonTwo5;   //Trick×Hark
    UIButton *buttonTwo6;   //ぎゃんぶる。
    UIButton *buttonTwo7;   //高3英語劇
    UIButton *buttonTwo8;   //交通研究部
    UIButton *buttonTwo9;   //藤子･F･不二雄研究会
    UIButton *buttonTwo10;  //ベイスターズ研究会
    UIButton *buttonTwo11;  //美術部
    UIButton *buttonTwo12;  //魔女の卓球便
    UIButton *buttonTwo13;  //聖光道場
    UIButton *buttonTwo14;  //迷いの国のアリス
    UIButton *buttonTwo15;  //リアル野球盤
    UIButton *buttonTwo16;  //常夜灯
    UIButton *buttonTwo17;  //地学天文部
    UIButton *buttonTwo18;  //聖光祭からの脱出
    UIButton *buttonTwo19;  //物理化学部
    UIButton *buttonTwo20;  //SeSDA〜聖光宇宙センター〜
    UIButton *buttonTwo21;  //かるた会
    UIButton *buttonTwo22;  //ボーカロイド研究会
    UIButton *buttonTwo23;  //本の泉
    UIButton *buttonTwo24;  //EHC Jurassic
    UIButton *buttonTwo25;  //早撃ちジョニー
    UIButton *buttonTwo26;  //人狼の館
    UIButton *buttonTwo27;  //横浜漫才フィルム
    UIButton *buttonTwo28;  //生物部
    UIButton *buttonTwo29;  //78枚目のJoker
    UIButton *buttonTwo30;  //アニメ研究会
    UIButton *buttonTwo31;  //Shockers
    UIButton *buttonTwo32;  //コンピュータ部
    UIButton *buttonTwo33;  //古本市
    UIButton *buttonTwo34;  //インターアクトクラブ
    UIButton *buttonTwo35;  //Showtime!
    UIButton *buttonTwo36;  //クイズ研究会
    UIButton *buttonTwo37;  //地理歴史巡見部
    UIButton *buttonTwo38;  //ぶいえいす
    UIButton *buttonTwo39;  //聖書研究会
    UIButton *buttonTwo40;  //数学研究会
    UIButton *buttonTwo41;  //生徒会展示
    
    UILabel *buttonTwo1Label;
    UILabel *buttonTwo2Label;
    UILabel *buttonTwo3Label;
    UILabel *buttonTwo4Label;
    UILabel *buttonTwo5Label;
    UILabel *buttonTwo6Label;
    UILabel *buttonTwo7Label;
    UILabel *buttonTwo8Label;
    UILabel *buttonTwo9Label;
    UILabel *buttonTwo10Label;
    UILabel *buttonTwo11Label;
    UILabel *buttonTwo12Label;
    UILabel *buttonTwo13Label;
    UILabel *buttonTwo14Label;
    UILabel *buttonTwo15Label;
    UILabel *buttonTwo16Label;
    UILabel *buttonTwo17Label;
    UILabel *buttonTwo18Label;
    UILabel *buttonTwo19Label;
    UILabel *buttonTwo20Label;
    UILabel *buttonTwo21Label;
    UILabel *buttonTwo22Label;
    UILabel *buttonTwo23Label;
    UILabel *buttonTwo24Label;
    UILabel *buttonTwo25Label;
    UILabel *buttonTwo26Label;
    UILabel *buttonTwo27Label;
    UILabel *buttonTwo28Label;
    UILabel *buttonTwo29Label;
    UILabel *buttonTwo30Label;
    UILabel *buttonTwo31Label;
    UILabel *buttonTwo32Label;
    UILabel *buttonTwo33Label;
    UILabel *buttonTwo34Label;
    UILabel *buttonTwo35Label;
    UILabel *buttonTwo36Label;
    UILabel *buttonTwo37Label;
    UILabel *buttonTwo38Label;
    UILabel *buttonTwo39Label;
    UILabel *buttonTwo40Label;
    UILabel *buttonTwo41Label;
    
    
    //バンド
    UIButton *buttonThree1;
    UIButton *buttonThree2;
    UIButton *buttonThree3;
    UIButton *buttonThree4;
    UIButton *buttonThree5;
    UIButton *buttonThree6;
    UIButton *buttonThree7;
    UIButton *buttonThree8;
    UIButton *buttonThree9;
    UIButton *buttonThree10;
    UIButton *buttonThree11;
    UIButton *buttonThree12;
    
    UILabel *buttonThree1Label;
    UILabel *buttonThree2Label;
    UILabel *buttonThree3Label;
    UILabel *buttonThree4Label;
    UILabel *buttonThree5Label;
    UILabel *buttonThree6Label;
    UILabel *buttonThree7Label;
    UILabel *buttonThree8Label;
    UILabel *buttonThree9Label;
    UILabel *buttonThree10Label;
    UILabel *buttonThree11Label;
    UILabel *buttonThree12Label;
    
    //講堂･小講堂
    UIButton *buttonFour1;  //Grand Finale
    UIButton *buttonFour2;  //英語劇
    UIButton *buttonFour3;  //ボールぽこぽこ
    UIButton *buttonFour4;  //グリークラブ
    UIButton *buttonFour5;  //弦楽オーケストラ部
    UIButton *buttonFour6;  //恋愛偏差値
    UIButton *buttonFour7;  //校長対談
    UIButton *buttonFour8;  //吹奏楽部
    UIButton *buttonFour9;  //ミュージックサロン
    UIButton *buttonFour10; //天使の歌声
    UIButton *buttonFour11; //数学研究会模擬講義
    UIButton *buttonFour12; //少林寺拳法部演武会
    UIButton *buttonFour13; //剣道部
    
    UILabel *buttonFour1Label;
    UILabel *buttonFour2Label;
    UILabel *buttonFour3Label;
    UILabel *buttonFour4Label;
    UILabel *buttonFour5Label;
    UILabel *buttonFour6Label;
    UILabel *buttonFour7Label;
    UILabel *buttonFour8Label;
    UILabel *buttonFour9Label;
    UILabel *buttonFour10Label;
    UILabel *buttonFour11Label;
    UILabel *buttonFour12Label;
    UILabel *buttonFour13Label;
    
    //外ステージ
    UIButton *buttonFive1;  //フォークダンス
    UIButton *buttonFive2;  //春夜祭
    UIButton *buttonFive3;  //Mr.聖光
    UIButton *buttonFive4;  //Seiko Dance Performance
    UIButton *buttonFive5;  //のど自慢
    UIButton *buttonFive6;  //ギネスに挑戦！！
    UIButton *buttonFive7;  //コミュ力の窓
    UIButton *buttonFive8;  //The 笑-1 GP
    UIButton *buttonFive9;  //替え歌選手権
    UIButton *buttonFive10; //○○男子No.1決定戦
    UIButton *buttonFive11; //S.O.S
    
    UILabel *buttonFive1Label;
    UILabel *buttonFive2Label;
    UILabel *buttonFive3Label;
    UILabel *buttonFive4Label;
    UILabel *buttonFive5Label;
    UILabel *buttonFive6Label;
    UILabel *buttonFive7Label;
    UILabel *buttonFive8Label;
    UILabel *buttonFive9Label;
    UILabel *buttonFive10Label;
    UILabel *buttonFive11Label;
    
    UIButton *viewAllButton1;
    UIButton *viewAllButton2;
    UIButton *viewAllButton3;
    UIButton *viewAllButton4;
    UIButton *viewAllButton5;
    
    NSString *whichList;
    
    float contentOffsetY;
    
    float contentOffsetX1;
    float contentOffsetX2;
    float contentOffsetX3;
    float contentOffsetX4;
    float contentOffsetX5;
    
    UIImageView *Food;
    UIImageView *Display;
    UIImageView *Band;
    UIImageView *Performance;
    UIImageView *Stage;
    
}

@property(nonatomic) int flag;

@end

