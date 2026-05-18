//
//  BinaryTree.swift
//
//
//  Created by Maria Eduarda on 17/05/26.
//

public indirect enum BinaryTree<T> {
    case empty
    case node(BinaryTree<T>, T, BinaryTree<T>)

}

// MARK: - Init
public extension BinaryTree {
    
    init() {
        self = .empty
    }
}

// MARK: - Insert
extension BinaryTree where T: Comparable {

    public mutating func insert(_ newValue: T) {
        self = insert(newValue)
    }

    private func insert(_ newValue: T) -> BinaryTree<T> {
        switch self {
        case .empty:
            return .node(.empty, newValue, .empty)

        case .node(let left, let value, let right):
            if newValue < value {
                return .node(left.insert(newValue), value, right)
            } else if newValue > value {
                return .node(left, value, right.insert(newValue))
            } else {
                return self   // duplicate — ignore
            }
        }
    }
}

// MARK: - Delete
extension BinaryTree where T: Comparable {
    public mutating func delete(_ target: T) {
        self = delete(target)
    }

    private func delete(_ target: T) -> BinaryTree<T> {
        switch self {
        case .empty:
            return .empty

        case .node(let left, let value, let right):
            if target < value {
                return .node(left.delete(target), value, right)

            } else if target > value {
                return .node(left, value, right.delete(target))

            } else {
                switch (left, right) {
                case (.empty, .empty):
                    return .empty
                case (.empty, _):
                    return right
                case (_, .empty):
                    return left
                default:
                    let successor = right.minimum()
                    let newRight  = right.delete(successor)
                    return .node(left, successor, newRight)
                }
            }
        }
    }

    func minimum() -> T {
        switch self {
        case .empty:
            fatalError("minimum() called on empty tree")
        case .node(.empty, let value, _):
            return value
        case .node(let left, _, _):
            return left.minimum()
        }
    }
}

// MARK: - Search
public extension BinaryTree where T: Comparable {
    func search(_ target: T) -> Bool {
        switch self {
        case .empty:
            return false

        case .node(let left, let value, let right):
            if target == value     { return true }
            else if target < value { return left.search(target) }
            else                   { return right.search(target) }
        }
    }
}

// MARK: - Traversals
public extension BinaryTree {

    // In-order: left → root → right
    func inOrder(_ visit: (T) -> Void) {
        switch self {
        case .empty:
            break
        case .node(let left, let value, let right):
            left.inOrder(visit)
            visit(value)
            right.inOrder(visit)
        }
    }

    // Pre-order: root → left → right
    func preOrder(_ visit: (T) -> Void) {
        switch self {
        case .empty:
            break
        case .node(let left, let value, let right):
            visit(value)
            left.preOrder(visit)
            right.preOrder(visit)
        }
    }

    // Post-order: left → right → root
    func postOrder(_ visit: (T) -> Void) {
        switch self {
        case .empty:
            break
        case .node(let left, let value, let right):
            left.postOrder(visit)
            right.postOrder(visit)
            visit(value)
        }
    }
}

// MARK: - Computed properties
public extension BinaryTree {
    var height: Int {
        switch self {
        case .empty:                     return -1
        case .node(let l, _, let r):     return 1 + max(l.height, r.height)
        }
    }

    var count: Int {
        switch self {
        case .empty:                     return 0
        case .node(let l, _, let r):     return 1 + l.count + r.count
        }
    }
}
