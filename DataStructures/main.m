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
#import "HeapableCar.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        HeapableCar *car1 = [HeapableCar carWithMake:@"Honda" andModel:@"Accord" andPrice:@30000];
        HeapableCar *car2 = [HeapableCar carWithMake:@"Honda" andModel:@"Civic" andPrice:@38000];
        HeapableCar *car3 = [HeapableCar carWithMake:@"Honda" andModel:@"Minivan" andPrice:@27000];
        HeapableCar *car4 = [HeapableCar carWithMake:@"Ferarri" andModel:@"Testarossa" andPrice:@122000];
        HeapableCar *car5 = [HeapableCar carWithMake:@"Toyota" andModel:@"Camry" andPrice:@21500];
        HeapableCar *car6 = [HeapableCar carWithMake:@"Lexus" andModel:@"L300" andPrice:@71700];
        HeapableCar *car7 = [HeapableCar carWithMake:@"Chevy" andModel:@"Impala" andPrice:@8800];
        HeapableCar *car8 = [HeapableCar carWithMake:@"Lamborghini" andModel:@"Diablo" andPrice:@192000];
        HeapableCar *car9 = [HeapableCar carWithMake:@"Ford" andModel:@"F100" andPrice:@42100];
        HeapableCar *car10 = [HeapableCar carWithMake:@"Ford" andModel:@"Car" andPrice:@16060];
        
        Heap *heap = [[Heap alloc] init];
        [heap insert:car1];
        [heap insert:car2];
        [heap insert:car3];
        [heap insert:car4];
        [heap insert:car5];
        [heap insert:car6];
        [heap insert:car7];
        [heap insert:car8];
        [heap insert:car9];
        [heap insert:car10];
        
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
