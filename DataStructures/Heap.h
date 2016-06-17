//
//  Heap.h
//  DataStructures
//
//  Created by Christian Schraga on 6/16/16.
//  Copyright © 2016 Straight Edge Digital. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Heap : NSObject

@property (nonatomic, nonnull, strong) NSMutableArray *values;
@property (nonatomic, assign) BOOL minHeap;

- (nonnull id)initAsMinHeap;
- (nonnull id)initAsMaxHeap;
- (nonnull id)initMinHeapWithNSNumberArray: (nonnull NSArray *)array;
- (nonnull id)initMaxHeapWithNSNumberArray: (nonnull NSArray *)array;
- (nullable NSNumber *) extract;
- (void) insertValue: (nonnull NSNumber *)value;
- (void) printMe;

@end
