/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

public extension TreeNode {
    func inOrder(_ visit: (Int) -> Void) {
        left?.inOrder(visit)    // go left
        visit(val)              // visit current
        right?.inOrder(visit)   // go right
    }
}


class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        var last: Int? = nil
        var isValid = true
        root?.inOrder { val in
            if let p = last, val <= p { isValid = false }
            last = val
        }
        return isValid
    }
}