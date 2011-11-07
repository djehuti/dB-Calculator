//
//  dbCalculator.h
//  dB Calculator
//
//  Created by Ben Cox on 11/7/11.
//  Copyright 2011 Ben Cox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface dbCalculator : NSObject
{
    double mRefLevel; // dBU = 0.775, dBV = 1.0
    double mVolts;
    double mdB;
}

@property (nonatomic, assign) double refLevel;
@property (nonatomic, assign) double volts;
@property (nonatomic, assign) double dB;

// Layer violations, oh me, oh my.

- (IBAction) setDBuRef:(id)sender;
- (IBAction) setDBVRef:(id)sender;

@end
