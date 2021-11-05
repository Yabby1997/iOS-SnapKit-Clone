//
//  UIView+Extensions.swift
//  SnapKitClone
//
//  Created by Seunghun Yang on 2021/11/05.
//

import UIKit

extension UIView {
    func makeConstraints(_ layout:  (_ make: ConstraintItems) -> Void) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let constraintItems = ConstraintItems()
        layout(constraintItems)
        
        if let anchor = constraintItems.top.anchor {
            let constant = constraintItems.top.constant
            switch constraintItems.top.mode {
            case .equalTo: self.topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
            case .greaterThanOrEqualTo: self.topAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant).isActive = true
            case .lessThanOrEqualTo: self.topAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant).isActive = true
            }
        }
        
        if let anchor = constraintItems.bottom.anchor {
            let constant = constraintItems.bottom.constant
            switch constraintItems.bottom.mode {
            case .equalTo: self.bottomAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
            case .greaterThanOrEqualTo: self.bottomAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant).isActive = true
            case .lessThanOrEqualTo: self.bottomAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant).isActive = true
            }
        }
        
        if let anchor = constraintItems.leading.anchor {
            let constant = constraintItems.leading.constant
            switch constraintItems.leading.mode {
            case .equalTo: self.leadingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
            case .greaterThanOrEqualTo: self.leadingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant).isActive = true
            case .lessThanOrEqualTo: self.leadingAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant).isActive = true
            }
        }
        
        if let anchor = constraintItems.trailing.anchor {
            let constant = constraintItems.trailing.constant
            switch constraintItems.trailing.mode {
            case .equalTo: self.trailingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
            case .greaterThanOrEqualTo: self.trailingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant).isActive = true
            case .lessThanOrEqualTo: self.trailingAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant).isActive = true
            }
        }
    }
}

class ConstraintItems {
    var top = YAxisConstraintItem()
    var bottom = YAxisConstraintItem()
    var leading = XAxisConstraintItem()
    var trailing = XAxisConstraintItem()
}

@frozen enum ConstraintMode {
    case equalTo
    case greaterThanOrEqualTo
    case lessThanOrEqualTo
}

class YAxisConstraintItem {
    var anchor: NSLayoutYAxisAnchor? = nil
    var constant: CGFloat = 0.0
    var mode: ConstraintMode = .equalTo
    
    @discardableResult
    func equalTo(_ anchor: NSLayoutYAxisAnchor) -> YAxisConstraintItem {
        self.anchor = anchor
        return self
    }
    
    @discardableResult
    func greaterThanOrEqualTo(_ anchor: NSLayoutYAxisAnchor) -> YAxisConstraintItem {
        self.anchor = anchor
        self.mode = .greaterThanOrEqualTo
        return self
    }
    
    @discardableResult
    func lessThanOrEqualTo(_ anchor: NSLayoutYAxisAnchor) -> YAxisConstraintItem {
        self.anchor = anchor
        self.mode = .lessThanOrEqualTo
        return self
    }
    
    @discardableResult
    func offset(_ constant: CGFloat) -> YAxisConstraintItem {
        self.constant = constant
        return self
    }
}

class XAxisConstraintItem {
    var anchor: NSLayoutXAxisAnchor? = nil
    var constant: CGFloat = 0.0
    var mode: ConstraintMode = .equalTo
    
    @discardableResult
    func equalTo(_ anchor: NSLayoutXAxisAnchor) -> XAxisConstraintItem {
        self.anchor = anchor
        return self
    }
    
    @discardableResult
    func greaterThan(_ anchor: NSLayoutXAxisAnchor) -> XAxisConstraintItem {
        self.anchor = anchor
        self.mode = .greaterThanOrEqualTo
        return self
    }
    
    @discardableResult
    func lessThan(_ anchor: NSLayoutXAxisAnchor) -> XAxisConstraintItem {
        self.anchor = anchor
        self.mode = .lessThanOrEqualTo
        return self
    }
    
    @discardableResult
    func offset(_ constant: CGFloat) -> XAxisConstraintItem {
        self.constant = constant
        return self
    }
}
