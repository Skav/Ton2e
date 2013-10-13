//
//  T2E_TestTondeuse.m
//  Ton2e
//
//  Created by Skav on 10/13/13.
//  Copyright (c) 2013 Skav. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "T2E_Tondeuse.h"
#import "T2E_Garden.h"
@interface T2E_TestTondeuse : XCTestCase

@end

@interface T2E_Tondeuse (Test)

//Fifo <= first In, first Out
@property(retain,nonatomic)NSMutableArray *aStackOfOrder;
@property(assign)Orientation oOrientation;
@property(assign)NSInteger iX;
@property(assign)NSInteger iY;
@end

@implementation T2E_TestTondeuse

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

-(void) testInit {
    T2E_Tondeuse * oTondeuseN = [[T2E_Tondeuse alloc] initWithOrientation:kOrientationNorth];
    XCTAssert(oTondeuseN.orientation == kOrientationNorth, @"Error orientation");
    T2E_Tondeuse * oTondeuseE = [[T2E_Tondeuse alloc] initWithOrientation:kOrientationEast];
    XCTAssert(oTondeuseE.orientation == kOrientationEast, @"Error orientation");
    T2E_Tondeuse * oTondeuseS = [[T2E_Tondeuse alloc] initWithOrientation:kOrientationSouth];
    XCTAssert(oTondeuseS.orientation == kOrientationSouth, @"Error orientation");
    T2E_Tondeuse * oTondeuseW = [[T2E_Tondeuse alloc] initWithOrientation:kOrientationWest];
    XCTAssert(oTondeuseW.orientation == kOrientationWest, @"Error orientation");
}
- (void)testTurnClockwise{
    T2E_Tondeuse * oTondeuse = [[T2E_Tondeuse alloc] initWithOrientation:kOrientationNorth];
    XCTAssert(oTondeuse.orientation == kOrientationNorth, @"Error orientation");
    [oTondeuse turnClockwise];
    XCTAssert(oTondeuse.orientation == kOrientationEast, @"Error orientation");
    [oTondeuse turnClockwise];
    XCTAssert(oTondeuse.orientation == kOrientationSouth, @"Error orientation");
    [oTondeuse turnClockwise];
    XCTAssert(oTondeuse.orientation == kOrientationWest, @"Error orientation");
    [oTondeuse turnClockwise];
    XCTAssert(oTondeuse.orientation == kOrientationNorth, @"Error orientation");
    [oTondeuse turnClockwise];
    XCTAssert(oTondeuse.orientation == kOrientationEast, @"Error orientation");
    [oTondeuse turnClockwise];
    XCTAssert(oTondeuse.orientation == kOrientationSouth, @"Error orientation");
    [oTondeuse turnClockwise];
    XCTAssert(oTondeuse.orientation == kOrientationWest, @"Error orientation");
    [oTondeuse turnClockwise];
    XCTAssert(oTondeuse.orientation == kOrientationNorth, @"Error orientation");
}
- (void)testTurnAntiClockwise{
    T2E_Tondeuse * oTondeuse = [[T2E_Tondeuse alloc] initWithOrientation:kOrientationNorth];
    XCTAssert(oTondeuse.orientation == kOrientationNorth, @"Error orientation");
    [oTondeuse turnAntiClockwise];
    XCTAssert(oTondeuse.orientation == kOrientationWest, @"Error orientation");
    [oTondeuse turnAntiClockwise];
    XCTAssert(oTondeuse.orientation == kOrientationSouth, @"Error orientation");
    [oTondeuse turnAntiClockwise];
    XCTAssert(oTondeuse.orientation == kOrientationEast, @"Error orientation");
    [oTondeuse turnAntiClockwise];
    XCTAssert(oTondeuse.orientation == kOrientationNorth, @"Error orientation");
    [oTondeuse turnAntiClockwise];
    XCTAssert(oTondeuse.orientation == kOrientationWest, @"Error orientation");
    [oTondeuse turnAntiClockwise];
    XCTAssert(oTondeuse.orientation == kOrientationSouth, @"Error orientation");
    [oTondeuse turnAntiClockwise];
    XCTAssert(oTondeuse.orientation == kOrientationEast, @"Error orientation");
}

