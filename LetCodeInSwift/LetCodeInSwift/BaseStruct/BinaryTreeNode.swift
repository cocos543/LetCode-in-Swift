//
//  BinaryTreeNode.swift
//  LetCodeInSwift
//
//  Created by Cocos on 2018/3/9.
//  Copyright © 2018年 Cocos. All rights reserved.
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
