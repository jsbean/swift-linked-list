//
//  LinkedList.swift
//  LinkedList
//
//  Adapted by Jeremy Corren on 12/22/16 from https://github.com/raywenderlich/swift-algorithm-club
//
//


/// Node in LinkedList structure
public class LinkedListNode <T> {
    
    // MARK: - Instance Properties
    
    var value: T
    var next: LinkedListNode?
    weak var previous: LinkedListNode?
    
    // MARK: - Initializers
    
    public init(value: T) {
        self.value = value
    }
    
}

/// Doubly LinkedList structure
public class LinkedList <T> {
    
    public typealias Node = LinkedListNode<T>
    
    // MARK: - Instance Properties
    
    private var head: Node?
    
    public var first: Node? {
        return head
    }
    
    private var tail: Node?
    
    public var last: Node? {
        return tail
    }
    
    public var tally: Int
    
    // MARK: - Initializers
    
    /// Create an empty list
    public init() { tally = 0 }
    
    // MARK: - Instance Methods
    
    /// Returns the number of nodes in the list
    public var count: Int {
        return tally
    }
    
    /// Append a node to end of the list
    public func append(value: T) {
        
        let newNode = Node(value: value)
        
        // If the list is not empty
        if let lastNode = last {
            newNode.previous = lastNode
            lastNode.next = newNode
            tail = newNode
        } else {
            head = newNode
            tail = newNode
        }
        tally += 1
    }
    
    // Returns node at given index
    public func nodeAt(_ index: Int) -> Node? {
        
        if index <= tally/2 {
            var node = head
            var i = index
            
            while node != nil {
                if i == 0 { return node }
                i -= 1
                node = node!.next
            }
        }
        else {
            var node = tail
            var i = (tally-1) - index
            
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
        if(index <= tally/2) {
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
        }
        else {
            var i = tally - index
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
        tally += 1
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
        tally -= 1
        
        return node.value
    }
    
    /// Remove all nodes from the list
    public func removeAll() {
        
        head = nil
        tail = nil
        tally = 0
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
