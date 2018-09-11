//
//  LXAOPTask+TaskTest.m
//  LXAopTask
//
//  Created by livesxu on 2018/9/10.
//  Copyright © 2018年 Livesxu. All rights reserved.
//

#import "LXAOPTask+TaskTest.h"

@implementation LXAOPTask (TaskTest)

+ (NSDictionary *)taskTestConfig;{
    
    return @{@"ViewController":@{
                     @"viewDidLoad":^(id<AspectInfo> aspectInfo) {
                         
                         UIViewController *vc = [aspectInfo instance];
                         
                         UIButton *nextBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 100, 100)];
                         nextBtn.backgroundColor = [UIColor redColor];
                         [vc.view addSubview:nextBtn];
                         
                         __weak UIViewController *weakVc = vc;
                         [nextBtn aspect_hookSelector:@selector(beginTrackingWithTouch:withEvent:) withOptions:AspectPositionAfter usingBlock:^(){
                             
                            Class class = NSClassFromString(@"NextViewController");
                             
                             UIViewController *nextVc = [[class alloc]init];
                             [weakVc presentViewController:nextVc animated:YES completion:nil];
                             
                         } error:nil];
                         
                         
                         UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(110, 110, 100, 100)];
                         backBtn.backgroundColor = [UIColor greenColor];
                         [vc.view addSubview:backBtn];
                         
                         [backBtn aspect_hookSelector:@selector(beginTrackingWithTouch:withEvent:) withOptions:AspectPositionAfter usingBlock:^(){
                             
                             [weakVc dismissViewControllerAnimated:YES completion:nil];
                             
                         } error:nil];
                         
                         UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 300, 200, 100)];
                         label.numberOfLines = 0;
                         label.text = [NSString stringWithFormat:@"%@",vc.description];
                         [vc.view addSubview:label];
                         
                        },
                     
                     },
             @"NextViewController":@{
                     @"viewDidLoad":^(id<AspectInfo> aspectInfo) {
                         
                         UIViewController *vc = [aspectInfo instance];
                         
                         UIButton *nextBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 100, 100)];
                         nextBtn.backgroundColor = [UIColor redColor];
                         [vc.view addSubview:nextBtn];
                         
                         __weak UIViewController *weakVc = vc;
                         [nextBtn aspect_hookSelector:@selector(beginTrackingWithTouch:withEvent:) withOptions:AspectPositionAfter usingBlock:^(){
                             
                             Class class = NSClassFromString(@"ViewController");
                             
                             UIViewController *nextVc = [[class alloc]init];
                             [weakVc presentViewController:nextVc animated:YES completion:nil];
                             
                         } error:nil];
                         
                         UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(110, 110, 100, 100)];
                         backBtn.backgroundColor = [UIColor greenColor];
                         [vc.view addSubview:backBtn];
                         
                         [backBtn aspect_hookSelector:@selector(beginTrackingWithTouch:withEvent:) withOptions:AspectPositionAfter usingBlock:^(){
                        
                             [weakVc dismissViewControllerAnimated:YES completion:nil];
                             
                         } error:nil];
                         
                         UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 300, 200, 100)];
                         label.numberOfLines = 0;
                         label.text = [NSString stringWithFormat:@"%@",vc.description];
                         [vc.view addSubview:label];
                        }
                     }
             
             };
}

@end
