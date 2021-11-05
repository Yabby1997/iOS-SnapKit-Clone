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
            let priority = constraintItems.top.priorityLayout
            var constraint: NSLayoutConstraint? = nil
            
            switch constraintItems.top.mode {
            case .equalTo: constraint = self.topAnchor.constraint(equalTo: anchor, constant: constant)
            case .greaterThanOrEqualTo: constraint = self.topAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
            case .lessThanOrEqualTo: constraint = self.topAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
            }
            constraint?.priority = priority
            constraint?.isActive = true
        }
        
        if let anchor = constraintItems.bottom.anchor {
            let constant = constraintItems.bottom.constant
            let priority = constraintItems.bottom.priorityLayout
            var constraint: NSLayoutConstraint? = nil
            
            switch constraintItems.bottom.mode {
            case .equalTo: constraint = self.bottomAnchor.constraint(equalTo: anchor, constant: constant)
            case .greaterThanOrEqualTo: constraint = self.bottomAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
            case .lessThanOrEqualTo: constraint = self.bottomAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
            }
            constraint?.priority = priority
            constraint?.isActive = true
        }
        
        if let anchor = constraintItems.leading.anchor {
            let constant = constraintItems.leading.constant
            let priority = constraintItems.leading.priorityLayout
            var constraint: NSLayoutConstraint? = nil
            
            switch constraintItems.leading.mode {
            case .equalTo: constraint = self.leadingAnchor.constraint(equalTo: anchor, constant: constant)
            case .greaterThanOrEqualTo: constraint = self.leadingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
            case .lessThanOrEqualTo: constraint = self.leadingAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
            }
            constraint?.priority = priority
            constraint?.isActive = true
        }
        
        if let anchor = constraintItems.trailing.anchor {
            let constant = constraintItems.trailing.constant
            let priority = constraintItems.trailing.priorityLayout
            var constraint: NSLayoutConstraint? = nil
            
            switch constraintItems.trailing.mode {
            case .equalTo: constraint = self.trailingAnchor.constraint(equalTo: anchor, constant: constant)
            case .greaterThanOrEqualTo: constraint = self.trailingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
            case .lessThanOrEqualTo: constraint = self.trailingAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
            }
            constraint?.priority = priority
            constraint?.isActive = true
        }
        
        if let widthConstant = constraintItems.width.constant {
            var constraint: NSLayoutConstraint? = nil
            switch constraintItems.width.mode {
            case .equalTo: constraint = widthAnchor.constraint(equalToConstant: widthConstant)
            case .greaterThanOrEqualTo: constraint = widthAnchor.constraint(greaterThanOrEqualToConstant: widthConstant)
            case .lessThanOrEqualTo: constraint = widthAnchor.constraint(lessThanOrEqualToConstant: widthConstant)
            }
            constraint?.priority = constraintItems.width.priorityLayout
            constraint?.isActive = true
        }
        
        if let widthDimension = constraintItems.width.dimension {
            let multiplier = constraintItems.width.multiplier
            var constraint: NSLayoutConstraint? = nil
            switch constraintItems.width.mode {
            case .equalTo: constraint = widthAnchor.constraint(equalTo: widthDimension, multiplier: multiplier)
            case .greaterThanOrEqualTo: constraint = widthAnchor.constraint(greaterThanOrEqualTo: widthDimension, multiplier: multiplier)
            case .lessThanOrEqualTo: constraint = widthAnchor.constraint(lessThanOrEqualTo: widthDimension, multiplier: multiplier)
            }
            constraint?.priority = constraintItems.width.priorityLayout
            constraint?.isActive = true
        }
        
        if let heightConstant = constraintItems.height.constant {
            var constraint: NSLayoutConstraint? = nil
            switch constraintItems.height.mode {
            case .equalTo: constraint = heightAnchor.constraint(equalToConstant: heightConstant)
            case .greaterThanOrEqualTo: constraint = heightAnchor.constraint(greaterThanOrEqualToConstant: heightConstant)
            case .lessThanOrEqualTo: constraint = heightAnchor.constraint(lessThanOrEqualToConstant: heightConstant)
            }
            constraint?.priority = constraintItems.height.priorityLayout
            constraint?.isActive = true
        }
        
        if let heightDimension = constraintItems.height.dimension {
            let multiplier = constraintItems.height.multiplier
            var constraint: NSLayoutConstraint? = nil
            switch constraintItems.height.mode {
            case .equalTo: constraint = heightAnchor.constraint(equalTo: heightDimension, multiplier: multiplier)
            case .greaterThanOrEqualTo: constraint = heightAnchor.constraint(greaterThanOrEqualTo: heightDimension, multiplier: multiplier)
            case .lessThanOrEqualTo: constraint = heightAnchor.constraint(lessThanOrEqualTo: heightDimension, multiplier: multiplier)
            }
            constraint?.priority = constraintItems.height.priorityLayout
            constraint?.isActive = true
        }
        
        if let anchor = constraintItems.centerX.anchor {
            let constant = constraintItems.centerX.constant
            self.centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
        
        if let anchor = constraintItems.centerY.anchor {
            let constant = constraintItems.centerY.constant
            self.centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
    }
}

