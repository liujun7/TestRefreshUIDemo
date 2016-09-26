//
//  ViewController.m
//  TestRefreshUIDemo
//
//  Created by liujun on 16/9/26.
//  Copyright © 2016年 Stanford University. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    dispatch_queue_t seriaQueue = dispatch_queue_create("seriaQueue", DISPATCH_QUEUE_SERIAL);
    //    dispatch_queue_t seriaQueue = dispatch_get_main_queue();
//        dispatch_queue_t currentQueue = dispatch_queue_create("currentQueue", DISPATCH_CURRENT_QUEUE_LABEL);
    dispatch_queue_t currentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

    dispatch_async(currentQueue, ^{
        
        NSLog(@"线程 = %@",[NSThread currentThread]);
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://img.mmkao.net/photo/beautyleg/beautyleg1308/15.jpg"]];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = [UIImage imageWithData:data];
            NSLog(@"刷新UI界面");
        });
        NSLog(@"代码块尾部！！！");
    });

    NSLog(@"线程结束了！！！！");
    
}

- (IBAction)loadImage:(UIButton *)sender {
    NSLog(@"加载图片！！！！");
}

@end
