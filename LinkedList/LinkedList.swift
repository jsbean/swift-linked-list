//
//  LinkedList.swift
//  LinkedList
//
//  Adapted by Jeremy Corren on 12/22/16 from https://github.com/raywenderlich/swift-algorithm-club
//
//


/// Doubly LinkedList structure
public class LinkedList <T> {
    
    public typealias Node = LinkedListNode<T>
    
    // MARK: - Instance Properties
    
    /// The head node of the list
    private var head: Node?
    
    public var first: Node? {
        return head
    }
    
    /// The tail node of the list
    private var tail: Node?
    
    public var last: Node? {
        return tail
    }
    
    /// The number of nodes in the list
    public var count: Int
    
    // MARK: - Initializers
    
    /// Create an empty list
    public init() { count = 0 }
    
    /// Returns the number of nodes in the list
    public var tally: Int {
        return count
    }
    
    // MARK: - Instance Methods

    
    /// Append a node to end of the list
    public func append(value: T) {
        
        let newNode = Node(value: value)
        
        if let lastNode = last {
            newNode.previous = lastNode
            lastNode.next = newNode
            tail = newNode
        } else {
            head = newNode
            tail = newNode
        }
        count += 1
    }
    
    // Returns node at given index
    public func nodeAt(_ index: Int) -> Node? {
        
        if index <= count/2 {
            var node = head
            var i = index
            
            while node != nil {
                if i == 0 { return node }
                i -= 1
                node = node!.next
            }
        } else {
            var node = tail
            var i = (count-1) - index
            
            while node != nil {
                if i == 0 { return node }
                i -= 1
                node = node!.previous
            }
        }
        return nil
    }
    
    /// Returns a tuple of nodes before and after given `index`
    private func nodesBeforeAndAfter(index: Int) -> (Node?, Node?) {
        
        assert(index >= 0)
        
        if(index <= count/2) {
            var i = index
            var next = head
            var prev: Node?
            
            while next != nil && i > 0 {
                i -= 1
                prev = next
                next = next!.next
            }
            assert (i == 0)
            return (prev, next)
        } else {
            var i = count - index
            var prev = tail
            var next: Node?
            
            while prev != nil && i > 0 {
                i -= 1
                next = prev
                prev = prev!.previous
            }
            assert (i == 0)
            return (prev, next)
        }
    }
    
    /// Inserts node into the list at given `index`
    public func insert(value: T, index: Int) {
        
        let (prev, next) = nodesBeforeAndAfter(index: index)
        let newNode = Node(value: value)
        
        newNode.previous = prev
        newNode.next = next
        prev?.next = newNode
        next?.previous = newNode
        
        if prev == nil {
            head = newNode
        }
        
        if next == nil {
            tail = newNode
        }
        count += 1
    }
    
    /// Remove an individual node
    public func remove(node: Node) -> T {
        
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        
        if let next = next {
            next.previous = prev
        } else {
            tail = prev
        }
        node.previous = nil
        node.next = nil
        
        count -= 1
        return node.value
    }
    
    /// Remove all nodes from the list
    public func removeAll() {
        
        head = nil
        tail = nil
        
        count = 0
    }
    
    /// Returns element at given `index`
    public subscript(index: Int) -> T? {
        
        let node = nodeAt(index)
        
        if(node != nil) {
            return node!.value
        }
        return nil
    }
}
