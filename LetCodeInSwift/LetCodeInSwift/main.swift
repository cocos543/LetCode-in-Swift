//
//  main.swift
//  LetCodeInSwift
//
//  Created by Cocos on 2017/7/17.
//  Copyright © 2017年 Cocos. All rights reserved.
//

import Foundation

//Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        if nums.count == 0 {
            return nil
        }
        let maxNums = nums.max()
        let index = nums.index(of: maxNums!)
        let rootNode = TreeNode(maxNums!)
        rootNode.left = constructMaximumBinaryTree(Array(nums[0..<index!]))
        rootNode.right = constructMaximumBinaryTree(Array(nums[index!+1 ..< nums.count]))
        return rootNode
    }
}

let s = Solution()
let node = s.constructMaximumBinaryTree([3,2,1,6,0,5])
