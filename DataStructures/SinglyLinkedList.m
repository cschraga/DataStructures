//
//  SinglyLinkedList.m
//  DataStructures
//
//  Created by Christian Schraga on 6/17/16.
//  Copyright © 2016 Straight Edge Digital. All rights reserved.
//

#import "SinglyLinkedList.h"
#import "SinglyListable.h"

@implementation SinglyLinkedList

- (id)init {
    self = [super init];
    if (self) {
        _set = [NSMutableSet set];
    }
    return self;
}

- (void) insertAtBeginning:(NSObject *)object {
    if ([object conformsToProtocol:@protocol(SinglyListable)]) {
        [_set setByAddingObject:object];
        
        if (_firstNode) {
            NSObject <SinglyListable> *newNode = (NSObject <SinglyListable> *)object;
            [newNode assignNextNode:_firstNode];
        }
        
        _firstNode = object;
        
        
    }
}

- (void) insertObject:(NSObject *)object afterNode:(NSObject *)node {
    if ([object conformsToProtocol:@protocol(SinglyListable)]) {
        NSObject *currentUncastNode = _firstNode;
        NSObject *nextNode = [[NSObject alloc] init];
        BOOL foundNode = NO;
        
        //1) try to find the right node
        while (!foundNode && currentUncastNode) {
            NSObject <SinglyListable> *recastNode = (NSObject <SinglyListable> *)currentUncastNode;
            nextNode = [recastNode nextNode];
            foundNode = [object isEqual:currentUncastNode];
            currentUncastNode = (!foundNode) ? nextNode : currentUncastNode;
        }
        
        //2) if found, add it
        if (foundNode) {
            [_set addObject:object];
            
            //3) then change the next items for newobject and current node
            NSObject <SinglyListable>  *recastNewObj = (NSObject <SinglyListable> *)object;
            NSObject <SinglyListable>  *recastOldObj = (NSObject <SinglyListable> *)currentUncastNode;
            [recastNewObj assignNextNode:nextNode];
            [recastOldObj assignNextNode:object];
        }
        
    }
}

- (NSObject *) popFirstNode {
    if (_firstNode) {
        NSObject <SinglyListable> *oldNode = (NSObject <SinglyListable> *) _firstNode;
        [_set removeObject:_firstNode];
        _firstNode = [oldNode nextNode];
        return  oldNode;
    } else {
        return _firstNode;
    }
}

- (void) removeNode:(NSObject *)node {
    
    NSObject *currentUncastNode = _firstNode;
    NSObject *nextNode = [[NSObject alloc] init];
    BOOL foundNode = NO;
    
    //1) try to find the right node
    while (!foundNode && currentUncastNode) {
        NSObject <SinglyListable> *recastNode = (NSObject <SinglyListable> *)currentUncastNode;
        nextNode = [recastNode nextNode];
        foundNode = [node isEqual:nextNode];
        currentUncastNode = (!foundNode) ? nextNode : currentUncastNode;
    }
    
    //2) if found...
    if (foundNode) {
        
        //3)... remember found node's next node
        NSObject <SinglyListable>  *recastFoundObj = (NSObject <SinglyListable> *)nextNode;
        NSObject *rememberNode = [recastFoundObj nextNode];
        
        //4) then remove it
        [_set removeObject:nextNode];
        
        //5)then reassign current items node to #3
        NSObject <SinglyListable>  *recastCurrentObj = (NSObject <SinglyListable> *)currentUncastNode;
        [recastCurrentObj assignNextNode:rememberNode];
        
    }
    
}

+ (SinglyLinkedList *) singlyLinkedList {
    return [self init];
}


@end
