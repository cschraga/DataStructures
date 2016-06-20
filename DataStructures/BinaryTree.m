//
//  BinaryTree.m
//  DataStructures
//
//  Created by Christian Schraga on 6/19/16.
//  Copyright © 2016 Straight Edge Digital. All rights reserved.
//

#import "BinaryTree.h"
#import "Treeable.h"

@interface BinaryTree ()

@property (nonatomic, strong, nonnull) NSMutableArray *positionArray;
@property (nonatomic, weak, nullable)  NSNumber *currentNodeIndex;

-(nullable NSObject <Treeable> *)rootNode;
-(nullable NSObject <Treeable> *)nodeAtPosition: (NSInteger)position;

@end

@implementation BinaryTree

#pragma initialization

- (instancetype)init {
    self = [super init];
    if (self) {
        _positionArray = [[NSMutableArray alloc] init];
    }
    return self;
}

#pragma public getters and setters for private variables

-(NSInteger) getCurrentNodeIndexAsInt {
    return _currentNodeIndex.integerValue;
}

-(void) setCurrentNodeIndexAsInt:(NSInteger)index {
    _currentNodeIndex = [NSNumber numberWithInteger:index];
}

-(void) assignPosition:(NSInteger)position toNode:(NSObject<Treeable> *)node {
    [_positionArray insertObject:node atIndex:position];
}

-(NSInteger)treeSize {
    return _positionArray.count;
}

-(NSObject <Treeable> *) currentNode {
    return [self nodeAtPosition:_currentNodeIndex.integerValue];
}

-(void)removeBottomNode {
    NSInteger last = _positionArray.count - 1;
    [_positionArray removeObjectAtIndex:last];
}

#pragma mark internal methods for retrieving nodes

-(NSObject <Treeable> *) nodeAtPosition:(NSInteger)position {
    return _positionArray[position];
}

-(NSObject <Treeable> *) rootNode; {
    return [self nodeAtPosition:0];
}

-(NSObject <Treeable> *) leftChildAtCurrentNode {
    NSInteger index = [self leftChildIndexAtCurrentNode];
    if (index < _positionArray.count) {
        return [self nodeAtPosition:index];
    } else {
        return nil;
    }
}

- (NSInteger) leftChildIndexAtCurrentNode {
    return  2 * _currentNodeIndex.integerValue + 1;
}

-(NSObject <Treeable> *) rightChildAtCurrentNode {
    NSInteger index = [self rightChildIndexAtCurrentNode];
    if (index < _positionArray.count) {
        return [self nodeAtPosition:index];
    } else {
        return nil;
    }
}

- (NSInteger) rightChildIndexAtCurrentNode {
    return  2 * _currentNodeIndex.integerValue + 2;
}

-(NSObject <Treeable> *) parentAtCurrentNode {
    if (_currentNodeIndex.integerValue > 0) {
        NSInteger index = [self parentIndexAtCurrentNode];
        return [self nodeAtPosition:index];
    } else {
        return nil;
    }
}

- (NSInteger) parentIndexAtCurrentNode {
    return  (_currentNodeIndex.integerValue - 1) / 2;
}


- (void) swapNodesFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    if (fromIndex < _positionArray.count && toIndex < _positionArray.count) {
        NSObject <Treeable> *val1 = [self nodeAtPosition:fromIndex];
        NSObject <Treeable> *val2 = [self nodeAtPosition:toIndex];
        [_positionArray replaceObjectAtIndex:toIndex withObject:val1];
        [_positionArray replaceObjectAtIndex:fromIndex withObject:val2];
    }
}


#pragma mark factory methods

+ (BinaryTree *) tree; {
    return [[self alloc] init];
}


@end
