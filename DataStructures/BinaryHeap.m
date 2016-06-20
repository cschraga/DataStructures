//
//  Heap.m
//  DataStructures
//
//  Created by Christian Schraga on 6/16/16.
//  Copyright © 2016 Straight Edge Digital. All rights reserved.
//

#import "BinaryHeap.h"
#import "Heapable.h"

@interface BinaryHeap ()

- (void) bubbleDown;
- (void) bubbleUp;

@end

@implementation BinaryHeap

-(id)init {
    self = [super init];
    
    if (self) {
        _minHeap = NO;
    }
    
    return self;
}

-(id)initAsMaxHeap {
    return [self init];
}

-(id)initAsMinHeap {
    self = [self init];
    
    if (self) {
        _minHeap = YES;
    }
    
    return self;
}

-(id)initMinHeapWithNSArray:(NSArray *)array {
    self = [self initAsMinHeap];
    
    for (NSObject *item in array) {
        if ([item conformsToProtocol:@protocol(Heapable)]) {
            NSObject <Treeable> *recastItem = (NSObject <Treeable> *)item;
            [self insert:recastItem];
        }
    }
    
    return self;
}

-(id)initMaxHeapWithNSArray:(NSArray *)array {
    self = [self initAsMaxHeap];
    
    for (NSObject *item in array) {
        if ([item conformsToProtocol:@protocol(Heapable)]) {
            NSObject <Treeable> *recastItem = (NSObject <Treeable> *)item;
            [self insert:recastItem];
        }
    }
    
    return self;
}

#pragma mark -- Binary Tree Protocol Methods

-(void)insert:(NSObject <Treeable> *)item {
    [self setCurrentNodeIndexAsInt:[self treeSize]];
    [self assignPosition:self.getCurrentNodeIndexAsInt toNode:item];
    [self bubbleUp];
}

-(NSObject <Treeable> *) extract {
    NSObject <Treeable> *result = nil;
    NSInteger lastIndex = [self treeSize] - 1;
    
    if (lastIndex >= 0) {
        [self setCurrentNodeIndexAsInt:0];
        result = [self currentNode];
        
        if (lastIndex >= 1) {
            [self swapNodesFromIndex:0 toIndex:lastIndex];
            [self removeBottomNode];
            [self bubbleDown];
        } else {
            [self removeBottomNode];
        }
        
        
    }
    return result;
}


#pragma mark -- Bubble Operations

- (void) bubbleDown {
    
    NSNumber *swapWithMeIndex = nil;
    
    //1) if at end of heap, stop
    if (![self leftChildAtCurrentNode] && ![self rightChildAtCurrentNode]) {
        NSLog(@"Bubble Down Complete");
        
    } else if ([self leftChildAtCurrentNode] && ![self rightChildAtCurrentNode]){
        //2) if no right child, swap with left if its smaller
        
        NSComparisonResult compareResult = [[self currentNode] compareTreeValueToObject:[self leftChildAtCurrentNode]];
        BOOL swap = compareResult == (_minHeap) ? NSOrderedAscending : NSOrderedDescending;
        swapWithMeIndex = (swap) ? [NSNumber numberWithInteger:[self leftChildIndexAtCurrentNode]] : nil;
        
    } else {
        //3) if has both children..
        NSComparisonResult compareResultLeft = [[self currentNode] compareTreeValueToObject:[self leftChildAtCurrentNode]];
        NSComparisonResult compareResultRight = [[self currentNode] compareTreeValueToObject:[self rightChildAtCurrentNode]];
        
        //3a) stop if parent larger than both children
        BOOL stop = (_minHeap) ? (compareResultLeft == NSOrderedAscending &&
                                  compareResultRight == NSOrderedAscending) :
                                 (compareResultLeft == NSOrderedDescending &&
                                  compareResultRight == NSOrderedDescending );
        
        if (stop) {
             NSLog(@"Bubble Down Complete");
        } else {
            
            //3b) else, swap with the bigger child (in max heap)
            NSComparisonResult compareResultChildren = [[self leftChildAtCurrentNode] compareTreeValueToObject:[self rightChildAtCurrentNode]];
            if (_minHeap) {
                
                swapWithMeIndex = (compareResultChildren == NSOrderedAscending) ? [NSNumber numberWithInteger:[self leftChildIndexAtCurrentNode]] : [NSNumber numberWithInteger:[self rightChildIndexAtCurrentNode]];
                
            } else {
                
                swapWithMeIndex = (compareResultChildren == NSOrderedDescending) ? [NSNumber numberWithInteger:[self leftChildIndexAtCurrentNode]] : [NSNumber numberWithInteger:[self rightChildIndexAtCurrentNode]];
            }
            
        }
    }
    
    if (swapWithMeIndex) {
        [self swapNodesFromIndex:[self getCurrentNodeIndexAsInt] toIndex:swapWithMeIndex.integerValue];
        [self setCurrentNodeIndexAsInt:swapWithMeIndex.integerValue];
        [self bubbleDown];
    }
    
}

- (void) bubbleUp {
    
    //if we're at the parent node, stop
    if ([self getCurrentNodeIndexAsInt] == 0) {
        NSLog(@"stop bubbling up ,we're at the top index");
    } else {
        
        //if parent value is correct with respect to current node, stop
        NSComparisonResult compareResult = [[self parentAtCurrentNode] compareTreeValueToObject:[self currentNode]];
        BOOL correct = (_minHeap) ? compareResult == NSOrderedAscending : compareResult == NSOrderedDescending;
        
        
        //else switch parent and child and recurse
        if (!correct) {
            NSInteger parentNodeIndex = [self parentIndexAtCurrentNode];
            [self swapNodesFromIndex:[self getCurrentNodeIndexAsInt] toIndex:parentNodeIndex];
            [self setCurrentNodeIndexAsInt:parentNodeIndex];
            [self bubbleUp];
        }
        
    }
    
    
}




@end
