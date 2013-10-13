//
//  T2E_GameElement.m
//  Ton2e
//
//  Created by Skav on 9/28/13.
//  Copyright (c) 2013 Skav. All rights reserved.
//

#import "T2E_GameElement.h"
#import "T2E_GameElementContainer.h"
@interface T2E_GameElement (){
    __weak T2E_GameElementContainer *oContainer;
}
@property (weak, nonatomic) T2E_GameElementContainer *oContainer;

@end

@implementation T2E_GameElement
@synthesize oContainer;

-(void) registerContainer:(T2E_GameElementContainer *)container{
    [self setOContainer:container];
}
-(void) unregisterContainer{
    [self setOContainer:nil];
}
-(T2E_GameElementContainer *)container{
    return [self oContainer];
}
@end
