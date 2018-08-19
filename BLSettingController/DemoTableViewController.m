//
//  DemoTableViewController.m
//  BaseSettingCellExample
//
//  Created by Jack on 2018/5/10.
//  Copyright © 2018年 bianla. All rights reserved.
//

#import "DemoTableViewController.h"
#import "BLSetting.h"

@interface DemoTableViewController ()
@property(nonatomic,strong)NSMutableArray *datas;
@end

@implementation DemoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _datas = [NSMutableArray array];
    
    __weak typeof(self) weakSelf = self;
    
    //默认样式
    BLSettingModel *md1 = [BLSettingFactory normalWithIcon:@"kehu_icon_jihua" title:@"我是默认样式" detailTitle:@"我是默认描述" showArrow:YES cellClickAction:nil];
    md1.showRedDot(YES).cellH(120).cellClikedOperation(^(BLSettingModel *model) {
        model.descTitle(@"我被点击了");
        [weakSelf.tableView reloadData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            model.descTitle(@"我是默认样式");
            [weakSelf.tableView reloadData];
        });
    });
    
    BLSettingModel *md2  = [BLSettingFactory normalWithIcon:@"kehu_icon_jihua" title:@"我是默认样式" detailTitle:@"我是默认描述" showArrow:NO cellClickAction:nil];
    md1.showRedDot(YES).cellH(45).cellClikedOperation(^(BLSettingModel *model) {
        model.descTitle(@"我被点击了");
        [weakSelf.tableView reloadData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            model.descTitle(@"我是默认样式");
            [weakSelf.tableView reloadData];
        });
    });
    
   
    //开关样式
    BLSettingModel *md3 = [BLSettingFactory switchWithIcon:@"kehu_icon_jilu2" title:@"我的状态开启" switchIsOn:YES switchAction:^(BLSettingModel *model, BOOL switchIsOn) {
        model.titleText([NSString stringWithFormat:@"我的状态%@",switchIsOn?@"开启":@"关闭"]) ;
        [weakSelf.tableView reloadData];
    }];

    BLSettingModel *md4 = [BLSettingFactory switchWithIcon:@"kehu_icon_jilu2" title:@"我的状态关闭" switchIsOn:NO switchAction:nil];
    md4.switchOperation(^(BLSettingModel *model, BOOL switchIsOn) {
        model.titleText([NSString stringWithFormat:@"我的状态%@",switchIsOn?@"开启":@"关闭"]) ;
        [weakSelf.tableView reloadData];
    });
    
    //segument
    BLSettingModel *md5 = [BLSettingFactory segumentWithIcon:@"kehu_icon_kaluli" title:@"我是segument" segumentTitleArr:@[@"kg",@"斤",@"磅"] selectIndex:1 segumentAction:^(BLSettingModel *model, NSArray *segumentTitlsArr, NSInteger selectIndex) {
        model.titleText([NSString stringWithFormat:@"你选择了%@",segumentTitlsArr[selectIndex]]) ;
        [weakSelf.tableView reloadData];
    }];
    
    BLSettingModel *md6 = [BLSettingFactory segumentWithIcon:@"kehu_icon_kaluli" title:@"我是segument" segumentTitleArr:@[@"kg",@"斤",@"磅"] selectIndex:1 segumentAction:nil];
    md6.segumentOperation(^(BLSettingModel *model, NSArray *segumentTitlsArr, NSInteger selectIndex) {
        model.titleText([NSString stringWithFormat:@"你选择了%@",segumentTitlsArr[selectIndex]]) ;
        [weakSelf.tableView reloadData];
    });
    
    BLSettingModel *md7 =  [BLSettingFactory normalWithIcon:@"kehu_icon_niaotong" title:@"右侧图标展示箭头" rightIcon:@"kehu_icon_shijian" showArrow:YES cellClickAction:^(BLSettingModel *model) {
        model.descTitle(@"我被点击了");
        [weakSelf.tableView reloadData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            model.descTitle(@"右侧辅助视图");
            [weakSelf.tableView reloadData];
        });
    }];
    
    BLSettingModel *md8 =  [BLSettingFactory normalWithIcon:@"kehu_icon_niaotong" title:@"右侧图标不显示箭头" rightIcon:@"kehu_icon_shijian" showArrow:YES cellClickAction:nil];
    md8.cellClikedOperation(^(BLSettingModel *model) {
        model.descTitle(@"我被点击了");
        [weakSelf.tableView reloadData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            model.descTitle(@"右侧辅助视图");
            [weakSelf.tableView reloadData];
        });
    });
    
    
    //自定义默认样式
    UIFont *font = [UIFont boldSystemFontOfSize:15];
    UIColor *color = [UIColor redColor];
    BLSettingStyle *style = [BLSettingStyle settingStyleWithTitleFont:font titleColor:color descFont:font descColor:color];
    BLSettingModel *md9 = [BLSettingFactory normalWithIcon:@"kehu_icon_jihua" title:@"我是默认类型自定样式" detailTitle:@"我是默认描述" showArrow:YES cellClickAction:nil];
    md9.style(style);
    md9.cellClikedOperation(^(BLSettingModel *model) {
        model.descTitle( @"我被点击了");
        [weakSelf.tableView reloadData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            model.descTitle( @"我是默认样式");
            [weakSelf.tableView reloadData];
        });
    }).style(style);

    
    //自定义开关样式
    UIFont *font1 = [UIFont boldSystemFontOfSize:18];
    UIColor *color1 = [UIColor blueColor];
    BLSettingStyle *style1 = [BLSettingStyle settingStyleWithTitleFont:font1 titleColor:color1 descFont:font1 descColor:color1 switchOnTintColor:color1];
    BLSettingModel *md10 = [BLSettingFactory switchWithIcon:@"kehu_icon_jilu2" title:@"开关自定义样式" switchIsOn:NO switchAction:nil];
    md10.cellClikedOperation(^(BLSettingModel *model) {
        model.titleText( @"我被点击了");
        [weakSelf.tableView reloadData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            model.titleText( @"开关自定义样式");
            [weakSelf.tableView reloadData];
        });
    }).style(style1);

    //自定义segment样式
    UIFont *font2 = [UIFont boldSystemFontOfSize:20];
    UIColor *color2 = [UIColor orangeColor];
    BLSettingStyle *style2 = [BLSettingStyle settingStyleWithTitleFont:font2 titleColor:color2 descFont:font2 descColor:color2 switchOnTintColor:color2];
    BLSettingModel *md11 = [BLSettingFactory segumentWithIcon:@"kehu_icon_kaluli" title:@"我是segument" segumentTitleArr:@[@"Man",@"Weman",@"dog"] selectIndex:1 segumentAction:nil];
    md11.cellClikedOperation(^(BLSettingModel *model) {
        model.descTitle( @"我被点击了");
        [weakSelf.tableView reloadData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            model.descTitle( @"自定义segment样式");
            [weakSelf.tableView reloadData];
        });
    }).style(style2);
    
    //自定义segment样式
    UIFont *font3 = [UIFont boldSystemFontOfSize:20];
    UIColor *color3 = [UIColor purpleColor];
    BLSettingStyle *style3 = [BLSettingStyle settingStyleWithTitleFont:font3 titleColor:color3 descFont:font3 descColor:color3 switchOnTintColor:color3];
    style3.segumentNormalTextStyle(
   @{
    NSForegroundColorAttributeName:[UIColor yellowColor],
    NSFontAttributeName:[UIFont boldSystemFontOfSize:16]
    }).segumentSelectedTextStyle(
  @{
      NSForegroundColorAttributeName:[UIColor greenColor],
    NSFontAttributeName:[UIFont boldSystemFontOfSize:18]
      });
    BLSettingModel *md12 = [BLSettingFactory segumentWithIcon:@"kehu_icon_kaluli" title:@"我是segument" segumentTitleArr:@[@"啤酒",@"可乐",@"橙汁"] selectIndex:1 segumentAction:nil];
    md12.segumentOperation(^(BLSettingModel *model, NSArray *selectSwitchArr, NSInteger selectIndex) {
        model.titleText([NSString stringWithFormat:@"选择了%@",selectSwitchArr[selectIndex]]) ;
        [weakSelf.tableView reloadData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            model.titleText(@"自定义segment样式");
            [weakSelf.tableView reloadData];
        });
    }).style(style3);

    //链式语法创建自定义默认样式
    BLSettingStyle *style4 = [BLSettingStyle style]
    .leftTitleFontSize(18)
    .leftImageSize(CGSizeMake(100, 100))
    .rightImageSize(CGSizeMake(50, 50))
    .descTitleFontSize(10)
    .descTitleColor([UIColor redColor])
    .addLeftIconRadius(15);
    
    BLSettingModel *md13 = [BLSettingModel model]
    .titleText(@"我是通过链式语法实现")
    .descTitle(@"我是描述文字")
    .showArrow(YES)
    .style(style4)
    .cellClikedOperation(^(BLSettingModel *model) {
        model.titleText(@"我被点击了");
        [weakSelf.tableView reloadData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            model.titleText(@"我是通过链式语法实现");
            [weakSelf.tableView reloadData];
        });
    });
    
    BLSettingModel *md14 = [BLSettingFactory textFieldWithIcon:@"kehu_icon_kaluli" title:@"文本框" placeHolder:@"感觉胖了 用变啦" textMaxLength:4 didChangeAction:^(BLSettingModel *model, UITextField *textField) {
        NSLog(@"文本框文字发生改变");
    } reachesMaxLengthAction:^(BLSettingModel *model, UITextField *textField) {
        NSLog(@"您输入的文字已经达到最大长度");
    }];

    BLSettingModel *md15 = [BLSettingFactory textFieldWithIcon:nil title:@"文本框" placeHolder:@"感觉胖了 用变啦" textMaxLength:12 didChangeAction:^(BLSettingModel *model, UITextField *textField) {
        NSLog(@"文本框文字发生改变");
    } reachesMaxLengthAction:^(BLSettingModel *model, UITextField *textField) {
        NSLog(@"您输入的文字已经达到最大长度");
    }];

    //链式语法创建自定义默认样式
    BLSettingStyle *style5 = [BLSettingStyle style]
    .textFieldTextColor(BLSETTINGHEXCOLOR(0x666666))
    .textFieldTextFont([UIFont systemFontOfSize:16])
    .textFieldPlaceHolderColor([UIColor redColor])
    .textFieldPlaceHolderFont([UIFont systemFontOfSize:20]);

    BLSettingModel *md16 =  [BLSettingModel model];
    md16.type(BLSettingCellTypeRightTextField)
    .leftIconName(@"kehu_icon_kaluli").titleText(@"文本框自定义样式").textFieldPlaceHolder(nil)
    .textFieldTextMaxLength(20).textFieldDidChangeAction(^(BLSettingModel *model, UITextField *textField) {
        NSLog(@"文本框文字发生改变");
    }).textFieldTextReachesMaxLengthAction(^(BLSettingModel *model, UITextField *textField) {
        NSLog(@"您输入的文字已经达到最大长度");
    }).style(style5);
    
    BLSettingModel *md17 = [BLSettingFactory avaterWithIcon:@"kehu_icon_kaluli" title:@"文本框自定义样式" detailTitle:@"显示箭头" isShowArrow:YES cellClickAction:^(BLSettingModel *model) {
        NSLog(@"点我干嘛");
    }];
    md17.cellH(100);
    
    BLSettingModel *md18 = [BLSettingFactory avaterWithIcon:@"kehu_icon_kaluli" title:@"文本框自定义样式" detailTitle:@"隐藏箭头" isShowArrow:NO cellClickAction:^(BLSettingModel *model) {
        NSLog(@"点我干嘛");
    }];
    md18.cellH(100);

    [self.datas addObject:md1];
    [self.datas addObject:md2];
    [self.datas addObject:md3];
    [self.datas addObject:md4];
    [self.datas addObject:md5];
    [self.datas addObject:md6];
    [self.datas addObject:md7];
    [self.datas addObject:md8];
    [self.datas addObject:md9];
    [self.datas addObject:md10];
    [self.datas addObject:md11];
    [self.datas addObject:md12];
    [self.datas addObject:md13];
    [self.datas addObject:md14];
    [self.datas addObject:md15];
    [self.datas addObject:md16];
    [self.datas addObject:md17];
    [self.datas addObject:md18];


}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BLSettingModel *settM = self.datas[indexPath.row];
    BLSettingBaseCell *cell = [BLSettingFactory createCellWithTableView:tableView model:settM];
    [cell configModel:settM];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    BLSettingModel *settM = self.datas[indexPath.row];
    if (settM.cellHeight > 0) {
        return settM.cellHeight;
    }
    return 55;
}

@end
