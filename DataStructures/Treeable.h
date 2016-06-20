//
//  Treeable.h
//  DataStructures
//
//  Created by Christian Schraga on 6/19/16.
//  Copyright © 2016 Straight Edge Digital. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Treeable <NSObject>

-(NSComparisonResult) compareTreeValueToObject: (NSObject <Treeable> *)otherObject;

@end
