//
//  ViewController.m
//  ThreadTest
//
//  Created by 姚伟聪 on 2017/3/9.
//  Copyright © 2017年 姚伟聪. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"任务0");
    dispatch_async(dispatch_queue_create(0, DISPATCH_QUEUE_CONCURRENT), ^{
       
        NSLog(@"任务1 %@",[NSThread currentThread]);
        dispatch_sync(dispatch_get_global_queue(0, 0), ^{
           
            NSLog(@"任务3 %@",[NSThread currentThread]);
            
        });
        NSLog(@"任务4 %@",[NSThread currentThread]);
    });
    
    NSLog(@"任务2");
  
    
    //NSOperation
    /*
    NSBlockOperation *oper1 = [NSBlockOperation blockOperationWithBlock:^{
       
        [NSThread sleepForTimeInterval:5];
        NSLog(@"任务1 %@",[NSThread currentThread]);
    }];
    
    NSBlockOperation *oper2 = [NSBlockOperation blockOperationWithBlock:^{
        
        [NSThread sleepForTimeInterval:1];
        NSLog(@"任务2 %@",[NSThread currentThread]);
    }];
    
    
    NSBlockOperation *oper3 = [NSBlockOperation blockOperationWithBlock:^{
        
       
        NSLog(@"任务3 %@",[NSThread currentThread]);
    }];
    
    [oper3 addDependency:oper2];
    [oper3 addDependency:oper1];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [queue addOperation:oper1];
    [queue addOperation:oper2];
    [queue addOperation:oper3];
    */
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
