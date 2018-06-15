//
//  XCUIElementQuery+Elements.swift
//  iOSBenrinaAutomationHelpers
//
//  Created by Pavel Balint on 14/06/2018.
//  Copyright © 2018 Pavel Balint. All rights reserved.
//

import XCTest

extension XCUIElementQuery {
  /**
   Returns matching elements satisfying the element predicates
   - Warning: Element predicates .exists, .doesNotExist, .isHittable and .isNotHittable are not allowed in this function

   ## Usage Example: ##
   ````
   XCUIApplication().buttons.matching([.contains(.identifier, "test"), .and, .doesNotEndWith(.label, "endsWith")])
   ````

   - Parameter predicates: array of predicates [ElementPredicate] that matching elements should fulfil.

   - Returns: resulting XCUIElementQuery
   */
  public func matching(_ predicates: [ElementPredicate]) -> XCUIElementQuery {
    XCTAssertFalse(checkAllowedElementPredicates(predicates),
                   "Element predicates .exists, .doesNotExist, .isHittable and .isNotHittable are not allowed in this function",
                   file: #file, line: #line)
    return self.matching(NSPredicate(elementPredicates: predicates))
  }

  /**
   Returns query elements which are containing elements satisfying the element predicates
   - Warning: Element predicates .exists, .doesNotExist, .isHittable and .isNotHittable are not allowed in this function

   ## Usage Example: ##
   ````
   XCUIApplication().containing([.contains(.identifier, "test"), .and, .doesNotEndWith(.label, "endsWith")])
   ````

   - Parameter predicates: array of predicates [ElementPredicate] that matching elements should fulfil.

   - Returns: resulting XCUIElementQuery
   */
  public func containing(_ predicates: [ElementPredicate]) -> XCUIElementQuery {
    XCTAssertFalse(checkAllowedElementPredicates(predicates),
                   "Element predicates .exists, .doesNotExist, .isHittable and .isNotHittable are not allowed in this function",
                   file: #file, line: #line)
    return self.containing(NSPredicate(elementPredicates: predicates))
  }
}
