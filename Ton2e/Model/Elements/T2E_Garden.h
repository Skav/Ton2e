//
//  T2E_Garden.h
//  Ton2e
//
//  Created by Skav on 9/28/13.
//  Copyright (c) 2013 Skav. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "T2E_GameElement.h"

@interface T2E_Garden : T2E_GameElement{
    NSInteger iWidth;
    NSInteger iHeight;
}

@property (assign) NSInteger iWidth;
@property (assign) NSInteger iHeight;

#pragma mark Creator
+ (T2E_Garden *) GardenWithWidth:(NSInteger)iWidth andHeight:(NSInteger)iHeight;

#pragma mark Constructor
- (instancetype) initWithWidth:(NSInteger)_iWidth andHeight:(NSInteger)_iHeight;
@end
