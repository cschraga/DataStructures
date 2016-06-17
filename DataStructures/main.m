//
//  main.m
//  DataStructures
//
//  Created by Christian Schraga on 6/16/16.
//  Copyright © 2016 Straight Edge Digital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Heap.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        NSArray *intArray = @[@8, @54, @118, @17, @8, @67, @14, @42, @49, @33, @3, @16];
        Heap *testHeap = [[Heap alloc] initMaxHeapWithNSNumberArray:intArray];
        [testHeap printMe];
        NSNumber *extracted = [testHeap extract];
        NSLog(@"I just extracted %@", extracted);
        [testHeap printMe];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
