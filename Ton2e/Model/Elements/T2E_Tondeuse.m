//
//  T2E_Tondeuse.m
//  Ton2e
//
//  Created by Skav on 9/28/13.
//  Copyright (c) 2013 Skav. All rights reserved.
//

#import "T2E_Tondeuse.h"
#import "T2E_Garden.h"

#define North @"N"
#define East @"E"
#define West @"W"
#define South @"S"

#define Avance @"A"
#define Gauche @"G"
#define Droite @"D"

@interface T2E_Tondeuse (){
   
}

//Fifo <= first In, first Out
@property(retain,nonatomic)NSMutableArray *aStackOfOrder;
@property(assign)Orientation oOrientation;
@property(assign)NSInteger iX;
@property(assign)NSInteger iY;
+ (Orientation)orientationWithString:(NSString *) sString;
+ (Order)orderWithString:(NSString *) sString;
@end

@implementation T2E_Tondeuse
@synthesize aStackOfOrder,oOrientation,iX,iY;

+ (instancetype) TondeuseWithString:(NSString *) sTondeuse AndGarden:(T2E_Garden *)oGarden{
    sTondeuse = [sTondeuse stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString    *expression = [NSString stringWithFormat:@"[0-9]* [0-9]* [%@%@%@%@]",North,East,South,West];
    NSPredicate *predicate  = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", expression];
    BOOL match = [predicate evaluateWithObject:sTondeuse];
    if (match) {
        NSArray * aCoordinates = [sTondeuse componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        NSInteger iX = [[aCoordinates objectAtIndex:0] integerValue];
        NSInteger iY = [[aCoordinates objectAtIndex:1] integerValue];
        NSString *sOrientation = [aCoordinates objectAtIndex:2];
        T2E_Tondeuse *oTondeuse = [[T2E_Tondeuse alloc] initWithOrientation:[T2E_Tondeuse orientationWithString:sOrientation]];
        [oGarden addTondeuse:oTondeuse atX:iX andY:iY];
        return oTondeuse;
         
    }
    DDLogError(@"Bad format for Tondeuse : %@",sTondeuse);
    return nil;
}
- (instancetype) init{
    self = [super init];
    if (self != nil){
        self.oOrientation = kOrientationNorth;
        self.aStackOfOrder = [NSMutableArray arrayWithCapacity:0];
    }
    return self;
}
- (instancetype) initWithOrientation:(Orientation)_kOrientation{
    self = [super init];
    if (self != nil){
        self.oOrientation = _kOrientation;
        self.aStackOfOrder = [NSMutableArray arrayWithCapacity:0];
    }
    return self;
}

#pragma mark Position
- (void) turnClockwise{
    int iNewOrientation = (self.oOrientation + 5)%4;
    self.oOrientation = iNewOrientation;
}
- (void) turnAntiClockwise{
    int iNewOrientation = (self.oOrientation + 3)%4;
    self.oOrientation = iNewOrientation;
}
- (void) setPositionWithX:(NSInteger)_iX andY:(NSInteger)_iY{
    [self setIX:_iX];
    [self setIY:_iY];
}

#pragma mark Orientation
- (Orientation) orientation{
    return oOrientation;
}

+ (Orientation)orientationWithString:(NSString *) sString{
    sString = [sString uppercaseString];
    if( [sString isEqualToString:West]){
        return kOrientationWest;
    }if( [sString isEqualToString:South]){
        return kOrientationSouth;
    }if( [sString isEqualToString:East]){
        return kOrientationEast;
    }
    return kOrientationNorth;
}
+ (NSString *)stringWithOrientation:(Orientation)iOrientation{
    switch (iOrientation) {
        case kOrientationNorth:
            return North;
            break;
        case kOrientationEast:
            return East;
            break;
        case kOrientationWest:
            return West;
            break;
        case kOrientationSouth:
            return South;
            break;
            
        default:
            DDLogError(@"Orientation not valid : %d",iOrientation);
            return @"error";
            break;
    }
}

#pragma mark move
- (void) move{
    if ([self container] == nil) {
        DDLogCError(@"The tondeuse is not in a Garden !");
        return;
    }
    if (![[self container] isKindOfClass: [T2E_Garden class]]) {
        DDLogCError(@"The tondeuse is not in a Garden !");
        return;
    }
    T2E_Garden *oGarden = (T2E_Garden *)[self container];
    NSInteger newX = iX;
    NSInteger newY = iY;
    
    switch (self.oOrientation) {
        case kOrientationNorth:
            newY += 1;
            break;
            
        case kOrientationSouth:
            newY -= 1;
            break;
            
        case kOrientationEast:
            newX += 1;
            break;
            
        case kOrientationWest:
            newX -= 1;
            break;
            
        default:
            break;
    }
    if ([oGarden isValideCoordinatesX:newX andY:newY]){
        [self setPositionWithX:newX andY:newY];
    }
    else {
        DDLogCWarn(@"Coordinates out Of Boundaries : no move");
    }
}

#pragma mark Order
+ (Order)orderWithString:(NSString *) sString{
    sString = [sString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    sString = [sString uppercaseString];
    NSString    *expression = [NSString stringWithFormat:@"[%@%@%@]",Avance,Gauche,Droite];
    NSPredicate *predicate  = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", expression];
    BOOL match = [predicate evaluateWithObject:sString];
    if (match) {
        if ([sString isEqualToString:Avance]) {
            return kOrderMove;
        }
        if ([sString isEqualToString:Droite]) {
            return kOrderTurnClockwise;
        }
        if ([sString isEqualToString:Gauche]) {
            return kOrderTurnAntiClockwise;
        }
    }
    DDLogError(@"Invalid Order : %@",sString);
    return kOrderInvalid;
}
- (void) addOrderWithOrder:(Order)iOrder{
    if (self.aStackOfOrder == nil){
        self.aStackOfOrder = [[NSMutableArray alloc] initWithCapacity:0];
    }
    if(iOrder != kOrderInvalid){
        [self.aStackOfOrder addObject:[NSNumber numberWithInt:iOrder]];
    }
}
- (void) addOrdersWithString:(NSString *)sOrders{
    for (int i=0; i< [sOrders length]; i++) {
        NSString *sOrder = [NSString stringWithFormat:@"%c",[sOrders characterAtIndex:i]];
        [self addOrderWithOrder:[T2E_Tondeuse orderWithString:sOrder]];
    }
}
- (void) executeStack:(BOOL)fisrtInFirstOut{
    if (fisrtInFirstOut) {
        while ([self.aStackOfOrder count] != 0) {
            [self executeOrder: [[self.aStackOfOrder firstObject]intValue]];
            [self.aStackOfOrder removeObjectAtIndex:0];
        }
    }
    else {
        while ([self.aStackOfOrder count] != 0) {
            [self executeOrder: [[self.aStackOfOrder lastObject]intValue]];
            [self.aStackOfOrder removeLastObject];
        }
    }
    DDLogInfo(@"Finnished Stack");
    DDLogInfo(@"%d %d %@", self.iX,self.iY, [T2E_Tondeuse stringWithOrientation:self.oOrientation]);
}
- (void) executeOrder:(Order)iOrder{
    switch (iOrder) {
        case kOrderMove:
            [self move];
            break;
            
        case kOrderTurnAntiClockwise:
            [self turnAntiClockwise];
            break;
            
        case kOrderTurnClockwise:
            [self turnClockwise];
            break;
            
        default:
            DDLogError(@"Unreachable case reached : Order %d",iOrder);
            break;
    }
}
-(NSString *)stringRepresentation{
    return [NSString stringWithFormat:@"%d %d %@", self.iX, self.iY, [T2E_Tondeuse stringWithOrientation: self.oOrientation]];
}
@end
