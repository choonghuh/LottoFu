//
//  LuckyNumber.m
//  LottoFu
//
//  Created by Choong Choong Huh Huh on 1/28/15.
//  Copyright (c) 2015 WSUV. All rights reserved.
//
// Object to store luckynumbers

#import "LuckyNumber.h"

@implementation LuckyNumber

- (instancetype)initWithMax:(NSInteger)max //Initializer
{
    if (self = [super init]) // initialize self as NSObject
    {
        _maxNumber = max;
        self.numbers = [[NSMutableArray alloc] initWithCapacity:6];
        for(int i=0; i<6; i++)
        {
            [self.numbers addObject:[NSNumber numberWithInt:-1]];
        }
        [self pickAllNumbers];
    }
    return self;
}
-(NSInteger)number:(NSInteger)i // i=0...5
{
    return [[self.numbers objectAtIndex:i] intValue];
}

-(void)setMaxNumber:(NSInteger)maxNumber
{
    //self.maxNumber = maxNumber  DONT. INFINITE LOOP
    
    if (_maxNumber != maxNumber)
    {
        _maxNumber = maxNumber;
        [self pickAllNumbers];
    }
}

-(void)pickNumber:(NSInteger)i  // i=0...5
{
    BOOL unique;
    
    NSInteger n;
    do
    {
        unique = YES;
        n = arc4random() % self.maxNumber+1;
        
        for(int j=0; j<6; j++)
            if(n==[[self.numbers objectAtIndex:j] intValue])
               {
                   unique=NO;
                   break;
               }
    } while(!unique);
    [self.numbers replaceObjectAtIndex:i withObject:[NSNumber numberWithInteger:n]];

}

-(void)pickAllNumbers
{
    for(int i=0; i<6; i++)
        self.numbers[i] = @-1;
    for(int i=0; i<6; i++)
        [self pickNumber:i];
}

@end
