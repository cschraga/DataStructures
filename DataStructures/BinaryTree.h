//
//  BinaryTree.h
//  DataStructures
//
//  Created by Christian Schraga on 6/19/16.
//  Copyright © 2016 Straight Edge Digital. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Treeable.h"

@interface BinaryTree : NSObject

-(NSInteger) getCurrentNodeIndexAsInt;
-(void) setCurrentNodeIndexAsInt: (NSInteger)index;
-(void) assignPosition: (NSInteger)position toNode:(nonnull NSObject <Treeable> *)node;
-(NSInteger) treeSize;
-(nullable NSObject <Treeable> *)currentNode;
-(nullable NSObject <Treeable> *)leftChildAtCurrentNode;
-(nullable NSObject <Treeable> *)rightChildAtCurrentNode;
-(nullable NSObject <Treeable> *)parentAtCurrentNode;
-(void) removeBottomNode;
-(NSInteger)leftChildIndexAtCurrentNode;
-(NSInteger)rightChildIndexAtCurrentNode;
-(NSInteger)parentIndexAtCurrentNode;
- (void) swapNodesFromIndex: (NSInteger)fromIndex toIndex: (NSInteger)toIndex;
+(nonnull BinaryTree *) tree;

@end
