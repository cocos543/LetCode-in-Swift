//
//  Solution_Maximum Binary Tree.swift
//  LetCodeInSwift
//
//  Created by Cocos on 2018/3/7.
//  Copyright © 2018年 Cocos. All rights reserved.
//

import Foundation

class Solution_Maximum_Binary_Tree {
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        //这里需要条件来判断递归终止
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

//private let s = Solution()
//private let node = s.constructMaximumBinaryTree([3,2,1,6,0,5])

