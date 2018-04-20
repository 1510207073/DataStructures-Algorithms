//
//  main.c
//  斐波拉切数列
//
//  Created by cy on 2018/4/16.
//  Copyright © 2018年 cy. All rights reserved.
//

#include <stdio.h>

/**
 F(n) = F(n-1) + F(n-2)
 0，1，1，2，3，5，8...
 0  1  3  4  5  6  7 ...从0开始数
 
 输入n，返回对应位置的值
 递归实现
 */

int function(int x){
    
    // 就考虑两个特殊条件，小于0的时候直接返回，等于0或者1的时候直接返回x.
    if (x < 0) {
        return 0;
    }
    
    if (x == 0 ||x == 1) {
        return x;
    }
    return function(x-1)+function(x-2);
}


/**
 循环实现
 */

int function1(int x){
    
    if (x<0) {
        return 0;
    }
    
    if (x == 0|| x == 1) {
        return 1;
    }
    
    int first = 0;
    int second = 1;
    int third = 0;
    
    // i=0;i<x; x-0=x,是x次循环   i=0;i<=x;  x-0+1=x+1,是x+1次循环；
    for (int i=2; i<=x; i++) {
        third = first + second;
        first = second; // 更新 first和third
        second = third;
    }
    
    return third;
}

int main(int argc, const char * argv[]) {
    
//    printf("%d\n",function(1));
    printf("%d\n",function1(2));
    
    return 0;
}


