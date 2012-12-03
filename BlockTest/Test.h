//
//  Test.h
//  BlockTest
//
//  Created by Steve on 12/12/3.
//  Copyright (c) 2012年 Steve. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Test : NSObject
-(void)blockSample1;
-(void)blockSample2:(int(^)(int, int))aBlock;
-(void)blockSample3:(void(^)(void))aBlock;
-(void)blockSample4;
-(void)blockSample5;
@end
