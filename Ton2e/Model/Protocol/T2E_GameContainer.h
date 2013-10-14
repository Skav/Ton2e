//
//  T2E_GameContainer.h
//  Ton2e
//
//  Created by Skav on 10/6/13.
//  Copyright (c) 2013 Skav. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Protocol for Containers
 */
@protocol T2E_GameContainer <NSObject>

@required
/**
 * Add a new object in this container
 * @param _gameElement to add
 */
- (void) registerGameElement: (T2E_GameElement *)_gameElement;
/**
 * Remove an object in this container
 * @param _gameElement to remove
 */
- (void) unregisterGameElement: (T2E_GameElement *)_gameElement;
/**
 * Return the list of Game Elements contained in the Container
 * @return an array of GameElements
 */
- (NSArray *) getGameElements;

@optional
- (BOOL) contains: (T2E_GameElement *)_gameElement;

@end
