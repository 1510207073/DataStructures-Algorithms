//
//  main.m
//  排序
//
//  Created by cy on 2018/4/16.
//  Copyright © 2018年 cy. All rights reserved.
//

#import <Foundation/Foundation.h>

// 函数指针
//int arrayLength(int array[]){
//    return (sizeof(array)/sizeof(array[0]));
//}

/*
 * 需要传入数组长度，因为不能在定义的函数中计算长度，array[]会退化为指针
 */
void printFunc(int array[],int length){
    
    for (int i = 0; i < length; i++) {
        printf("%d  ",array[i]);
    }
    printf("\n");
}

/*
 * 交换两个数的值(大的在后面)
 * 参数是地址，即指针
 * 注意：基础数据类型也可以用* ？以后要好好理解一下
 */
void swap(int *a,int *b){
    int temp;
    temp = *a;
    *a = *b;
    *b = temp;
}

/*
 * 冒泡排序(从小到大排序)
 * 理解：第一次循环找到最大的数，移到最后一位，第二次循环找到第二大的数移动倒数第二位
 * 注意： i = 0;i < 9 是循环9次，i = 0;i <= 9 是循环10次
         数组作为参数不能使用 int array[],要使用 int * array;
 */
void popSort(int array[],int length){
    
//    int temp;
    // 外层循环需要循环9次，只要把9个移动完了，剩下的一个一定是最小的了，所以不需要移动
    for (int j = 0; j < length - 1; j++) {
        
        // 交换两个相邻位置的数，第一次交换9次，第二次交换8次，依次递减，最后一次交换一次
        for (int i = 0; i < length - j; i++) {
//            if (array[i] > array[i+1]) {
//                temp = array[i];
//                array[i] = array[i+1];
//                array[i+1] = temp;
//            }
            swap(&array[i], &array[j]);
        }
    }
}

/*
 * 快速排序
 * 理解：冒泡排序的改进，二分思想，随机选择一个基准数，然后让该基准数归位
        1、先从数列中取出一个数作为基准数，例如，选择第0个作为基准，第一个作为begin,length-1作为end
        2、i = begin,j = end,从小到大排列，下面进行分区
           进入循环，循环条件i < j
              如果i>基准，就交换位置，然后让j++
              如果i小于基准，则i++，继续看还有没有大于基准数的
        3、让基准数归位（如果一次调整完后，都比基准数大就不需要调整，但是只要有一个还比基准数小，就需要进行归位调整）
        4、将分区的数组进行递归操作
 
 */
void quickSort(int array[],int length,int begin,int end){
    
    int i,j;
    
    // 递归结束条件
    if (begin < end) {
        
        i = begin + 1;
        j = end;
        
        while (i < j) {
            if (array[i] > array[begin]) {
                swap(&array[i], &array[j]);
                j--;
            }else{
                i++;
            }
        }
        
        if (array[i] >= array[begin]) {
            i--;
        }
        swap(&array[begin], &array[i]);
        
        quickSort(array, length, begin, i);
        quickSort(array, length, j, end);
    }
}

int main(int argc, const char * argv[]) {

    int str[10] = {10,49,78,37,6,5,4,3,92,1};
    int length = sizeof(str)/sizeof(str[0]);
    
    printFunc(str, length);
    
//    printf("\n------冒泡排序------\n");
//    popSort(str, length);
    
     printf("\n------快速排序------\n");
    quickSort(str, length, 0, length-1);
    
    printFunc(str, length);
    
    return 0;
}
