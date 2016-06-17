//
//  Valuable.h
//  DataStructures
//
//  Created by Christian Schraga on 6/17/16.
//  Copyright © 2016 Straight Edge Digital. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Heapable <NSObject>
- (nonnull NSNumber *) priorityValue;
- (NSComparisonResult) compare: (nonnull NSObject *)otherObject;
@end
