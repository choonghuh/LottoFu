//
//  LuckyNumber.h
//  LottoFu
//
//  Created by Choong Choong Huh Huh on 1/28/15.
//  Copyright (c) 2015 WSUV. All rights reserved.
//
// Object to store luckynumbers

#import <Foundation/Foundation.h>

@interface LuckyNumber : NSObject

@property (strong, nonatomic) NSMutableArray *numbers;

//property generates max getter / setter methods
@property (assign, nonatomic) NSInteger maxNumber; //48 or 56
// Wanna know when max number changes, so
// gonna program the setter myself


- (instancetype)initWithMax:(NSInteger)max;
-(NSInteger)number:(NSInteger)i; // i=0...5
-(void)pickNumber:(NSInteger)i;  // i=0...5
-(void)pickAllNumbers;

@end
