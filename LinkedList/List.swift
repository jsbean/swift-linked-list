//
//  List.swift
//  LinkedList
//
// from Airspeed Velocity: https://airspeedvelocity.net/2015/07/26/linked-lists-enums-value-types-and-identity/
//
//

private enum ListNode<Element> {
    case End
    indirect case Node(Element, next: ListNode<Element>)
    
    func cons(x: Element) -> ListNode<Element> {
        return .Node(x, next: self)
    }
}

public struct ListIndex<Element> {
    private let node: ListNode<Element>
}

public struct List<Element> {
    public typealias Index = ListIndex<Element>
    public var startIndex: Index
    
    // since this is a constant, no need to store it in a variable,
    // so use a computed property instead to save space
    public var endIndex: Index { return Index(node: .End) }
    
    public init() {
        startIndex = Index(node: .End)
    }
}


extension List {
    public mutating func push(x: Element) {
        startIndex = Index(node: startIndex.node.cons(x))
    }
    
    public mutating func pop() -> Element? {
        guard case let .Node(x, next: xs) = startIndex.node
            else { return nil }
        
        startIndex = Index(node: xs)
        return x
    }
}

extension List: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Element...) {
        self = List()
        for x in elements.reversed() { push(x: x) }
    }
}
