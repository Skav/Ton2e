//
//  T2E_GameManager.h
//  Ton2e
//
//  Created by Skav on 9/28/13.
//  Copyright (c) 2013 Skav. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface T2E_GameManager : NSObject{
    @private
}
-(instancetype) initGameAndPlay:(NSString *)fileName;
-(NSString *) getResults;
@end
