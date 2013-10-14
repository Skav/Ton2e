//
//  T2E_GameElement.h
//  Ton2e
//
//  Created by Skav on 9/28/13.
//  Copyright (c) 2013 Skav. All rights reserved.
//

#import <UIKit/UIKit.h>
@class T2E_GameElementContainer;

/**
 * This object represents a Game Element, a physical thing, it's also the basic type for game objects.
 * A Game Element can be include in an other Game Element Container
 * Good exemple Of Game Elements : Pawn, Cards, Meeples, Token ...
 */
@interface T2E_GameElement : NSObject
/**
 * Add this Game Element inside a @link Game Element Container 
 * @param container : the container
 */
-(void) registerContainer:(T2E_GameElementContainer *)container;
/**
 * Remove this Game Element from his container, if any
 */
-(void) unregisterContainer;
/**
 * Return the Game Container of the Game Element, nil if Game element not registered
 * @return the container of the Game Element or nil if no game element
 */
-(T2E_GameElementContainer *)container;
@end
