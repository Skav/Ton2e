//
//  T2E_TestGarden.m
//  Ton2e
//
//  Created by Skav on 9/28/13.
//  Copyright (c) 2013 Skav. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "T2E_Garden.h"
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
    XCTAssertTrue(realWidthOfGarden == 0, @"The garden has a width of %d", realWidthOfGarden);
    NSUInteger realHeightOfGarden = [oGarden iHeight];
    XCTAssertTrue(realHeightOfGarden == 0, @"The garden has a height of %d", realHeightOfGarden);
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
    XCTAssertNotNil(oGarden, @"The garden is not null");
    NSUInteger realWidthOfGarden = [oGarden iWidth];
    XCTAssertTrue(realWidthOfGarden == 1, @"The garden has a width of %d", realWidthOfGarden);
    NSUInteger realHeightOfGarden = [oGarden iHeight];
    XCTAssertTrue(realHeightOfGarden == 1, @"The garden has a height of %d", realHeightOfGarden);
}

- (void)testGardenUsualConstructorWithPositive
{
    DDLogInfo(@"Testing Garden usual Constructor");
    T2E_Garden * oGarden = [[T2E_Garden alloc] initWithWidth:5 andHeight:6];
    XCTAssertNotNil(oGarden, @"The garden is not null");
    NSUInteger realWidthOfGarden = [oGarden iWidth];
    XCTAssertTrue(realWidthOfGarden == 5, @"The garden has a width of %d", realWidthOfGarden);
    NSUInteger realHeightOfGarden = [oGarden iHeight];
    XCTAssertTrue(realHeightOfGarden == 6, @"The garden has a height of %d", realHeightOfGarden);
    DDLogInfo(@"Testing Garden default Constructor : passed");
}



@end
