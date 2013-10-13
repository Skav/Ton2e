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

typedef enum
{
    kOrientationNorth = 0,
    kOrientationEast = 1,
    kOrientationSouth = 2,
    kOrientationWest = 3,
}Orientation;
typedef enum
{
    kOrderMove = 0,
    kOrderTurnClockwise = 1,
    kOrderTurnAntiClockwise = 2,
    kOrderInvalid = 3
}Order;

@interface T2E_Tondeuse : T2E_GameElement{
    @protected
    NSMutableArray *aStackOfOrder;
    @protected
    Orientation oOrientation;
    @protected
    NSInteger iX;
    @protected
    NSInteger iY;
}

+ (instancetype) TondeuseWithString:(NSString *) sTondeuse AndGarden:(T2E_Garden *)oGarden;
#pragma mark Constructor
- (instancetype) init;
- (instancetype) initWithOrientation:(Orientation)kOrientation;

#pragma mark Position
- (void) turnClockwise;
- (void) turnAntiClockwise;
- (void) setPositionWithX:(NSInteger)_iX andY:(NSInteger)_iY;
- (Orientation) orientation;
- (void) move;

#pragma mark Order
- (void) addOrderWithOrder:(Order)iOrder;
- (void) addOrdersWithString:(NSString *)sOrder;
- (void) executeStack:(BOOL)fisrtInFirstOut;

-(NSString *)stringRepresentation;
@end
