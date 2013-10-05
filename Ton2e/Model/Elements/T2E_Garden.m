//
//  T2E_Garden.m
//  Ton2e
//
//  Created by Skav on 9/28/13.
//  Copyright (c) 2013 Skav. All rights reserved.
//

#import "T2E_Garden.h"

@interface T2E_Garden (){
    
}

@end


@implementation T2E_Garden
@synthesize iHeight;
@synthesize iWidth;

+ (T2E_Garden *) GardenWithWidth:(NSInteger)iWidth andHeight:(NSInteger)iHeight{
    return [[T2E_Garden alloc] initWithWidth:iWidth andHeight:iHeight];
}

- (instancetype) initWithWidth:(NSInteger)_iWidth andHeight:(NSInteger)_iHeight{
    self = [super init];
    DDLogVerbose(@"initWith %d , %d",_iWidth,_iHeight);
    // Garden has to be min (1,1)
    if (_iHeight<1 || _iWidth<1){
        DDLogError(@"Invalid Parameters %d , %d",_iWidth,_iHeight);
        return nil;
    }
    if (self != nil){
        self.iHeight = _iHeight;
        self.iWidth = _iWidth;
    }
    return self;
}
@end
