//
//  ViewController.m
//  TodayWidgetDemo
//
//  Created by LIAN on 2017/2/20.
//  Copyright © 2017年 com.Alice. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong,nonatomic) UILabel *titleL;
@end

@implementation ViewController
@synthesize titleL = _titleL;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _titleL = [[UILabel alloc]initWithFrame:CGRectMake(50, 150, 230, 30)];
    _titleL.text = @"test";
    _titleL.textAlignment = NSTextAlignmentCenter;
    _titleL.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_titleL];
    
    // widget
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(fromTaday:) name:@"fromWidget" object:nil];
}
- (void)fromTaday:(NSNotification *)sendMeg{
    NSString *gainMessage = [NSString stringWithFormat:@"%@",sendMeg.object];
    NSLog(@"get message is %@",gainMessage);
    _titleL.text = gainMessage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
