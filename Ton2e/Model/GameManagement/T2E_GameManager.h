//
//  T2E_GameManager.h
//  Ton2e
//
//  Created by Skav on 9/28/13.
//  Copyright (c) 2013 Skav. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 * The Game Orchestrer, init/load, get results etc...
 * Todo: Create a protocol for it, provide a basic implementation, 
 * create a custom subclass for Ton2e
 */
@interface T2E_GameManager : NSObject{
    
}
/**
 * Init a game from configuration file
 */
-(instancetype) initGameAndPlay:(NSString *)fileName;
/**
 * Get the result of a game
 * @return a string the on each line the postion of a tondeuse
 */
-(NSString *) getResults;
@end
