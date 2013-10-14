//
//  T2E_Garden.h
//  Ton2e
//
//  Created by Skav on 9/28/13.
//  Copyright (c) 2013 Skav. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "T2E_GameElementContainer.h"
#import "T2E_GameContainer.h"

@class T2E_Tondeuse;
/**
 * The Garden is a grid. Width and X represent Horizontal. Height and Y represent Vertical.
 * Min Size of a Grid is Width 1 and Height 1, corresponding to one sized Grid of coordinate (0,0).
 * PS : refactor this class to create a GameBoardClass. Cf project iBoardGame.
 */
@interface T2E_Garden : T2E_GameElementContainer{
   
}

#pragma mark Creator
/**
 * Return an instance of a Garden with Max coordinates
 * @param iMaxX is the rigth coordinates
 * @param iMaxY is the top coordinates
 * @return T2E_Garden*
 */
+ (T2E_Garden *) GardenWithMaxX:(NSInteger)iMaxX andMaxY:(NSInteger)iMaxY;
+ (T2E_Garden *) GardenWithString:(NSString *)sGarden;

#pragma mark ConfigValidator
+ (BOOL)isValidConfigLine:(NSString *)sConfig;
#pragma mark Constructor
/**
 * Return an instance of a Garden with the specified size.
 * @param iWidth
 * @param iHeight
 * @return T2E_Garden*
 */
- (instancetype) initWithWidth:(NSInteger)_iWidth andHeight:(NSInteger)_iHeight;

#pragma Manage Garden boundaries
/**
 * Check if Coordinates are in GardenBoundaries
 * @param _iX
 * @param _iY
 * @return YES is the Coordinates are in the GardenBoundaries
 */
- (BOOL) isValideCoordinatesX: (NSInteger)_iX andY: (NSInteger)_iY;

#pragma mark Manage Tondeuzeuh 8D
/**
 * Add a new Tondeuse in the Garden. Return Yes if everything is ok. May be later add NSError.
 * @param newTondeuze
 * @param _iX
 * @param _iY
 * @return Yes if everything is ok. May be later add NSError.
 */
- (BOOL) addTondeuse:(T2E_Tondeuse *) newTondeuze atX: (NSInteger)_iX andY: (NSInteger)_iY;

/**
 * Return an instance of a Garden with the specified size.
 * @param uselessTondeuse. Poor, poor Tondeuse :'(
 * @return Yes if everything is ok. May be later add NSError.
 */
- (BOOL) removeTondeuse:(T2E_Tondeuse *) uselessTondeuse;
/**
 * Return an array of Tondeuse
 * @return An Array Of Tondeuse
 */
- (NSArray *) getTondeuses;

@end
