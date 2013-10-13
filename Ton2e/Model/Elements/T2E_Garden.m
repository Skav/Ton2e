//
//  T2E_Garden.m
//  Ton2e
//
//  Created by Skav on 9/28/13.
//  Copyright (c) 2013 Skav. All rights reserved.
//

#import "T2E_Garden.h"
#import "T2E_Tondeuse.h"
@interface T2E_Garden (){
    NSInteger iWidth;
    NSInteger iHeight;
}

@property (assign) NSInteger iWidth;
@property (assign) NSInteger iHeight;
@end


@implementation T2E_Garden
@synthesize iHeight;
@synthesize iWidth;

+ (T2E_Garden *) GardenWithMaxX:(NSInteger)iMaxX andMaxY:(NSInteger)iMaxY{
    return [[T2E_Garden alloc] initWithWidth:(iMaxX+1) andHeight:(iMaxY+1)];
}

+ (T2E_Garden *) GardenWithString:(NSString *)sGarden{
    sGarden = [sGarden stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString    *expression = @"[0-9]* [0-9]*";
    NSPredicate *predicate  = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", expression];
    BOOL match = [predicate evaluateWithObject:sGarden];
    if (match) {
        NSArray * aCoordinates = [sGarden componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        NSInteger iMaxX = [[aCoordinates objectAtIndex:0] integerValue];
        NSInteger iMaxY = [[aCoordinates objectAtIndex:1] integerValue];
        return [T2E_Garden GardenWithMaxX:iMaxX andMaxY:iMaxY];
    }
    DDLogError(@"Bad format for Garden : %@",sGarden);
    return nil;
}


- (instancetype) init{
    self = [super init];
    if (self != nil){
        self.iHeight = 1;
        self.iWidth = 1;
    }
    return self;
}

- (instancetype) initWithWidth:(NSInteger)_iWidth andHeight:(NSInteger)_iHeight{
    self = [super init];
    DDLogVerbose(@"initWith %d , %d",_iWidth,_iHeight);
    // Garden has to be min (1,1)
    if (_iHeight < 1 || _iWidth < 1){
        DDLogError(@"Invalid Parameters %d , %d",_iWidth,_iHeight);
        //TODO: May be throwing an exception, nil is fine for the moment
        return nil;
    }
    if (self != nil){
        self.iHeight = _iHeight;
        self.iWidth = _iWidth;
    }
    return self;
}


#pragma Manage Garden boundaries
- (BOOL) isValideCoordinatesX: (NSInteger)_iX andY: (NSInteger)_iY{
    return  (_iX >= 0)
        &&  (_iX < self.iWidth)
        &&  (_iY >= 0)
        &&  (_iY<self.iHeight);
}


#pragma mark Manage Tondeuzeuh 8D
- (BOOL) addTondeuse:(T2E_Tondeuse *) newTondeuse atX: (NSInteger)_iX andY: (NSInteger)_iY{
    if([self isValideCoordinatesX:_iX andY:_iY]){
        [newTondeuse setPositionWithX:_iX andY:_iY];
        [self registerGameElement:newTondeuse];
        return YES;
    }
    DDLogCWarn(@"The Tondeuse (%d,%d) is not in the boundaries of the Garden (%d,%d)",_iX,_iY,self.iWidth,self.iHeight);
    return NO;
}
- (BOOL) removeTondeuse:(T2E_Tondeuse *) uselessTondeuse{
    [self unregisterGameElement:uselessTondeuse];
    return YES;
}
- (NSArray *) getTondeuses{
    return [self getGameElements];
}

@end
