//
//  ViewController.m
//  DrawHollowCircleDemo
//
//  Created by mac on 2019/8/20.
//  Copyright © 2019 coderzhong. All rights reserved.
//

#import "ViewController.h"
#import "TestVeiw.h"
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.blueColor;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self test3];
}

- (void)test3 {
    TestVeiw *guideView = [[TestVeiw alloc] initWithFrame:[UIScreen mainScreen].bounds];
    guideView.backgroundColor = [UIColor blackColor];
    guideView.alpha = 0.6;
    [[UIApplication sharedApplication].keyWindow addSubview:guideView];
    //画n个空心圆
    NSValue *value1 = [NSValue valueWithCGRect:CGRectMake(50, 50, 70, 70)];
    NSValue *value2 = [NSValue valueWithCGRect:CGRectMake(200, 200, 70, 70)];
    [guideView drawCircleTipWithRects:@[value1,value2]];
    
}

@end
