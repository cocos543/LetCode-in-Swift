//
//  main.swift
//  LetCodeInSwift
//
//  Created by Cocos on 2017/7/17.
//  Copyright © 2017年 Cocos. All rights reserved.
//

import Foundation

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    // 这道题采用递归算法解决.看起来应该是中等难度的题目,不知道为什么标记成简单题.
    func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        //注意递归的结束条件
        if t1 == nil && t2 == nil {
            return nil
        }
        //创建一个跟踪节点newNode, 记录t1,t2树每一个节点merge之后的节点数值
        //之后newNode的左右树,继续重复merge
        let newNode: TreeNode
        if let v1 = t1?.val, let v2 = t2?.val {
            newNode = TreeNode(v1 + v2)
            newNode.left = mergeTrees(t1?.left, t2?.left)
            newNode.right = mergeTrees(t1?.right, t2?.right)
        }else if let v1 = t1?.val {
            newNode = TreeNode(v1)
            newNode.val = v1
            newNode.left = mergeTrees(t1?.left, nil)
            newNode.right = mergeTrees(t1?.right, nil)
        }else {
            let v2 = t2?.val
            newNode = TreeNode(v2!)
            newNode.left = mergeTrees(nil, t2?.left)
            newNode.right = mergeTrees(nil, t2?.right)
        }
        
        return newNode
    }
}

private func makeT1() -> TreeNode {
    // Tree1
    let t1 = TreeNode(1)
    let n0 = t1
    let n1 = TreeNode(3)
    let n2 = TreeNode(2)
    let n3 = TreeNode(5)
    n0.left = n1
    n0.right = n2
    n1.left = n3
    
    return t1
}

private func makeT2() -> TreeNode {
    let t2 = TreeNode(2)
    let n0 = t2
    let n1 = TreeNode(1)
    let n2 = TreeNode(3)
    let n3 = TreeNode(4)
    let n4 = TreeNode(7)
    n0.left = n1
    n0.right = n2
    n1.right = n3
    n2.right = n4
    return t2
}

let t1 = makeT1()
let t2 = makeT2()
let s = Solution()
let t = s.mergeTrees(t1, t2)
print(t)















