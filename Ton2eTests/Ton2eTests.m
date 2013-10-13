//
//  Ton2eTests.m
//  Ton2eTests
//
//  Created by Skav on 9/28/13.
//  Copyright (c) 2013 Skav. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "T2E_GameManager.h"
@interface Ton2eTests : XCTestCase

@end

@implementation Ton2eTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testScenario
{
    [[T2E_GameManager alloc ]initGameAndPlay:@"TestScenario"];
}

@end
