//
//  T2E_GameManager.m
//  Ton2e
//
//  Created by Skav on 9/28/13.
//  Copyright (c) 2013 Skav. All rights reserved.
//

#import "T2E_GameManager.h"
#import "T2E_Garden.h"
#import "T2E_Tondeuse.h"

@interface T2E_GameManager (){
    T2E_Garden *oGarden;
}
@property (retain,nonatomic) T2E_Garden *oGarden;
@end

@implementation T2E_GameManager
@synthesize oGarden;

-(instancetype) initGameAndPlay:(NSString *)fileName{
    self = [super init];
    if (self != nil){
        NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"txt"];
        NSString *testString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
        NSArray * lines = [testString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
        if ([lines count]<3) {
            DDLogError(@"Not enought lines");
            return nil;
        }
        if ([lines count]%2 != 1){
            DDLogError(@"Patern is One line for Garden and two for each Tondeuse");
            return nil;
        }
        self.oGarden = [T2E_Garden GardenWithString:[lines objectAtIndex:0]];
        for (int i = 1; i< [lines count];) {
            T2E_Tondeuse *oNewTondeuse = [T2E_Tondeuse TondeuseWithString:[lines objectAtIndex:i] AndGarden:oGarden];
            i++;
            [oNewTondeuse addOrdersWithString:[lines objectAtIndex:i]];
            [oNewTondeuse executeStack:YES];
            i++;
        }

    }
    return self;
}
-(NSString *) getResults{
    if (self.oGarden == nil) {
        return NSLocalizedString(@"No_RESULT", @"No result for Game");
    }
    else {
        NSMutableArray * results = [NSMutableArray arrayWithCapacity:0];
        for (T2E_Tondeuse *tondeuse in [oGarden getTondeuses]) {
            [results addObject:[tondeuse stringRepresentation]];
        }
        return [results componentsJoinedByString:@"\n"];
    }
}
@end
