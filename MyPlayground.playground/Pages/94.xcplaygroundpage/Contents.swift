/**
94. Binary Tree Inorder Traversal
Medium
Given a binary tree, return the inorder traversal of its nodes' values.

Example:

Input: [1,null,2,3]
   1
    \
     2
    /
   3

Output: [1,3,2]
Follow up: Recursive solution is trivial, could you do it iteratively?
*/


/// Definition for a binary tree node.
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
    /// Recursive way
//    func inorderTraversal(_ root: TreeNode?) -> [Int] {
//        var result = [Int]()
//        guard let root = root else {
//            return result
//        }
//        result.append(contentsOf: self.inorderTraversal(root.left))
//        result.append(root.val)
//        result.append(contentsOf: self.inorderTraversal(root.right))
//        return result;
//    }
    
    static var count: Int = 0
    /// Iterative way
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int](), stack = [TreeNode](), node = root
        
        while node != nil || !stack.isEmpty {
            Solution.count += 1
            if node != nil {
                stack.append(node!)
                node = node?.left
            } else {
                let preNode = stack.removeLast()
                result.append(preNode.val)
                node = preNode.right
            }
        }
        print("total iterate times \(Solution.count)")
        return result
    }
    
    
    func inorderMorrisTraversal(TreeNode *root) {
        TreeNode *cur = root, *prev = NULL;
        while (cur != NULL)
        {
            if (cur->left == NULL)          // 1.
            {
                printf("%d ", cur->val);
                cur = cur->right;
            }
            else
            {
                // find predecessor
                prev = cur->left;
                while (prev->right != NULL && prev->right != cur)
                prev = prev->right;
                
                if (prev->right == NULL)   // 2.a)
                {
                    prev->right = cur;
                    cur = cur->left;
                }
                else                       // 2.b)
                {
                    prev->right = NULL;
                    printf("%d ", cur->val);
                    cur = cur->right;
                }
            }
        }
    }
}


//let root = TreeNode(7)
//let leftChild = TreeNode(4)
//let rightChild = TreeNode(10)
//let leftChildLeft = TreeNode(3)
//let leftChildRight = TreeNode(8)
//root.left = leftChild
//root.right = rightChild
//leftChild.left = leftChildLeft
//leftChild.right = leftChildRight

let root = TreeNode(1)
let node1 = TreeNode(2)
let node2 = TreeNode(3)
root.right = node1
node1.left = node2

let solu = Solution()
print(solu.inorderTraversal(root))
