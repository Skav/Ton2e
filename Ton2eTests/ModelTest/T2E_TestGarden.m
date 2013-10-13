//
//  T2E_TestGarden.m
//  Ton2e
//
//  Created by Skav on 9/28/13.
//  Copyright (c) 2013 Skav. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "T2E_Garden.h"

@interface T2E_Garden (Test)
@property (assign) NSInteger iWidth;
@property (assign) NSInteger iHeight;
@property (retain,nonatomic) NSMutableArray *aGameElements;
@end

@interface T2E_TestGarden : XCTestCase

@end

@implementation T2E_TestGarden

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
    // Override point for customization after application launch.
    [DDLog removeAllLoggers];
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
     DDLogInfo(@"Testing Garden");
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
    DDLogInfo(@"End testing Garden");
}

#pragma mark Default init constructor
- (void)testGardenDefaultConstructor
{
    DDLogInfo(@"Testing Garden default Constructor");
    T2E_Garden * oGarden = [[T2E_Garden alloc] init];
    XCTAssertNotNil(oGarden, @"The garden is null");
    NSUInteger realWidthOfGarden = [oGarden iWidth];
    XCTAssertTrue(realWidthOfGarden == 1, @"The garden has a width of %d", realWidthOfGarden);
    NSUInteger realHeightOfGarden = [oGarden iHeight];
    XCTAssertTrue(realHeightOfGarden == 1, @"The garden has a height of %d", realHeightOfGarden);
    DDLogInfo(@"Testing Garden default Constructor : passed");
}

#pragma mark Default usual constructor
- (void)testGardenUsualConstructorWithNegative
{
    DDLogInfo(@"Testing Garden usual Constructor");
    T2E_Garden * oGarden = [[T2E_Garden alloc] initWithWidth:-1 andHeight:-1];
    XCTAssertNil(oGarden, @"The garden is not null");
    DDLogInfo(@"Testing Garden usual Constructor : passed");
}

- (void)testGardenUsualConstructorWithNegative1
{
    DDLogInfo(@"Testing Garden usual Constructor");
    T2E_Garden * oGarden = [[T2E_Garden alloc] initWithWidth:1 andHeight:-1];
    XCTAssertNil(oGarden, @"The garden is not null");
    DDLogInfo(@"Testing Garden usual Constructor : passed");
}

- (void)testGardenUsualConstructorWithNegative2
{
    DDLogInfo(@"Testing Garden usual Constructor");
    T2E_Garden * oGarden = [[T2E_Garden alloc] initWithWidth:-1 andHeight:1];
    XCTAssertNil(oGarden, @"The garden is not null");
    DDLogInfo(@"Testing Garden usual Constructor : passed");
}

- (void)testGardenUsualConstructorWithZero
{
    T2E_Garden * oGarden = [[T2E_Garden alloc] initWithWidth:0 andHeight:0];
    XCTAssertNil(oGarden, @"The garden is not null");
}
- (void)testGardenUsualConstructorWithZero1
{
    T2E_Garden * oGarden = [[T2E_Garden alloc] initWithWidth:1 andHeight:0];
    XCTAssertNil(oGarden, @"The garden is not null");
}
- (void)testGardenUsualConstructorWithZero2
{
    T2E_Garden * oGarden = [[T2E_Garden alloc] initWithWidth:0 andHeight:1];
    XCTAssertNil(oGarden, @"The garden is not null");
}
- (void)testGardenUsualConstructorWithSamePositive
{
    T2E_Garden * oGarden = [[T2E_Garden alloc] initWithWidth:1 andHeight:1];
    XCTAssertNotNil(oGarden, @"The garden is null");
    NSUInteger realWidthOfGarden = [oGarden iWidth];
    XCTAssertTrue(realWidthOfGarden == 1, @"The garden has a width of %d", realWidthOfGarden);
    NSUInteger realHeightOfGarden = [oGarden iHeight];
    XCTAssertTrue(realHeightOfGarden == 1, @"The garden has a height of %d", realHeightOfGarden);
}

- (void)testGardenUsualConstructorWithPositive
{
    DDLogInfo(@"Testing Garden usual Constructor");
    T2E_Garden * oGarden = [[T2E_Garden alloc] initWithWidth:5 andHeight:6];
    XCTAssertNotNil(oGarden, @"The garden is null");
    NSUInteger realWidthOfGarden = [oGarden iWidth];
    XCTAssertTrue(realWidthOfGarden == 5, @"The garden has a width of %d", realWidthOfGarden);
    NSUInteger realHeightOfGarden = [oGarden iHeight];
    XCTAssertTrue(realHeightOfGarden == 6, @"The garden has a height of %d", realHeightOfGarden);
    DDLogInfo(@"Testing Garden default Constructor : passed");
}


