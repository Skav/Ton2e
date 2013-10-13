//
//  T2E_TestGameContainer.m
//  Ton2e
//
//  Created by Skav on 10/6/13.
//  Copyright (c) 2013 Skav. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "T2E_GameElementContainer.h"

@interface T2E_GameElementContainer (Test)
@property (retain,nonatomic) NSMutableArray *aGameElements;
@end

@interface T2E_GameElement (Test){
}
@property (weak, nonatomic) T2E_GameElementContainer *oContainer;
@end

@interface T2E_TestGameContainer : XCTestCase

@end

@implementation T2E_TestGameContainer

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

#pragma mark GameContainer
- (void)testRegisterGameElement
{
    T2E_GameElementContainer * oGEC = [[T2E_GameElementContainer alloc] init];
 
    // trying to register nil
    [oGEC registerGameElement:nil];
    XCTAssertTrue([[oGEC aGameElements] count] == 0, @"The game element containers contains object oO");
    // trying to register NSObject
    [oGEC registerGameElement:[[NSObject alloc] init]];
    XCTAssertTrue([[oGEC aGameElements] count] == 0, @"The game element containers contains object oO");
    // trying to register good object
    XCTAssertNotNil(oGEC, @"The game element contains is null");
    XCTAssertTrue([[oGEC aGameElements] count] == 0, @"The game element containers contains object oO");
  
    for (int i = 0; i<5; i++) {
        T2E_GameElement *oGenericGameElement1 = [[T2E_GameElement alloc] init];
        [oGEC registerGameElement:oGenericGameElement1];
    
        XCTAssertTrue([[oGEC aGameElements] count] == (i+1), @"The game element containers contains %d object ",[[oGEC aGameElements] count] );
        T2E_GameElement *oObjectFromContainer = [[oGEC aGameElements] objectAtIndex:i];
        
        XCTAssertEqual(oObjectFromContainer, oGenericGameElement1, @"The game element at index %d is not the one expected",i);
        XCTAssertEqual(oObjectFromContainer.oContainer, oGEC, @"The game element at index %d is not the one expected",i);
    }
  }

- (void)testUnregisterGameElement
{
    T2E_GameElementContainer * oGEC = [[T2E_GameElementContainer alloc] init];
    XCTAssertNotNil([oGEC aGameElements], @"The game element containers is null");
    XCTAssertTrue([[oGEC aGameElements] count] == 0, @"The game element containers contains object oO");
    NSMutableArray *aGameElements = [[NSMutableArray alloc] initWithCapacity:15];
    for (int i = 0; i<15; i++) {
        T2E_GameElement *oGenericGameElement = [[T2E_GameElement alloc] init];
        [aGameElements addObject:oGenericGameElement];
    }
    for (T2E_GameElement *oGameElement in aGameElements) {
        [oGEC registerGameElement:oGameElement];
    }
    for (int i = 14; i>=0; i--) {
        T2E_GameElement *oGenericGameElement = [aGameElements objectAtIndex:i];
        [oGEC unregisterGameElement:oGenericGameElement];
        XCTAssertTrue([[oGEC aGameElements] count] == i, @"The game element containers contains %d object ",[[oGEC aGameElements] count] );
        XCTAssertNil([oGenericGameElement oContainer], @"The object is still contained");
    }
    
    // trying to unregister nil
    [oGEC unregisterGameElement:nil];
    XCTAssertTrue([[oGEC aGameElements] count] == 0, @"The game element containers contains object oO");
    
    // trying to unregister inexistent object
    [oGEC unregisterGameElement:[[T2E_GameElement alloc] init]];
    XCTAssertTrue([[oGEC aGameElements] count] == 0, @"The game element containers contains object oO");
}


@end
