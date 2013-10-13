//
//  T2E_GameElementContainer.m
//  Ton2e
//
//  Created by Skav on 10/6/13.
//  Copyright (c) 2013 Skav. All rights reserved.
//

#import "T2E_GameElementContainer.h"

@interface T2E_GameElementContainer (){
    NSMutableArray *aGameElements;
}
@property (retain,nonatomic) NSMutableArray *aGameElements;
@end

@implementation T2E_GameElementContainer
@synthesize aGameElements;


- (instancetype) init {
    self = [super init];
    if (self != nil) {
        self.aGameElements = [NSMutableArray arrayWithCapacity:0];
    }
    return self;
}

#pragma mark Implementation GameContainer
- (void) registerGameElement:(T2E_GameElement *)_gameElement{
    if(_gameElement == nil || ![_gameElement isKindOfClass:[T2E_GameElement class]])
    {
        DDLogCWarn(@"Trying to register a nil or not GameElement : Not permitted");
        return;
    }
    [self.aGameElements addObject:_gameElement];
    [_gameElement registerContainer:self];
}

- (void) unregisterGameElement:(T2E_GameElement *)_gameElement{
    if(_gameElement == nil)
    {
        DDLogCWarn(@"Trying to unregister a nil GameElement : Not permitted");
        return;
    }
    [self.aGameElements removeObject:_gameElement];
    [_gameElement unregisterContainer];
}

- (NSArray *) getGameElements{
    return [NSArray arrayWithArray: self.aGameElements ];
}
@end
