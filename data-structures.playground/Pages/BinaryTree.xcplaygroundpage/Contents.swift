var tree: BinaryTree<Int> = .empty

tree.insert(10)
tree.insert(6)
tree.insert(15)
tree.insert(4)
tree.insert(8)

tree.inOrder { print($0, terminator: " ") }

print()
tree.preOrder{ print($0, terminator: " ") }

print()
tree.postOrder{ print($0, terminator: " ") }

tree.delete(10)

print()
tree.inOrder { print($0, terminator: " ") }

print()
if tree.search(6) { print("FOUND") } else { print("NOT FOUND") }
