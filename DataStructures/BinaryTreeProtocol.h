//
//  BinaryTreeProtocol.h
//  DataStructures
//
//  Created by Christian Schraga on 6/20/16.
//  Copyright © 2016 Straight Edge Digital. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BinaryTreeProtocol <NSObject>
-(void) insert: (nonnull NSObject <Treeable> *)object;
-(nullable NSObject <Treeable> *) extract;
@end
