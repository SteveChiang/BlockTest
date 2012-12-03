//
//  main.m
//  BlockTest
//
//  Created by Steve on 12/12/3.
//  Copyright (c) 2012年 Steve. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Test.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Test *obj = [[Test alloc] init];
        NSLog(@"SAMPLE 1");
        [obj blockSample1];
        
        NSLog(@"================");
        NSLog(@"SAMPLE 2");
        
        // 傳入一個block的實作到blockSample2 method
        // blockSample2的宣告如下
        // -(void)blockSample2:(int(^)(int, int))aBlock;
        [obj blockSample2:^int(int a, int b) {
            NSLog(@"[BLOCK] exec block...");
            NSLog(@"[BLOCK] find a:%d, b:%d", a, b);
            return a-b;
        }];
        
        
        NSLog(@"================");
        NSLog(@"SAMPLE 3");
        
        // 傳入一個block的實作到blockSample3 method
        // block型態：無傳入值，無回傳值
        // 此時，block實作可以簡寫成 ^{}
        // blockSample3的宣告如下
        // -(void)blockSample3:(void(^)(void))aBlock;
        [obj blockSample3:^{
            NSLog(@"[BLOCK] exec block...");
        }];
        
        NSLog(@"================");
        NSLog(@"SAMPLE 4");
        [obj blockSample4];
        
        NSLog(@"================");
        NSLog(@"SAMPLE 5");
        [obj blockSample5];
    }
    return 0;
}