class ConstraintItems {
    var top = YAxisConstraintItem()
    var bottom = YAxisConstraintItem()
    var leading = XAxisConstraintItem()
    var trailing = XAxisConstraintItem()
    var centerY = YAxisConstraintItem()
    var centerX = XAxisConstraintItem()
    var width = ConstantConstraintItem()
    var height = ConstantConstraintItem()
}

@frozen enum ConstraintMode {
    case equalTo
    case greaterThanOrEqualTo
    case lessThanOrEqualTo
}

class ConstantConstraintItem {
    fileprivate var dimension: NSLayoutDimension? = nil
    fileprivate var constant: CGFloat?
    fileprivate var mode: ConstraintMode = .equalTo
    fileprivate var multiplier: CGFloat = 1
    fileprivate var priorityLayout: UILayoutPriority = .required
    
    @discardableResult
    func equalTo(_ constant: CGFloat) -> ConstantConstraintItem {
        self.constant = constant
        return self
    }
    
    @discardableResult
    func equalTo(_ dimension: NSLayoutDimension) -> ConstantConstraintItem {
        self.dimension = dimension
        return self
    }
    
    @discardableResult
    func lessThanOrEqualTo(_ constant: CGFloat) -> ConstantConstraintItem {
        self.constant = constant
        self.mode = .lessThanOrEqualTo
        return self
    }
    
    @discardableResult
    func lessThanOrEqualTo(_ dimension: NSLayoutDimension) -> ConstantConstraintItem {
        self.dimension = dimension
        self.mode = .lessThanOrEqualTo
        return self
    }
    
    @discardableResult
    func greaterThanOrEqualTo(_ constant: CGFloat) -> ConstantConstraintItem {
        self.constant = constant
        self.mode = .greaterThanOrEqualTo
        return self
    }
    
    @discardableResult
    func greaterThanOrEqualTo(_ dimension: NSLayoutDimension) -> ConstantConstraintItem {
        self.dimension = dimension
        self.mode = .greaterThanOrEqualTo
        return self
    }
    
    @discardableResult
    func multipledBy(_ multiplier: CGFloat) -> ConstantConstraintItem {
        self.multiplier = multiplier
        return self
    }
    
    @discardableResult
    func priority(_ amount: UILayoutPriority) -> ConstantConstraintItem {
        self.priorityLayout = amount
        return self
    }
    
    @discardableResult
    func priority(_ amount: Float) -> ConstantConstraintItem {
        self.priorityLayout = UILayoutPriority(amount)
        return self
    }
}

class YAxisConstraintItem {
    fileprivate var anchor: NSLayoutYAxisAnchor? = nil
    fileprivate var constant: CGFloat = 0.0
    fileprivate var mode: ConstraintMode = .equalTo
    fileprivate var priorityLayout: UILayoutPriority = .required
    
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
    
    @discardableResult
    func priority(_ amount: UILayoutPriority) -> YAxisConstraintItem {
        self.priorityLayout = amount
        return self
    }
    
    @discardableResult
    func priority(_ amount: Float) -> YAxisConstraintItem {
        self.priorityLayout = UILayoutPriority(amount)
        return self
    }
}

class XAxisConstraintItem {
    fileprivate var anchor: NSLayoutXAxisAnchor? = nil
    fileprivate var constant: CGFloat = 0.0
    fileprivate var mode: ConstraintMode = .equalTo
    fileprivate var priorityLayout: UILayoutPriority = .required
    
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
    
    @discardableResult
    func priority(_ amount: UILayoutPriority) -> XAxisConstraintItem {
        self.priorityLayout = amount
        return self
    }
    
    @discardableResult
    func priority(_ amount: Float) -> XAxisConstraintItem {
        self.priorityLayout = UILayoutPriority(amount)
        return self
    }
}
