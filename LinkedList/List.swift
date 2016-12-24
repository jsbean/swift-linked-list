//
//  List.swift
//  LinkedList
//
// from Airspeed Velocity: https://airspeedvelocity.net/2015/07/26/linked-lists-enums-value-types-and-identity/
//
//

/// Node in a `List`.
fileprivate enum ListNode<Element> {

    /// Last node in `List`.
    case end
    
    /// Node with pointer to next node.
    indirect case node(Element, next: ListNode<Element>)
    
    /// Construct a new list with the given `value` held by a node at the front.
    func cons(_ value: Element) -> ListNode<Element> {
        return .node(value, next: self)
    }
}

/// Container with reference to a given `ListNode`.
public struct ListIndex<Element> {
    
    /// `ListNode` reference.
    fileprivate let node: ListNode<Element>
}

/// Linked list containing `ListNode` values.
public struct List<Element> {
    
    // MARK: - Associated Types
    
    /// Index type.
    public typealias Index = ListIndex<Element>
    
    // MARK: - Instance Properties
    
    /// Start index.
    public var startIndex: Index
    
    /// End index.
    public var endIndex: Index {
        return Index(node: .end)
    }
    
    // MARK: - Initializers
    
    /// Create an empty `List`
    public init() {
        startIndex = Index(node: .end)
    }
}

extension List {

    /// Push a `ListNode` holding the given `value` onto the front of the list.
    public mutating func push(x: Element) {
        startIndex = Index(node: startIndex.node.cons(x))
    }
    
    /// - returns: The element contained by the `ListNode` at the front of the list, if the
    /// list is not empty. Otherwise, `nil`.
    public mutating func pop() -> Element? {
        
        guard case let .node(x, next: xs) = startIndex.node else {
            return nil
        }
        
        startIndex = Index(node: xs)
        return x
    }
}

extension List: ExpressibleByArrayLiteral {
    
    // - MARK: `ExpressibleByArrayLiteral`
    
    /// Create a `List` with an array literal.
    public init(arrayLiteral elements: Element...) {
        self = List()
        for x in elements.reversed() { push(x: x) }
    }
}
