//
//  T2E_GameContainer.h
//  Ton2e
//
//  Created by Skav on 10/6/13.
//  Copyright (c) 2013 Skav. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *
 * Protocol for Containers
 */
@protocol T2E_GameContainer <NSObject>

@required

- (void) registerGameElement: (T2E_GameElement *)_gameElement;
- (void) unregisterGameElement: (T2E_GameElement *)_gameElement;
- (NSArray *) getGameElements;

@optional
- (BOOL) contains: (T2E_GameElement *)_gameElement;

@end
