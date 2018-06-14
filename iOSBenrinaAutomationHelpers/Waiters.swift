//
//  Waiters.swift
//  iOSBenrinaAutomationHelpers
//
//  Created by Pavel Balint on 13/06/2018.
//  Copyright © 2018 Pavel Balint. All rights reserved.
//

import XCTest

public var xctWaiter: XCTWaiter = XCTWaiter()

public func customWait(forElement element: XCUIElement, to elementPredicates: [ElementPredicate], atMost timeout: TimeInterval = 2) -> Bool {
  let predicate = NSPredicate(elementPredicates: elementPredicates)
  let expectation = XCTestCase().expectation(for: predicate, evaluatedWith: element, handler: nil)

  let result = xctWaiter.wait(for: [expectation], timeout: 5)
  return result == .completed
}
