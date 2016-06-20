//
//  Heap.h
//  DataStructures
//
//  Created by Christian Schraga on 6/16/16.
//  Copyright © 2016 Straight Edge Digital. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BinaryTree.h"
#import "BinaryTreeProtocol.h"

@interface BinaryHeap : BinaryTree <BinaryTreeProtocol>

@property (nonatomic, assign) BOOL minHeap;

- (nonnull id)initAsMinHeap;
- (nonnull id)initAsMaxHeap;
- (nonnull id)initMinHeapWithNSArray: (nonnull NSArray *)array;
- (nonnull id)initMaxHeapWithNSArray: (nonnull NSArray *)array;

@end
