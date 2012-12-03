//
//  Test.m
//  BlockTest
//
//  Created by Steve on 12/12/3.
//  Copyright (c) 2012年 Steve. All rights reserved.
//

#import "Test.h"

@implementation Test
-(id)init {
    self = [super init];
    if (self) {
    }
    return self;
}

// block宣告與使用方式
-(void)blockSample1 {
    NSLog(@"exec blockSample1 method");
    // 第一種方式
    // 宣告一個myBlock型態為: 傳入兩個int, 回傳一個NSString*
    typedef NSString* (^myBlock)(int, int);
    
    // 類似int a; 或是float b;
    myBlock block1;
    
    // 實作block1的內容
    block1 = ^(int x, int y) {
        NSLog(@"[BLOCK1] running");
        return [NSString stringWithFormat:@"%d * %d = %d", x, y, x*y];
    };
    
    
    // 第二種方式
    // 不事先定義type，直接實作它
    // block為: 傳入兩個int, 回傳一個NSString*
    NSString* (^block2)(int, int) = ^(int m, int n) {
        NSLog(@"[BLOCK2] running");
        return [NSString stringWithFormat:@"%d * %d = %d", m, n, m*n];
    };
    
    
    // 使用block
    NSLog(@"block1 returned: [%@]", block1(2,3));
    NSLog(@"block2 returned: [%@]", block2(6,7));
}

// 此method傳入一個block變數, 這個block有兩個int傳入, 一個int回傳
-(void)blockSample2:(int(^)(int, int))aBlock {
    NSLog(@"exec blockSample2 method");
    int a = 5;
    int b = 3;

    // 使用block
    // 傳入5,3, 回傳一個int
    // 不管block裡面的實作。
    int result = aBlock(5, 3);
    NSLog(@"aBlock(%d, %d) result: [%d]", a, b, result);
}

// 此method傳入一個block變數, 這個block沒有任何傳入跟回傳
-(void)blockSample3:(void(^)(void))aBlock {
    NSLog(@"exec blockSample3 method");
    aBlock();
}

// block可讀取外部變數的性質
-(void)blockSample4 {
    NSLog(@"exec blockSample4 method");
    int out_of_block_var = 10;
    
    // 實作 block
    NSString* (^block)(int) = ^(int block_local_var) {
        NSLog(@"[BLOCK] running");
        
        // 在block內可讀取block外的變數，但是是唯讀的
        NSLog(@"[BLOCK] find out var %d, in var %d", out_of_block_var, block_local_var);
        return [NSString stringWithFormat:@"%d - %d = %d",
                out_of_block_var, block_local_var, out_of_block_var - block_local_var];
    };
    
    // 使用 block
    NSLog(@"block2 returned: [%@]", block(8));
}

// block可存取外部變數的性質 (可寫入外部變數，但是要加上__block)
-(void)blockSample5 {
    NSLog(@"exec blockSample5 method");
    __block int out_of_block_var = 10;
    NSLog(@"out_of_block_var: %d", out_of_block_var);

    // 實作 block
    NSString* (^block)(int) = ^(int block_local_var) {
        NSLog(@"[BLOCK] running");
        
        NSLog(@"[BLOCK] find out var %d, in var %d", out_of_block_var, block_local_var);
        
        // 將外部變數改成 8 (寫入8到外部變數)
        NSLog(@"[BLOCK] modify out var to \"8\"");
        out_of_block_var = 8;
        
        NSLog(@"[BLOCK] find out var %d, in var %d", out_of_block_var, block_local_var);
        return [NSString stringWithFormat:@"%d - %d = %d",
                out_of_block_var, block_local_var, out_of_block_var - block_local_var];
    };
    
    // 使用 block
    NSLog(@"block2 returned: [%@]", block(8));
    NSLog(@"out_of_block_var: %d", out_of_block_var);
}
@end
