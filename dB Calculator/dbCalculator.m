//
//  dbCalculator.m
//  dB Calculator
//
//  Created by Ben Cox on 11/7/11.
//  Copyright 2011 Ben Cox. All rights reserved.
//

#import "dbCalculator.h"

@implementation dbCalculator

static double s_ln10;
static dispatch_once_t s_ln10_onceToken;
static NSString* const kRefLevelKey = @"refLevel";
static NSString* const kDBKey = @"dB";
static NSString* const kVoltsKey = @"volts";

@synthesize refLevel = mRefLevel;

- (id) init
{
    if ((self = [super init])) {
        dispatch_once(&s_ln10_onceToken, ^{
            s_ln10 = log(10.0);
        });
        mRefLevel = 0.775;
        self.dB = 4.0; // calculates mVolts.
    }    
    return self;
}

- (double) volts
{
    return mVolts;
}

- (void) setVolts:(double)volts
{
    mVolts = volts;
    [self willChangeValueForKey:kDBKey];
    mdB = 20.0 * log10(volts / mRefLevel);
    [self didChangeValueForKey:kDBKey];
}

- (double) dB
{
    return mdB;
}

- (void) setDB:(double)dB
{
    mdB = dB;
    [self willChangeValueForKey:kVoltsKey];
    mVolts = mRefLevel * exp(s_ln10 * dB / 20.0);
    [self didChangeValueForKey:kVoltsKey];
}

- (IBAction) setDBuRef:(id)sender
{
    [self willChangeValueForKey:kRefLevelKey];
    mRefLevel = 0.775;
    [self didChangeValueForKey:kRefLevelKey];
    self.dB = mdB; // Force volts to recalculate.
}

- (IBAction) setDBVRef:(id)sender
{
    [self willChangeValueForKey:kRefLevelKey];
    mRefLevel = 1;
    [self didChangeValueForKey:kRefLevelKey];
    self.dB = mdB; // Force volts to recalculate.
}

@end
