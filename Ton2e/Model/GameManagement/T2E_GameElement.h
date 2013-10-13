//
//  T2E_GameElement.h
//  Ton2e
//
//  Created by Skav on 9/28/13.
//  Copyright (c) 2013 Skav. All rights reserved.
//

#import <UIKit/UIKit.h>
@class T2E_GameElementContainer;

@interface T2E_GameElement : NSObject

-(void) registerContainer:(T2E_GameElementContainer *)container;
-(void) unregisterContainer;
-(T2E_GameElementContainer *)container;
@end
