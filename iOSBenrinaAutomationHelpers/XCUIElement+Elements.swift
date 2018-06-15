//
//  XCUIElement+Elements.swift
//  iOSBenrinaAutomationHelpers
//
//  Created by Pavel Balint on 13/06/2018.
//  Copyright © 2018 Pavel Balint. All rights reserved.
//

import Foundation
import XCTest
fileprivate var _timeout: TimeInterval = 2

public var timeout: TimeInterval {
  get {
    return _timeout
  }
  set {
    _timeout = newValue
  }
}

extension XCUIElement {
  public func descendants(ofType elementType: ElementType, which predicates: [ElementPredicate]) -> XCUIElementQuery {
    return self.descendants(matching: elementType).matching(predicates)
  }
  
  public func children(ofType elementType: ElementType, which predicates: [ElementPredicate]) -> XCUIElementQuery {
    return self.children(matching: elementType).matching(predicates)
  }
  
  public func wait(until elementPredicates: [ElementPredicate], atMost timeout: TimeInterval = timeout, xctWaiter: XCTWaiter = XCTWaiter()) -> Bool {
    let predicate = NSPredicate(elementPredicates: elementPredicates)
    return XCTContext.runActivity(named: "Checking for element fulfil predicate \"\(predicate.predicateFormat)\"\nwithin \(timeout)s\nfor \(self.description)") { _ -> Bool in
    let expectation = XCTNSPredicateExpectation(predicate: predicate, object: self)
    let result = xctWaiter.wait(for: [expectation], timeout: timeout)
    return result == .completed
    }
  }
}
