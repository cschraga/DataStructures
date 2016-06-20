//
//  SinglyListable.h
//  DataStructures
//
//  Created by Christian Schraga on 6/17/16.
//  Copyright © 2016 Straight Edge Digital. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SinglyListable <NSObject>
-(nullable NSObject *)nextNode;
-(void)assignNextNode: (nonnull NSObject *)object;
@end