#pragma mark GameContainer
- (void)testRegisterGameElement
{
    T2E_Garden * oGarden = [[T2E_Garden alloc] initWithWidth:5 andHeight:6];
    XCTAssertNotNil([oGarden aGameElements], @"The garden containers is null");
    XCTAssertTrue([[oGarden aGameElements] count] == 0, @"The garden containers contains object oO");
    T2E_GameElement *oGenericGameElement1 = [[T2E_GameElement alloc] init];
    T2E_GameElement *oGenericGameElement2 = [[T2E_GameElement alloc] init];
    T2E_GameElement *oGenericGameElement3 = [[T2E_GameElement alloc] init];
    [oGarden registerGameElement:oGenericGameElement1];
    XCTAssertTrue([[oGarden aGameElements] count] == 1, @"The garden containers contains %d object ",[[oGarden aGameElements] count] );
    [oGarden registerGameElement:oGenericGameElement2];
    XCTAssertTrue([[oGarden aGameElements] count] == 2, @"The garden containers contains %d object ",[[oGarden aGameElements] count] );
    [oGarden registerGameElement:oGenericGameElement3];
    XCTAssertTrue([[oGarden aGameElements] count] == 3, @"The garden containers contains %d object ",[[oGarden aGameElements] count] );
    
}

- (void)testUnregisterGameElement
{
    T2E_Garden * oGarden = [[T2E_Garden alloc] initWithWidth:5 andHeight:6];
    XCTAssertNotNil([oGarden aGameElements], @"The garden containers is null");
    XCTAssertTrue([[oGarden aGameElements] count] == 0, @"The garden containers contains object oO");
    NSMutableArray *aGameElements = [[NSMutableArray alloc] initWithCapacity:15];
    for (int i = 0; i<15; i++) {
        T2E_GameElement *oGenericGameElement = [[T2E_GameElement alloc] init];
        [aGameElements addObject:oGenericGameElement];
    }
    for (T2E_GameElement *oGameElement in aGameElements) {
        [oGarden registerGameElement:oGameElement];
    }
    for (int i = 14; i>=0; i--) {
        T2E_GameElement *oGenericGameElement = [aGameElements objectAtIndex:i];
        [oGarden unregisterGameElement:oGenericGameElement];
        XCTAssertTrue([[oGarden aGameElements] count] == i, @"The garden containers contains %d object ",[[oGarden aGameElements] count] );
    }
}


- (void)testIsValidXandY
{
    T2E_Garden * oDefaultGarden = [[T2E_Garden alloc] init];
    XCTAssertTrue([oDefaultGarden isValideCoordinatesX:0 andY:0], @"The position is not in the Garden");
    XCTAssertFalse([oDefaultGarden isValideCoordinatesX:-1 andY:-1], @"The position is in the Garden");
    XCTAssertFalse([oDefaultGarden isValideCoordinatesX:-1 andY:0], @"The position is in the Garden");
    XCTAssertFalse([oDefaultGarden isValideCoordinatesX:0 andY:-1], @"The position is in the Garden");
    XCTAssertFalse([oDefaultGarden isValideCoordinatesX:1 andY:0], @"The position is in the Garden");
    XCTAssertFalse([oDefaultGarden isValideCoordinatesX:0 andY:1], @"The position is in the Garden");
    XCTAssertFalse([oDefaultGarden isValideCoordinatesX:1 andY:1], @"The position is in the Garden");
    
    T2E_Garden * oCustomGarden = [[T2E_Garden alloc] initWithWidth:5 andHeight:6];
    XCTAssertFalse([oCustomGarden isValideCoordinatesX:-1 andY:-1], @"The position is in the Garden");
    XCTAssertFalse([oCustomGarden isValideCoordinatesX:-1 andY:0], @"The position is in the Garden");
    XCTAssertFalse([oCustomGarden isValideCoordinatesX:0 andY:-1], @"The position is in the Garden");
    for (int x=0; x<5; x++) {
        for (int y=0; y<6; y++) {
             XCTAssertTrue([oCustomGarden isValideCoordinatesX:x andY:y], @"The position is not in the Garden");
        }
    }
    XCTAssertFalse([oCustomGarden isValideCoordinatesX:5 andY:6], @"The position is in the Garden");
}

@end
