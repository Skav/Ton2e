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
    NSUInteger iWidth;
    NSUInteger iHeight;
}

@property (assign) NSUInteger iWidth;
@property (assign) NSUInteger iHeight;


+ (T2E_Garden *) createGardenWithWidth:(NSUInteger)iWidth andHeight:(NSUInteger)iHeight;
@end
