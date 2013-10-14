//
//  T2E_GameElementContainer.h
//  Ton2e
//
//  Created by Skav on 10/6/13.
//  Copyright (c) 2013 Skav. All rights reserved.
//

#import "T2E_GameElement.h"
#import "T2E_GameContainer.h"
/**
 * This object represents an Object which can contain other Game Element.
 * Good exemple : Deck of cards, stacks of token, Game Boards ....
 */
@interface T2E_GameElementContainer : T2E_GameElement<T2E_GameContainer>



@end
