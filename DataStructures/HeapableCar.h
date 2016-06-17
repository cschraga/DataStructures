//
//  HeapableCar.h
//  DataStructures
//
//  Created by Christian Schraga on 6/17/16.
//  Copyright © 2016 Straight Edge Digital. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Heapable.h"

@interface HeapableCar : NSObject <Heapable>

@property (nonatomic, nonnull, strong) NSString *make;
@property (nonatomic, nonnull, strong) NSString *model;
@property (nonatomic, nonnull, strong) NSNumber *msrp;

- (nullable id) initWithMake: (nonnull NSString *)make andModel: (nonnull NSString *)model andPrice: (nonnull NSNumber *)msrp;
+ (nullable HeapableCar *) carWithMake: (nonnull NSString *)make andModel: (nonnull NSString *)model andPrice: (nonnull NSNumber *)msrp;
- (nonnull NSString *) describeMe;

@end
