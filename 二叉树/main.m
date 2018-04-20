//
//  main.c
//  二叉树的链表实现和遍历
//
//  Created by cy on 2017/10/14.
//  Copyright © 2017年 cy. All rights reserved.
//

/*
 1
 2    3
 4  5  6  7
 
 先序（中左右）：1 2 4 5 3 6 7   124##5##36##7##
 中序（左中右）：4 2 5 1 6 3 7
 后序（左右中）：4 5 2 6 7 3 1
 技巧：先整体看，后局部看
 
 遍历和创建都是先拿到树，即拿到树的根节点，然后再按照算法进行
 */

#include <stdio.h>
#include <stdlib.h>

typedef char ElemType;

/*二叉树节点数据结构*/
typedef struct TreeNode{
    ElemType data;
    struct TreeNode *leftChild;
    struct TreeNode *rightChild;
}TreeNode,Tree;

/*
 scanf原理
 1、用户输入的字符，会以ASCII码形式存储在键盘缓冲区；
 2、每调用一次scanf函数，就从键盘缓冲区读走一个字符，相当于清除缓冲区；
 3、若用户一次输入n个字符，则前n次调用scanf函数都不需要用户再次输入，直到把缓冲区的数据全部读取(清除)干净
 4、调用scanf()函数时，用户最后输入的回车也会储存在键盘缓冲区；(见程序示例2)
 */
void testScanf(){
    
    ElemType ch1;
    ElemType ch2;
    ElemType ch3;
    scanf("%c",&ch1);
    scanf("%c",&ch2);
    scanf("%c",&ch3);
    printf("%c",ch1);
    printf("%c",ch2);
    printf("%c",ch3);
    
    //    ElemType ch;
    //    scanf("%c", &ch);
    //    printf("%c \n",ch);
    //
    //    if(ch != '#'){
    //        testScanf();
    //    }else{
    //        return;
    //    }
}

#prgram mark 先序遍历创建二叉树（递归实现）
/*
 使用先序遍历创建二叉树（递归实现）
 */
Tree* createBinaryTreeByPreOrder(){
    
    ElemType ch;
    TreeNode *newNode;
    
    scanf("%ch", &ch);  //⚠️⚠️这样调用scanf函数时,树的节点一次全部输入,如果要一次输入一个的话,那么在格式化字符串%ch前面加上空格即可
    if(ch != '#'){
        newNode = (TreeNode *)malloc(sizeof(TreeNode));
        if(newNode == NULL){
            printf("内存空间不足,程序退出\n");
            exit(-1);
        }
        newNode->data = ch;
        printf("请输入%c的左子\n",newNode->data);
        newNode->leftChild = createBinaryTreeByPreOrder();
        printf("请输入%c的右子\n",newNode->data);
        newNode->rightChild = createBinaryTreeByPreOrder();
    }else{
        newNode = NULL;
    }
    return newNode;
}

#prgram mark 中序遍历创建二叉树（递归实现）
/*
 使用中序遍历创建二叉树（递归实现）
 */
Tree* createBinaryTreeByInOrder(){
    
    ElemType ch;
    TreeNode *newNode;
    
    scanf(" %ch", &ch);  //这样调用scanf函数时,树的节点一次全部输入,如果要一次输入一个的话,那么在格式化字符串%ch前面加上空格即可
    if(ch != '#'){
        newNode = (TreeNode *)malloc(sizeof(TreeNode));
        if(newNode == NULL){
            printf("内存空间不足,程序退出\n");
            exit(-1);
        }
        printf("请输入%c的左子\n",newNode->data);
        newNode->leftChild = createBinaryTreeByInOrder();
        newNode->data = ch;
        printf("请输入%c的右子\n",newNode->data);
        newNode->rightChild = createBinaryTreeByInOrder();
    }else{
        newNode = NULL;
    }
    return newNode;
}

#prgram mark  后序遍历创建二叉树（递归实现）
/*
 使用后序遍历创建二叉树（递归实现）
 */
Tree* createBinaryTreeByPostOrder(){
    
    ElemType ch;
    TreeNode *newNode;
    
    scanf(" %ch", &ch);  //这样调用scanf函数时,树的节点一次全部输入,如果要一次输入一个的话,那么在格式化字符串%ch前面加上空格即可
    if(ch != '#'){
        newNode = (TreeNode *)malloc(sizeof(TreeNode));
        if(newNode == NULL){
            printf("内存空间不足,程序退出\n");
            exit(-1);
        }
        printf("请输入%c的左子\n",newNode->data);
        newNode->leftChild = createBinaryTreeByPostOrder();
        printf("请输入%c的右子\n",newNode->data);
        newNode->rightChild = createBinaryTreeByPostOrder();
        newNode->data = ch;
    }else{
        newNode = NULL;
    }
    return newNode;
}

#prgram mark  先序遍历（递归实现）
/*
 先序遍历（递归实现）
 */
void traverseBinaryTreeByPreOrder(Tree *T){
    
    // 如果为空，就不再调用函数（递归），转到上层函数
    if(T!=NULL)
    {
        printf("%c ",T->data);
        traverseBinaryTreeByPreOrder(T->leftChild);  // 找下一集团
        traverseBinaryTreeByPreOrder(T->rightChild);
    }
}

#prgram mark 中序遍历（递归实现）
/*
 中序遍历（递归实现）
 Tree的地址就是根节点
 */
void traverseBinaryTreeByInOrder(Tree *T){
    
    if(T!=NULL)
    {
        traverseBinaryTreeByInOrder(T->leftChild);
        printf("%c ",T->data); // 移动到该位置，然后打印
        // -------------------------------------------------------
        traverseBinaryTreeByInOrder(T->rightChild);
    }
}

#prgram mark 后序遍历（递归实现）
/*
 后序遍历（递归实现）
 */
void traverseBinaryTreeByPostOrder(Tree *T){
    
    if(T!=NULL)
    {
        traverseBinaryTreeByPostOrder(T->leftChild);
        traverseBinaryTreeByPostOrder(T->rightChild);
        printf("%c ",T->data);
    }
}

#prgram mark 二叉树的左右子树交换代码实现

# 平衡二叉树判断、子树判断。

int main(int argc, const char * argv[]) {
    
    //    testScanf();
    
    //    ABC##D##EF##G##
    Tree *tree;
    //    tree = createBinaryTreeByPreOrder();
    //    tree = createBinaryTreeByInOrder();
    tree = createBinaryTreeByPostOrder();
    
    //    traverseBinaryTreeByPreOrder(tree);
    //    traverseBinaryTreeByInOrder(tree);
    traverseBinaryTreeByPostOrder(tree);
    
    return 0;
}

