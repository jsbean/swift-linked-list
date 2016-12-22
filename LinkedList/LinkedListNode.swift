//
//  LinkedListNode.swift
//  LinkedList
//
//  Adapted by Jeremy Corren on 12/22/16 from https://github.com/raywenderlich/swift-algorithm-club
//
//


/// Node in LinkedList structure
public class LinkedListNode <T> {
    
    // MARK: - Instance Properties
    
    /// Value carried by the node
    var value: T
    
    /// Pointer to the next node
    var next: LinkedListNode?
    
    /// Pointer to the previous node
    weak var previous: LinkedListNode?
    
    // MARK: - Initializers
    
    public init(value: T) {
        self.value = value
    }
}