- (void) testNoMove{
    T2E_Tondeuse * oTondeuse = [[T2E_Tondeuse alloc] initWithOrientation:kOrientationNorth];
    [oTondeuse move];
    XCTAssert(oTondeuse.iX == 0, @"The toneuse has moved");
    XCTAssert(oTondeuse.iY == 0, @"The toneuse has moved");
    [oTondeuse turnClockwise];
    [oTondeuse move];
    XCTAssert(oTondeuse.iX == 0, @"The toneuse has moved");
    XCTAssert(oTondeuse.iY == 0, @"The toneuse has moved");
    [oTondeuse turnClockwise];
    [oTondeuse move];
    XCTAssert(oTondeuse.iX == 0, @"The toneuse has moved");
    XCTAssert(oTondeuse.iY == 0, @"The toneuse has moved");
    [oTondeuse turnClockwise];
    [oTondeuse move];
    XCTAssert(oTondeuse.iX == 0, @"The toneuse has moved");
    XCTAssert(oTondeuse.iY == 0, @"The toneuse has moved");
    T2E_Garden *oGarden = [[T2E_Garden alloc] initWithWidth:1 andHeight:1];
    [oGarden addTondeuse:oTondeuse atX:0 andY:0];
    [oTondeuse move];
    XCTAssert(oTondeuse.iX == 0, @"The toneuse has moved");
    XCTAssert(oTondeuse.iY == 0, @"The toneuse has moved");
    [oTondeuse turnClockwise];
    [oTondeuse move];
    XCTAssert(oTondeuse.iX == 0, @"The toneuse has moved");
    XCTAssert(oTondeuse.iY == 0, @"The toneuse has moved");
    [oTondeuse turnClockwise];
    [oTondeuse move];
    XCTAssert(oTondeuse.iX == 0, @"The toneuse has moved");
    XCTAssert(oTondeuse.iY == 0, @"The toneuse has moved");
    [oTondeuse turnClockwise];
    [oTondeuse move];
    XCTAssert(oTondeuse.iX == 0, @"The toneuse has moved");
    XCTAssert(oTondeuse.iY == 0, @"The toneuse has moved");
}
- (void) testMove1{
    T2E_Tondeuse * oTondeuse1 = [[T2E_Tondeuse alloc] initWithOrientation:kOrientationNorth];
    T2E_Garden *oGarden = [T2E_Garden GardenWithMaxX:5 andMaxY:5];
    [oGarden addTondeuse:oTondeuse1 atX:1 andY:2];
    //GAGAGAGAA
    [oTondeuse1 turnAntiClockwise];
    [oTondeuse1 move];
    [oTondeuse1 turnAntiClockwise];
    [oTondeuse1 move];
    [oTondeuse1 turnAntiClockwise];
    [oTondeuse1 move];
    [oTondeuse1 turnAntiClockwise];
    [oTondeuse1 move];
    [oTondeuse1 move];
    XCTAssert(oTondeuse1.iX == 1, @"The toneuse has wrong X");
    XCTAssert(oTondeuse1.iY == 3, @"The toneuse has wrong Y");
    XCTAssert(oTondeuse1.oOrientation == kOrientationNorth, @"The toneuse has wrong orientation");
}
-(void) testMove2{
    T2E_Tondeuse * oTondeuse2 = [[T2E_Tondeuse alloc] initWithOrientation:kOrientationEast];
    T2E_Garden *oGarden = [T2E_Garden GardenWithMaxX:5 andMaxY:5];
    [oGarden addTondeuse:oTondeuse2 atX:3 andY:3];
    //AADAADADDA
    [oTondeuse2 move];
    [oTondeuse2 move];
    [oTondeuse2 turnClockwise];
    [oTondeuse2 move];
    [oTondeuse2 move];
    [oTondeuse2 turnClockwise];
    [oTondeuse2 move];
    [oTondeuse2 turnClockwise];
    [oTondeuse2 turnClockwise];
    [oTondeuse2 move];
    XCTAssert(oTondeuse2.iX == 5, @"The toneuse has wrong X");
    XCTAssert(oTondeuse2.iY == 1, @"The toneuse has wrong Y");
    XCTAssert(oTondeuse2.oOrientation == kOrientationEast, @"The toneuse has wrong orientation");
}
@end
