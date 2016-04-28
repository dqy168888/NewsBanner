//
//  ViewController.m
//  NewsBannerDemo
//
//  Created by sunhao－iOS on 16/4/28.
//  Copyright © 2016年 ssyzh. All rights reserved.
//

#import "ViewController.h"
#import "NewsBanner.h"
@interface ViewController ()<NewsBannerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NewsBanner *newsView = [[NewsBanner alloc]initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 20 )];
    
    newsView.noticeList = @[@"news1",@"news2",@"news3"];
    newsView.duration = 2;
    [self.view addSubview:newsView];
    newsView.delegate = self;
    [newsView star];

}
- (void)NewsBanner:(NewsBanner *)newsBanner didSelectIndex:(NSInteger)selectIndex
{
    NSLog(@"%ld",selectIndex);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
