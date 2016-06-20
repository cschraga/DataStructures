//
//  SinglyLinkedList.h
//  DataStructures
//
//  Created by Christian Schraga on 6/17/16.
//  Copyright © 2016 Straight Edge Digital. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SinglyLinkedList : NSObject

@property (nonatomic, nullable, weak)  NSObject *firstNode;
@property (nonatomic, nullable, weak)  NSObject *lastNode;
@property (nonatomic, assign) BOOL circular;

- (nullable id)initWithCircular: (BOOL)circular;
- (nullable NSObject *) popFirstNode;
- (void) insertAtBeginning: (nonnull NSObject *)object;
- (void) insertObject: (nonnull NSObject *)object afterNode:(nonnull NSObject *)node;
- (void) removeNode: (nonnull NSObject *)node;
+ (nonnull SinglyLinkedList *) singlyLinkedListWithCircular: (BOOL)circular;

@end
