//
//  Heap.m
//  DataStructures
//
//  Created by Christian Schraga on 6/16/16.
//  Copyright © 2016 Straight Edge Digital. All rights reserved.
//

#import "Heap.h"
#import "Heapable.h"

@interface Heap ()

- (nullable NSNumber *) leftChildAtNode:  (NSInteger)node;
- (nullable NSNumber *) rightChildAtNode: (NSInteger)node;
- (nullable NSNumber *) parentAtNode:     (NSInteger)node;
- (void) swapNode: (NSInteger)node1 withNode: (NSInteger)node2;
- (void) bubbleDown;
- (void) bubbleUpAtNode: (NSInteger)node;
- (BOOL) isNodesParentCorrect:    (NSInteger)node;

@end

@implementation Heap

-(id)init {
    self = [super init];
    
    if (self) {
        _items = [[NSMutableArray alloc] init];
        _minHeap = NO;
    }
    
    return self;
}

-(id)initAsMaxHeap {
    self = [super init];
    
    if (self) {
        _items = [[NSMutableArray alloc] init];
        _minHeap = NO;
    }
    
    return self;
}

-(id)initAsMinHeap {
    self = [super init];
    
    if (self) {
        _items = [[NSMutableArray alloc] init];
        _minHeap = YES;
    }
    
    return self;
}

-(id)initMinHeapWithNSArray:(NSArray *)array {
    self = [self initAsMinHeap];
    
    for (NSObject *item in array) {
        if ([item conformsToProtocol:@protocol(Heapable)]) {
            [self insert:item];
        }
    }
    
    return self;
}

-(id)initMaxHeapWithNSArray:(NSArray *)array {
    self = [self initAsMaxHeap];
    
    for (NSObject *item in array) {
        if ([item conformsToProtocol:@protocol(Heapable)]) {
            [self insert:item];
        }
    }
    
    return self;
}

#pragma mark -- Public Methods

-(void)insert:(NSObject *)item {
    if ([item conformsToProtocol:@protocol(Heapable)]) {
        [_items addObject:item];
        NSInteger index = _items.count - 1;
        [self bubbleUpAtNode:index];
    }
}


-(NSNumber *)extract {
    NSNumber *result = [NSNumber numberWithInt:0];
    if (_items.count > 0) {
        result = _items[0];
        if (_items.count > 1) {
            NSInteger lastIndex = _items.count - 1;
            [self swapNode:0 withNode:lastIndex];
            [_items removeObjectAtIndex:lastIndex];
            [self bubbleDown];
        }
    }
    return result;
}

#pragma mark -- Bubble Operations

- (void) bubbleDown {
    
    BOOL keepBubbling = YES;  //switch to NO when node is correctly placed
    NSInteger currentNode = 0; //keeps track of which node we're working with
    
    while (keepBubbling) {
        
        NSInteger leftIndex  = [[self leftChildAtNode:currentNode]  integerValue];
        NSInteger rightIndex = [[self rightChildAtNode:currentNode] integerValue];
        
        //1) if at end of heap, stop
        if (!leftIndex && !rightIndex) {
            
            keepBubbling = NO;
            
        } else {
            
            //find largest of children
            BOOL goLeft = YES;
            if (rightIndex) {
                goLeft = [_items[leftIndex] compare:_items[rightIndex]] == NSOrderedDescending;
            }
            
            if (goLeft) {
                
                NSComparisonResult comparisonResult = [_items[currentNode] compare:_items[leftIndex]];
                keepBubbling = (_minHeap) ? (comparisonResult == NSOrderedDescending) : (comparisonResult == NSOrderedAscending);
                if (keepBubbling) {
                    //left node is wrong, swap and then repeat cycle
                    [self swapNode:currentNode withNode: leftIndex];
                    currentNode = leftIndex;
                }
                
            } else {
                
                NSComparisonResult comparisonResult = [_items[currentNode] compare:_items[rightIndex]];
                keepBubbling = (_minHeap) ? (comparisonResult == NSOrderedDescending) : (comparisonResult == NSOrderedAscending);
                
                if (keepBubbling) {
                    
                    //right node is wrong, swap and repeat cycle
                    [self swapNode:currentNode withNode: rightIndex];
                    currentNode = rightIndex;
                }
                
            }
            
        }
        
    }
    
}

- (void) bubbleUpAtNode:(NSInteger)node {
    
    BOOL keepLooping = YES;  //switch to NO when node is correctly placed
    NSInteger currentNode = node; //keeps track of which node we're working with
    
    while (keepLooping) {
        keepLooping = ![self isNodesParentCorrect:currentNode];  //keep looping if parent is wrong
        if (keepLooping) {
            NSInteger parentNode = [[self parentAtNode:currentNode] integerValue];
            [self swapNode:currentNode withNode: parentNode];
            currentNode = parentNode;
        }
    }
    
    
}

#pragma mark -- Node Evaluators

- (BOOL) isNodesParentCorrect:(NSInteger)node {
    BOOL result = NO;
    NSInteger parentIndex = [[self parentAtNode:node] integerValue];
    
    if (node == 0) {
        result = YES;
    } else {
        
        NSComparisonResult comparisonResult = [_items[node] compare:_items[parentIndex]];
        result = (_minHeap) ? (comparisonResult >= 0) : (comparisonResult <= 0);
        
    }
    
    return result;
}

- (NSNumber *) leftChildAtNode:(NSInteger)node {
    NSNumber *result = [[NSNumber alloc] init];
    NSInteger sum = node * 2 + 1;
    
    if (sum < (_items.count)) {
        result = [NSNumber numberWithInteger:sum];
    }
    
    return result;
}


- (NSNumber *) rightChildAtNode:(NSInteger)node {
    NSNumber *result = [[NSNumber alloc] init];
    NSInteger sum = node * 2 + 2;
    
    if (sum < (_items.count)) {
        result = [NSNumber numberWithInteger:sum];
    }
    
    return result;
}


- (NSNumber *) parentAtNode:(NSInteger)node {
    NSNumber *result = [[NSNumber alloc] init];
    
    if (node > 0) {
        NSInteger sum = (node - 1) / 2;
        result = [NSNumber numberWithInteger:sum];
    }
    
    return result;
}

- (void) swapNode:(NSInteger)node1 withNode:(NSInteger)node2 {
    if (node1 < _items.count && node2 < _items.count) {
        NSNumber *val1 = _items[node1];
        NSNumber *val2 = _items[node2];
        _items[node2] = val1;
        _items[node1] = val2;
    }
}


@end
