//
//  T2E_Tondeuse.h
//  Ton2e
//
//  Created by Skav on 9/28/13.
//  Copyright (c) 2013 Skav. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "T2E_GameElement.h"
@class T2E_Garden;

/**
 * Orientation is used to represent a Tondeuse Orientation.
 * It uses the 4 cardinal point
 */
typedef enum
{
    kOrientationNorth = 0,
    kOrientationEast = 1,
    kOrientationSouth = 2,
    kOrientationWest = 3,
}Orientation;

/**
 * Orders are used to move the tondeuse.
 * Orders are : Mode, rotatate clockwise and rotate anticlockwise
 * An invalid order has been created to handle invalid order
 */
typedef enum
{
    kOrderMove = 0,
    kOrderTurnClockwise = 1,
    kOrderTurnAntiClockwise = 2,
    kOrderInvalid = 3
}Order;

/**
 * A tondeuse is a game element.
 * It has a stack of order to execute, an orientation and X,Y coordinates
 */
@interface T2E_Tondeuse : T2E_GameElement{
    NSMutableArray *aStackOfOrder;
    Orientation oOrientation;
    NSInteger iX;
    NSInteger iY;
}
#pragma mark Creator
/**
 * Create a Tondeuse from Config file line, return the corresponding Tondeuse or nil il error in formating
 * @param the line for the tondeuse
 * @param the Garden for the tondeuse
 */
+ (instancetype) TondeuseWithString:(NSString *) sTondeuse AndGarden:(T2E_Garden *)oGarden;
#pragma mark Constructor
- (instancetype) init;
- (instancetype) initWithOrientation:(Orientation)kOrientation;

#pragma mark Position
/**
 * Turn the tondeuse clockwise
 */
- (void) turnClockwise;
/**
 * Turn the tondeuse anticlockwise
 */
- (void) turnAntiClockwise;
/**
 * setCoordinates for the tondeuse
 * @param _iX the new X position
 * @param _iY the new Y position
 */
- (void) setPositionWithX:(NSInteger)_iX andY:(NSInteger)_iY;
/**
 * get the orientation of the tondeuse
 * @return the orientation of the tondeuse
 */
- (Orientation) orientation;
/**
 * move the tondeuse
 */
- (void) move;

#pragma mark Order
/**
 * add an order to the stack
 * @param the new Order to add
 */
- (void) addOrderWithOrder:(Order)iOrder;
/**
 * add severals orders from the config file
 * @param the line from the config file
 */
- (void) addOrdersWithString:(NSString *)sOrder;
/**
 * The method for executing the stack.
 * @param firstInFirstOut indicate the way we process the orders
 */
- (void) executeStack:(BOOL)fisrtInFirstOut;
/**
 * Stirng representation of the tondeuse
 * Todo : put this methods in a category
 * @return The X Y Orientation of the tondeuse
 */
-(NSString *)stringRepresentation;
#pragma mark ConfigValidator
+ (BOOL)isValidConfigLineTondeuse:(NSString *)sConfig;
+ (BOOL)isValidConfigLineOrders:(NSString *)sConfig;
@end
