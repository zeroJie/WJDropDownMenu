//
//  ViewController.m
//  WJDownMenu
//
//  Created by 高文杰 on 16/1/24.
//  Copyright © 2016年 高文杰. All rights reserved.
//

#import "ViewController.h"
#import "WJDropdownMenu.h"

@interface ViewController () <WJMenuDelegate>



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"WJDropdownMenu";
    
    // 平时工作需要有个下拉菜单所以简单的封装了一个菜单功能很简单也没有优化可为大家做一个参考使用,以下是demo
    
    // 如果是有导航栏请清除自动适应设置
    self.automaticallyAdjustsScrollViewInsets = NO;
    NSArray *fourMenuTitleArray =  @[@"菜单A",@"菜单B",@"菜单C",@"菜单D"];

    
    //  创建第一个菜单的first数据second数据
    NSArray *firstArrOne = [NSArray arrayWithObjects:@"A一级菜单1",@"A一级菜单2",@"A一级菜单3", nil];
    NSArray *firstMenu = [NSArray arrayWithObject:firstArrOne];
    
    //  创建第二个菜单的first数据second数据
    NSArray *firstArrTwo = [NSArray arrayWithObjects:@"B一级菜单1",@"B一级菜单2", nil];
    NSArray *secondArrTwo = @[@[@"B二级菜单11",@"B二级菜单12"],@[@"B二级菜单21",@"B二级菜单22"]];
    NSArray *secondMenu = [NSArray arrayWithObjects:firstArrTwo,secondArrTwo, nil];
    
    //  创建第三个菜单的first数据second数据
    NSArray *firstArrThree = [NSArray arrayWithObjects:@"C一级菜单1",@"C一级菜单2", nil];
    NSArray *secondArrThree = @[@[@"C二级菜单11",@"C二级菜单12"],@[@"C二级菜单21",@"C二级菜单22"]];
    NSArray *threeMenu = [NSArray arrayWithObjects:firstArrThree,secondArrThree, nil];
    
    //  创建第四个菜单的first数据second数据
    NSArray *firstArrFour = [NSArray arrayWithObjects:@"D一级菜单1",@"D一级菜单2", nil];
    NSArray *secondArrFour = @[@[@"D二级菜单11",@"D二级菜单12"],@[@"D二级菜单21",@"D二级菜单22"]];
    NSArray *fourMenu = [NSArray arrayWithObjects:firstArrFour,secondArrFour, nil];
    
    
    WJDropdownMenu *menu = [[WJDropdownMenu alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 40)];
    menu.caverAnimationTime = 0.2;//  增加了遮盖层动画时间设置 不设置默认是 0.15
    menu.menuTitleFont = 12;      //  设置menuTitle字体大小 默认不设置是  11
    menu.tableTitleFont = 11;     //  设置tableTitle字体大小 默认不设置是 10
    menu.delegate = self;         //  设置代理
    menu.CarverViewColor = [UIColor clearColor];
    
    
    [self.view addSubview:menu];
    
    
    // 四组菜单调用方法
    [menu createFourMenuTitleArray:fourMenuTitleArray FirstArr:firstMenu SecondArr:secondMenu threeArr:threeMenu fourArr:fourMenu];
    
}
- (void)menuCellDidSelected:(NSInteger)MenuTitleIndex firstIndex:(NSInteger)firstIndex andSecondIndex:(NSInteger)secondIndex{
      NSLog(@"菜单数:%ld          一级菜单数:%ld      二级子菜单数:%ld",MenuTitleIndex,firstIndex,secondIndex);
}
- (void)menuCellDidSelected:(NSString *)MenuTitle firstContent:(NSString *)firstContent andSecondContent:(NSString *)secondContent{
      NSLog(@"菜单title:%@       一级菜单:%@         二级子菜单:%@",MenuTitle,firstContent,secondContent);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
