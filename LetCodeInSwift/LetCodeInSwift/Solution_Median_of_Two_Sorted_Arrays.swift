//
//  Solution_Median_of_Two_Sorted_Arrays.swift
//  LetCodeInSwift
//
//  Created by Cocos on 2017/8/1.
//  Copyright © 2017年 Cocos. All rights reserved.
//

import Foundation



/*
 Given nums = [2, 7, 11, 15], target = 9,
 
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 */


class Solution_Median_of_Two_Sorted_Arrays {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let n = nums1.count, m = nums2.count
        let count = n > m ? n : m
        var medianLoc = 0
        let isEven = (n + m) % 2 == 0
        var np = 0, mp = 0
        
        if isEven {
            medianLoc = (n + m) / 2 - 1
        }else {
            medianLoc = (n + m) / 2
        }
        
        //处理一边无数据的特殊情况
        if n == 0 {
            if isEven {
                return Double(nums2[medianLoc] + nums2[medianLoc + 1]) / 2
            }else {
                return Double(nums2[medianLoc])
            }
        }else if m == 0 {
            if isEven {
                return Double(nums1[medianLoc] + nums1[medianLoc + 1]) / 2
            }else {
                return Double(nums1[medianLoc])
            }
        }
        
        for i in 0...count {
            if i < n || i < m {
                if i != medianLoc {
                    if nums1[np] <= nums2[mp] && np < n - 1 || mp == m - 1 {
                        np = np + 1
                    }else {
                        mp = mp + 1
                    }
                }else {
                    if isEven == true {
                        // 偶数个
                        if nums1[np] <= nums2[mp] {
                            if np == n - 1 {
                                //np已经到末尾,只能移动mp,所以mp - 1元素可能比np元素大,但是被是被强制移动了.
                                if mp > 0 && nums2[mp - 1] > nums1[np] {
                                    //[1,2] [3,4,5,6]
                                    return Double(nums2[mp - 1] + nums2[mp]) / 2
                                }else {
                                    return Double(nums1[np] + nums2[mp]) / 2
                                }
                            }else {
                                //如果np, np+1元素都小于mp元素
                                if nums1[np + 1] <= nums2[mp] {
                                    return Double(nums1[np] + nums1[np + 1]) / 2
                                }else {
                                    return Double(nums1[np] + nums2[mp]) / 2
                                }
                            }
                        }else {
                            if mp == m - 1 {
                                //mp已经到末尾
                                if np > 0 && nums1[np - 1] > nums2[mp] {
                                    return Double(nums1[np - 1] + nums1[np]) / 2
                                }else {
                                    return Double(nums1[np] + nums2[mp]) / 2
                                }
                            }else {
                                //如果mp, mp+1元素都小于np元素
                                if nums2[mp + 1] <= nums1[np] {
                                    return Double(nums2[mp] + nums2[mp + 1]) / 2
                                }else {
                                    return Double(nums1[np] + nums2[mp]) / 2
                                }
                            }
                        }
                    }else {
                        if nums1[np] <= nums2[mp] {
                            if np == n - 1 {
                                if mp > 0 {
                                    if nums2[mp - 1] > nums1[np] {
                                        //[1] [2,3,4,5]; [1,2] [3,4,5];
                                        return Double(nums2[mp - 1])
                                    }else {
                                        //[1, 3] [2, 4, 5]; [3] [1,2,4,5]
                                        return Double(nums1[np])
                                    }
                                }else {
                                    //[1, 2, 3] [4,5];
                                    return Double(nums1[np])
                                }
                            }else {
                                if mp > 0 {
                                    //np不是最后一个,mp大于0,说明[mp-1]肯定比[np]小 (因为如果[mp-1]比[np]大,则np应该继续移动而不是移动mp)
                                    //[1,3,4] [2,5];
                                    return Double(nums1[np])
                                }else {
                                    //当mp=0,[np]<[mp],np又不是最后一个,说明[mp]比np之前元素都要大,所以中位数肯定是np
                                    //[1, 2, 3, 4, 7] [5, 6];
                                    return Double(nums1[np])
                                }
                            }
                        }else {
                            //[np] > [mp]
                            if mp == m - 1 {
                                if np > 0 {
                                    if nums1[np - 1] > nums2[mp] {
                                        //当[np]>[mp], mp是最后一个, [np-1]>[mp],则表示原本需要移动mp,但是mp是最后一个,所以只能强制移动np
                                        //这种情况说明中位数在np-1,np之中,其实也就是np-1
                                        //[3, 4, 5] [1, 2];
                                        return Double(nums1[np-1])
                                    }else {
                                        //当[np]>[mp], mp是最后一个, [np-1]<[mp],说明np是主动移位而非强制移位,中位数就在np和mp之中
                                        //[1,4,5] [2,3]; [1,3,5] [2,4]
                                        return nums1[np] < nums2[mp] ? Double(nums1[np]) : Double(nums2[mp])
                                    }
                                }else {
                                    //当[np]>[mp], mp是最后一个, np=0表示一直没有移动过,说明mp全部元素都小于mp
                                    //这种情况下,说明左边元素少,右边元素多,中位数在[mp]上
                                    //[4,5] [1,2,3]
                                    return Double(nums2[mp])
                                }
                            }else {
                                if np > 0 {
                                    //当[np]>[mp], mp不是最后一个,np>0表示np主动移动过, 中位数一定在mp上
                                    //[1,2,5] [3,4];
                                    return Double(nums2[mp])
                                }else {
                                    //当[np]>[mp], mp不是最后一个, np=0表示np一直没有移动过, 中位数一定在右边mp上
                                    //[5] [1,2,3,4]; [4] [1,2,3,5]; [5,7] [1,2,3,4,6]
                                    return Double(nums2[mp])
                                }
                            }
                        }
                    }
                }
            }
        }
        return 0
    }
}
