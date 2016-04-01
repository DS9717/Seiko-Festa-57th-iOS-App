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

    CGRect r = [[UIScreen mainScreen] bounds];
    if (r.size.width == 320) {
        //iPhone 4s/5/5c/5s
        space = 50;
        //length = self.view.bounds.size.width - space * 2 = 220
        spaceU = 40;
        titleSize = 20;
        lineSize = 11.25;
        spaceBetween = 10;
        explainSize = 15;
    } else if (r.size.width == 375) {
        //iPhone 6/6s
        space = 60;
        //length = self.view.bounds.size.width - space * 2 = 255
        spaceU = 45;
        titleSize = 23;
        lineSize = 13.5;
        spaceBetween = 12;
        explainSize = 17;
    } else if (r.size.width == 414) {
        //iPhone 6 plus/6s plus
        space = 65;
        //length = self.view.bounds.size.width - space * 2 = 284
        spaceU = 52;
        titleSize = 26;
        lineSize = 15.0;
        spaceBetween = 13;
        explainSize = 20;
    }
    
    // Do any additional setup after loading the view.
    
    //[imageScroll setContentSize:CGSizeMake(540, 220)];
    imageScroll = [[UIScrollView alloc]init];
    imageScroll.frame = CGRectMake(0, space, self.view.bounds.size.width, self.view.bounds.size.width - space * 2);
    //横スクロールのインジケータを非表示にする
    imageScroll.showsHorizontalScrollIndicator = NO;
    imageScroll.userInteractionEnabled = YES;
    imageScroll.directionalLockEnabled = YES;
    imageScroll.bounces = NO;
    imageScroll.pagingEnabled = YES;
    imageScroll.backgroundColor = [UIColor clearColor];
    //スクロールの範囲を設定
    [imageScroll setContentSize:CGSizeMake(self.view.bounds.size.width * 2, self.view.bounds.size.width - space * 2)];
    
    //
    _detailTitle = [[UILabel alloc]initWithFrame:CGRectMake(16, self.view.bounds.size.width - space + spaceU, self.view.bounds.size.width - 32, titleSize)];    //CGRectMake(16, space + length + spaceU, self.view.bounds.size.width - 32, titleSize)
    _detailTitle.textAlignment = NSTextAlignmentCenter;
    _detailTitle.textColor = [UIColor whiteColor];
    _detailTitle.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:titleSize];
    
    _explainSentence = [[UITextView alloc]initWithFrame:CGRectMake(16, self.view.bounds.size.width - space + spaceU + titleSize + spaceBetween, self.view.bounds.size.width - 32, self.view.bounds.size.height - self.view.bounds.size.width + space - spaceU - titleSize - spaceBetween - 49)];
    //CGRectMake(16, space + length + spaceU + titleSize + spaceBetween, self.view.bounds.size.width - 32, self.view.bounds.size.height - space - length - spaceU - titleSize - spaceBetween - 49)
    _explainSentence.textColor = [UIColor whiteColor];
    _explainSentence.editable = NO;
    _explainSentence.backgroundColor = [UIColor clearColor];
    _explainSentence.selectable = NO;
    _explainSentence.font = [UIFont fontWithName:@"HelveticaNeue" size:explainSize];

    //Navigation Itemのタイトルのフォントを設定
    nav_title=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.navigationItem.titleView.frame.size.width, 40)];
    nav_title.textColor=[UIColor whiteColor];
    
    nav_title.textAlignment=NSTextAlignmentCenter;
    
    [nav_title setFont:[UIFont fontWithName:@"MyriadPro-Regular" size:22]];
    self.navigationItem.titleView=nav_title;
    

    
    if ([_whatList isEqualToString:@"food"]) {
        
        nav_title.text=@"Food";
        
        if (flag == 1) {
            detailImage = [UIImage imageNamed:@"鉄板職人.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"鉄板職人";
            _explainSentence.text = @"従来の豚たまに加え、さらに新しい味が追加され進化した鉄板職人。ぜひ一度足をお運び下さい。";
        }
        else if (flag == 2) {
            detailImage = [UIImage imageNamed:@"塩焼きそば-麺’sRUNRUN.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"麺’sRUNRUN";
            _explainSentence.text = @"3年連続売り上げ1位を獲得した職人達の、魂の込もった1皿を召し上がれ。この味は、裏切らない。";
        }
        else if (flag == 3) {
            detailImage = [UIImage imageNamed:@"麺☆恋.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"麺☆恋";
            _explainSentence.text = @"味自慢のソース焼きそば。ソース焼きそばへの愛で本物の味をお届けします。あなたの舌が唸ること間違いなし！";
        }
        else if (flag == 4) {
            detailImage = [UIImage imageNamed:@"俺のケバブ.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"俺のケバブ";
            _explainSentence.text = @"売切れ御免！大人気店「俺のケバブ」が今年もやってきた。これを食べずに聖光祭は終われない！";
        }
        else if (flag == 5) {
            detailImage = [UIImage imageNamed:@"鳥角.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"鳥角";
            _explainSentence.text = @"宣伝文 理由もなく聖光祭に来てしまった貴方を今日焼き鳥の虜にさせる。愛と情熱の滲み出る鳥 を是非ご堪能あれ。";
        }
        else if (flag == 6) {
            detailImage = [UIImage imageNamed:@"クレープブレーク.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"クレープブレーク";
            _explainSentence.text = @"聖光祭名物のクレープでほっと一休み、いかがですか?";
        }
        else if (flag == 7) {
            detailImage = [UIImage imageNamed:@"Flapjack.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"Flapjack";
            _explainSentence.text = @"最近話題のパンケーキが聖光に登場！甘い物好きの人はもちろん、子供も大人も誰でもどうぞ！ぜひ来て下さい！";
        }
        else if (flag == 8) {
            detailImage = [UIImage imageNamed:@"chocolat-π.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"chocolat π";
            _explainSentence.text = @"πなのにパイは三角！？人生そんなに甘くない…でもチョコは甘い！これを食べればあなたも元気いっπ！！";
        }
        else if (flag == 9) {
            detailImage = [UIImage imageNamed:@"Juicy-Juicer.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"Juicy Juicer";
            _explainSentence.text = @"宣伝文新たな聖光祭名物となったスムージー！果物を贅沢に使った、聖光生手作りのスムージーを是非ご賞味あれ！！";
        }
        else if (flag == 10) {
            detailImage = [UIImage imageNamed:@"綿's-candy.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"綿's Candy";
            _explainSentence.text = @"今年の綿あめは一味、いや二味違う！？これは食べなければっ！聖光の綿あめ職人達が最高の一本を貴方に・・・";
        }
        else if (flag == 11) {
            detailImage = [UIImage imageNamed:@"氷菓.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"氷菓";
            _explainSentence.text = @"熱い熱い聖光祭のお供には・・・やっぱり甘くて冷たいかき氷でしょ‼︎";
        }
        else if (flag == 12) {
            detailImage = [UIImage imageNamed:@"山手の泉.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"山手の泉";
            _explainSentence.text = @"これを見たそこのあなた!のどをうるおしたくありませんか? そんな方は是非山手の泉へ!!";
        }
        else if (flag == 13) {
            detailImage = [UIImage imageNamed:@"題名のない音楽喫茶.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"題名のない音楽喫茶";
            _explainSentence.text = @"紹介文　少し聖光祭の喧騒から離れて、ゆったり休憩しませんか？聖光生の演奏と共に、優雅なティータイムをどうぞ。";
        }
        else if (flag == 14) {
            detailImage = [UIImage imageNamed:@"駅弁.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"駅弁";
            _explainSentence.text = @"紹介文　いらっしゃい、いらっしゃい。今年もおいしい駅弁、一杯あります。詳しい品目は、○ページをご覧ください。";
        }
        
    }else if ([_whatList isEqualToString:@"display"]) {
        
        nav_title.text=@"Display";
        
        if (flag == 1) {
            detailImage = [UIImage imageNamed:@"英語劇.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"英語劇";
            _explainSentence.text = @"今年の演目はイギリスの有名ドラマ「SHERLOCK」。現代の名探偵の活躍をお見逃しなく!!";
        }
        else if (flag == 2) {
            detailImage = [UIImage imageNamed:@"高3英語劇.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"高3英語劇";
            _explainSentence.text = @"サスペンス劇の金字塔を最高学年が熱演！刻一刻と迫る運命、明かされる驚愕の真実！";
        }
        else if (flag == 3) {
            detailImage = [UIImage imageNamed:@"迷いの国のアリス.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"迷いの国のアリス";
            _explainSentence.text = @"ようこそ、Under Landへ。謎を解き、アリスの世界から脱出せよ";
        }
        else if (flag == 4) {
            detailImage = [UIImage imageNamed:@"Trick×Hark.jpg"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"Trick×Hark";
            _explainSentence.text = @"聖光生がマジックで作り上げる幻想的な世界へいざなう… 　目の前で繰り広げられる奇跡の目撃者となれ！";
        }
        else if (flag == 5) {
            detailImage = [UIImage imageNamed:@"インターアクト.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"インターアクトクラブ";
            _explainSentence.text = @"聖光学院インターアクトクラブの活動報告、物品販売を行っています。是非お越しください！";
        }
        else if (flag == 6) {
            detailImage = [UIImage imageNamed:@"インターアクト.JPG"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"インターアクトクラブ";
            _explainSentence.text = @"";
        }
        else if (flag == 5) {
            detailImage = [UIImage imageNamed:@"インターアクト.JPG"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"インターアクトクラブ";
            _explainSentence.text = @"";
        }
        else if (flag == 5) {
            detailImage = [UIImage imageNamed:@"インターアクト.JPG"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"インターアクトクラブ";
            _explainSentence.text = @"";
        }
        else if (flag == 5) {
            detailImage = [UIImage imageNamed:@"インターアクト.JPG"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"インターアクトクラブ";
            _explainSentence.text = @"";
        }
        else if (flag == 5) {
            detailImage = [UIImage imageNamed:@"インターアクト.JPG"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"インターアクトクラブ";
            _explainSentence.text = @"";
        }
        else if (flag == 5) {
            detailImage = [UIImage imageNamed:@"インターアクト.JPG"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"インターアクトクラブ";
            _explainSentence.text = @"";
        }
        else if (flag == 5) {
            detailImage = [UIImage imageNamed:@"インターアクト.JPG"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"インターアクトクラブ";
            _explainSentence.text = @"";
        }
        
    }else if ([_whatList isEqualToString:@"band"]) {
        
        nav_title.text=@"Band";
        
        if (flag == 1) {
            detailImage = [UIImage imageNamed:@"M&A.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"M&A";
            _explainSentence.text = @"あのM&Aが帰ってきた！オーディション1位となった今、圧倒的なパフォーマンスが更なる進化を遂げる。";
        }
        else if (flag == 2) {
            detailImage = [UIImage imageNamed:@"Flat-Flight.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"Flat-Flight";
            _explainSentence.text = @"１年半かけて培ってきた技術と楽しい選曲で、最高の演奏をお届けします！ライブハウスで熱くなろうぜ!!";
        }
        else if (flag == 3) {
            detailImage = [UIImage imageNamed:@"蜃気楼.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"蜃気楼";
            _explainSentence.text = @"『蜃気楼』って名前、ダサいとか思ってんだろ？騙されたと思って一回ライブ見に来いよ？な？？";
        }
        else if (flag == 4) {
            detailImage = [UIImage imageNamed:@"ぽんでっくす.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"ぽんでっくす";
            _explainSentence.text = @"いけめんがたくさん。きいてってね";
        }
        else if (flag == 5) {
            detailImage = [UIImage imageNamed:@"エストレーラ.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"エストレーラ";
            _explainSentence.text = @"え？次どこいくか決まってないって？僕達のLIVEに来るのはどうかい？洗練された音楽を聞きに是非！";
        }
        else if (flag == 6) {
            detailImage = [UIImage imageNamed:@"Яooz-Leef.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"Яooz-Leef";
            _explainSentence.text = @"個性的な５人が織り成す、オーディション高１内１位の実力派バンドです！是非来て盛り上がっていってね！";
        }
        else if (flag == 7) {
            detailImage = [UIImage imageNamed:@"WEAK-END.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"WEAK END";
            _explainSentence.text = @"あれ？今日って週末だよね?来るしかないよね？…ね？";
        }
        else if (flag == 8) {
            detailImage = [UIImage imageNamed:@"Million-Dollars.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"Million Dollars";
            _explainSentence.text = @"百万ドルの演奏見せつけます、是非見てってください";
        }
        else if (flag == 9) {
            detailImage = [UIImage imageNamed:@"せいとんがかり.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"せいとんがかり";
            _explainSentence.text = @"今まで明かさなかった秘密を明かそう。せいとんがかり…せいとん…say-tone… そう、say tone!!!";
        }
        else if (flag == 10) {
            detailImage = [UIImage imageNamed:@"Chaos-illusion.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"Chaos illusion";
            _explainSentence.text = @"演奏こそ我が糧… カオスイリュージョン… どんな曲やるか教えて欲しい？おちえない！( ⌒,_ゝ⌒)";
        }
        else if (flag == 11) {
            detailImage = [UIImage imageNamed:@"Addiction？.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"Addiction？";
            _explainSentence.text = @"最後だから見てって...お願い...何が最後って...？最後のバンドだよ...そして最後のライブだよ...()";
        }
        else if (flag == 12) {
            detailImage = [UIImage imageNamed:@"奴等.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"奴等";
            _explainSentence.text = @"青いぜえ服青だぜ楽器も青だぜシールドも青だぜ地球は青かったぜえそんでバンド名青要素0だぜワイルドだろお";
        }
        
    }else if ([_whatList isEqualToString:@"performance"]) {
        
        nav_title.text=@"Performance";
        
        if (flag == 1) {
            detailImage = [UIImage imageNamed:@"Grand-Finale.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"Grand Finale";
            _explainSentence.text = @"聖光の誇る「圧倒的」パフォーマンスの数々がクライマックスを彩ります。聖光祭の全てがここにある！景品も当たるよ(*’ω’*)";
        }
        else if (flag == 2) {
            detailImage = [UIImage imageNamed:@"英語劇講堂劇.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"英語劇";
            _explainSentence.text = @"演目は、かの大人気ミュージカル「レ・ミゼラブル」。フランス革命を先導する青年達の情熱と愛を、聖光BOYが歌と熱い演技でお送りします！！";
        }
        else if (flag == 3) {
            detailImage = [UIImage imageNamed:@"ボールぽこぽこ.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"ボールぽこぽこ";
            _explainSentence.text = @"今年も魅せます、ジャグリング!!講堂、中夜祭、グラフィナで!!ゲリラ的に校内各所で演技してるかも⁉";
        }
        else if (flag == 4) {
            detailImage = [UIImage imageNamed:@"グリークラブ.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"グリークラブ";
            _explainSentence.text = @"全国でも珍しい男声構成のみの力強い合唱とハンドベル演奏をお楽しみ頂けます。ぜひ講堂までお越しください！";
        }
        else if (flag == 5) {
            detailImage = [UIImage imageNamed:@"弦楽オーケストラ部.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"弦楽オーケストラ部";
            _explainSentence.text = @"聖光祭の熱気から少し離れ、ひと休憩。聖光生による弦楽演奏、是非お楽しみください。";
        }
        else if (flag == 6) {
            detailImage = [UIImage imageNamed:@"恋愛偏差値.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"恋愛偏差値";
            _explainSentence.text = @"オタクで冴えない聖光生が不器用ながらも''リア充''を目指す日々を描く映画です。果たして''リア充''になれるのか？";
        }
        else if (flag == 7) {
            detailImage = [UIImage imageNamed:@"校長対談.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"校長対談";
            _explainSentence.text = @"校長 ✕ 生徒会長による、熱いトークライブ。聖光の全てが、そこで語られる… 小講堂にてお待ちしております。";
        }
        else if (flag == 8) {
            detailImage = [UIImage imageNamed:@"吹奏楽部.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"吹奏楽部";
            _explainSentence.text = @"今年も様々なジャンルの曲を演奏します。是非豪華な講堂で迫力のサウンドを！皆様のご来場をお待ちしています。";
        }
        else if (flag == 9) {
            detailImage = [UIImage imageNamed:@"ミュージックサロン.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"ミュージックサロン";
            _explainSentence.text = @"ミュージックサロンとは、講堂、小講堂で行われている有志生徒による演奏会です。聖光祭の、熱く盛り上がるだけでない、優美な一面をお楽しみください。曲目など詳細はパンフレットをご覧ください。";
        }
        else if (flag == 10) {
            detailImage = [UIImage imageNamed:@"天使の歌声.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"天使の歌声";
            _explainSentence.text = @"この春入学したばかりの中学1年生の歌声をお聴きください。";
        }
        else if (flag == 11) {
            detailImage = [UIImage imageNamed:@"数学研究会模擬講義.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"数学研究会模擬講義";
            _explainSentence.text = @"中学・高校で習う数学とは少し違う「数学」をネタに講義します。算数を使って、数学の世界をのぞいてみませんか。";
        }
        else if (flag == 12) {
            detailImage = [UIImage imageNamed:@"少林寺拳法部演武会.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"少林寺拳法部演武会";
            _explainSentence.text = @"少林寺拳法部です。聖光祭に向けて、日々鍛錬を重ねてきました。気迫と迫力に満ち溢れた少林寺拳法の演武を是非、ご覧ください！";
        }
        else if (flag == 13) {
            detailImage = [UIImage imageNamed:@"剣道部.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"剣道部";
            _explainSentence.text = @"昨年完成した新武道場にて、招待試合を開催します！気迫に満ちた聖光生の勇姿を是非ご覧ください！";
        }
        
    }else if ([_whatList isEqualToString:@"stage"]) {
        
        nav_title.text=@"Stage";
        
        if (flag == 1) {
            detailImage = [UIImage imageNamed:@"フォークダンス.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"フォークダンス";
            _explainSentence.text = @"オクラホマミキサーとマイムマイム！二つのダンスを中庭で聖光生たちと踊ります。聖光祭名物フォークダンス。踊らなきゃ損だよ！";
        }
        else if (flag == 2) {
            detailImage = [UIImage imageNamed:@"春夜祭.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"春夜祭";
            _explainSentence.text = @"初日を彩る華麗なパフォーマンスの数々。こんな聖光見たことない！絶対に見逃すな！";
        }
        else if (flag == 3) {
            detailImage = [UIImage imageNamed:@"Mr.聖光.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"Mr.聖光";
            _explainSentence.text = @"毎年恒例、聖光生の中で誰が一番”イケメン”なのか今年もハッキリさせようじゃないか!!!!";
        }
        else if (flag == 4) {
            detailImage = [UIImage imageNamed:@"Seiko-Dance-Performance.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"Seiko Dance Performance";
            _explainSentence.text = @"今年もやってきた！聖光生が超カッコイイ！？ダンスパフォーマンスで聖光祭を盛り上げる！";
        }
        else if (flag == 5) {
            detailImage = [UIImage imageNamed:@"のど自慢.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"のど自慢";
            _explainSentence.text = @"聖光祭と言ったらMr.の次にこれ！いや、次なんかじゃない。歌に秘められた力、皆さんを惚れさせます！";
        }
        else if (flag == 6) {
            detailImage = [UIImage imageNamed:@"ギネスに挑戦！！.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"ギネスに挑戦！！";
            _explainSentence.text = @"ギネスに記録にあの聖光生が挑戦！？果敢に記録に挑戦する聖光生の勇姿をとくとご覧あれ！！";
        }
        else if (flag == 7) {
            detailImage = [UIImage imageNamed:@"コミュ力の窓.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"コミュ力の窓";
            _explainSentence.text = @"「あっ…」「あの…」「えっと…」まさか聖光生は話すのが苦手！？そんなことはない！コミュ力を駆使した熾烈な戦いをご覧あれ！";
        }
        else if (flag == 8) {
            detailImage = [UIImage imageNamed:@"The 笑-1 GP.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"The 笑-1 GP";
            _explainSentence.text = @"あははははっははあははっははあはははああはははははっははははあはっははっはっはっはあ(文字数";
        }
        else if (flag == 9) {
            detailImage = [UIImage imageNamed:@"替え歌選手権.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"替え歌選手権";
            _explainSentence.text = @"歌は思いを伝えてこそ歌である！聖光生が思いを自らの歌詞に込めた「替え歌」とくとご鑑賞あれ！";
        }
        else if (flag == 10) {
            detailImage = [UIImage imageNamed:@"○○男子No.1決定戦.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"○○男子No.1決定戦";
            _explainSentence.text = @"それぞれの種目で聖光男子がNo.1を目指し闘う！「only oneじゃダメだ、No.1になれ！世界で１位の花になれ！」";
        }
        else if (flag == 11) {
            detailImage = [UIImage imageNamed:@"S-O-S.png"];
            mapImage = [UIImage imageNamed:@"map.jpg"];
            _detailTitle.text = @"S.O.S.";
            _explainSentence.text = @"イケメン、リッチ、天才、スポーツマンな聖光生は普通の感覚(sense)を失ってはいないだろうか…    彼らのセンスにご注目、、";
        }
    }
    
    detailImageview = [[UIImageView alloc] initWithFrame:CGRectMake(space, 0, self.view.bounds.size.width - space * 2, self.view.bounds.size.width - space * 2)];
    detailImageview.image = detailImage;
    mapImageview = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width + space, 0, self.view.bounds.size.width - space * 2, self.view.bounds.size.width - space * 2)];
    mapImageview.image = mapImage;
    [imageScroll addSubview:mapImageview];
    [imageScroll addSubview:detailImageview];
    
    
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:247.0/255.0 green:59.0/255.0 blue:63.0/255.0 alpha:1.0];
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    
    self.tabBarController.tabBar.tintColor = [UIColor colorWithRed:247.0/255.0 green:59.0/255.0 blue:63.0/255.0 alpha:1.0];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc]init];
    backButtonItem.title = @"";
    self.navigationItem.backBarButtonItem = backButtonItem;
    
    UIImageView *backView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    backView.image = [UIImage imageNamed:@"Blur.png"];
    [self.view addSubview:backView];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, self.view.bounds.size.width - space + spaceU + titleSize, self.view.bounds.size.width - 40, lineSize)];
    //CGRectMake(20, space + length + spaceU + titleSize, self.view.bounds.size.width - 40, lineSize)
    imageView.image = [UIImage imageNamed:@"line.png"];
    [self.view addSubview:imageView];
    
    [self.view addSubview:_detailTitle];
    [self.view addSubview:_explainSentence];
    
    UIViewController *rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
    rootViewController.modalPresentationStyle = UIModalPresentationCurrentContext;
    
    right = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - space, 0, space, self.view.bounds.size.width - space * 2)];
    [right setImage:[UIImage imageNamed:@"Right-to-Map.png"] forState:UIControlStateNormal];
    right.contentMode = UIViewContentModeScaleAspectFill;
    [right addTarget:self
              action:@selector(righton:) forControlEvents:UIControlEventTouchUpInside];
    [imageScroll addSubview:right];
    
    left = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width, 0, space, self.view.bounds.size.width - space * 2)];
    [left setImage:[UIImage imageNamed:@"Left-to-Map.png"] forState:UIControlStateNormal];
    left.contentMode = UIViewContentModeScaleAspectFill;
    [left addTarget:self
             action:@selector(lefton:) forControlEvents:UIControlEventTouchUpInside];
    [imageScroll addSubview:left];
    
    [self.view addSubview:imageScroll];
    
}

-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.barTintColor = [UIColor blackColor];
    
}

-(void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.barTintColor = [UIColor whiteColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)righton:(UIButton *)button{
    [imageScroll scrollRectToVisible:CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.width - space * 2) animated:YES];
}

-(void)lefton:(UIButton *)button{
    [imageScroll scrollRectToVisible:CGRectMake(0, 0, self.view.bounds.size.width - space, self.view.bounds.size.width - space * 2) animated:YES];
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
