//
//  TodayViewController.m
//  WidgetTarget
//
//  Created by LIAN on 2017/2/20.
//  Copyright © 2017年 com.Alice. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 200);
    //展示widget内容
    UILabel *titleL = [[UILabel alloc]initWithFrame:CGRectMake(10, 2, 200, 30)];
    titleL.text = @"today widget";
    [self.view addSubview:titleL];
    
    UIButton *actionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    actionBtn.frame = CGRectMake(10, 35, 200, 35);
    [actionBtn setTitle:@"click" forState:UIControlStateNormal];
    [actionBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [actionBtn setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:actionBtn];
    
}
- (void)btnClick:(id)sender{
    
    NSUserDefaults *def = [[NSUserDefaults alloc]initWithSuiteName:@"group.customer.test"];
    [def setObject:@"WIDGET_CLICK" forKey:@"CALLBACK"];
    [def synchronize];
    
    //调起app
    [self.extensionContext openURL:[NSURL URLWithString:@"WidgetTarget://test=?"] completionHandler:^(BOOL success) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end
