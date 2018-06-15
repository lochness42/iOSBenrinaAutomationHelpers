//
//  XCUIElementQuery+Elements.swift
//  iOSBenrinaAutomationHelpers
//
//  Created by Pavel Balint on 14/06/2018.
//  Copyright © 2018 Pavel Balint. All rights reserved.
//

import Foundation
import XCTest

extension XCUIElementQuery {
    /**
     matching function that returns XCUIElementQuery satisfying the element predicates

     @param array of predicates [ElementPredicate] Element predicates .exists, .doesNotExist, .isHittable and .isNotHittable are not allowed in this function

     @return resulting XCUIElementQuery
     */
    public func matching(_ predicates: [ElementPredicate]) -> XCUIElementQuery {
        XCTAssertFalse(checkElementPredicates(predicates),
                      "Element predicates .exists, .doesNotExist, .isHittable and .isNotHittable are not allowed in this function",
                      file: #file, line: #line)
        return self.matching(predicates)
    }

    /**
     containing function that returns XCUIElementQuery satisfying the element predicates

     @param array of predicates [ElementPredicate] Element predicates .exists, .doesNotExist, .isHittable and .isNotHittable are not allowed in this function

     @return resulting XCUIElementQuery
     */
    public func containing(_ predicates: [ElementPredicate]) -> XCUIElementQuery {
        XCTAssertFalse(checkElementPredicates(predicates),
                      "Element predicates .exists, .doesNotExist, .isHittable and .isNotHittable are not allowed in this function",
                      file: #file, line: #line)
        return self.containing(predicates)
    }

  /**
   descendants function that returns XCUIElementQuery satisfying the element predicates
   
   @param array of predicates [ElementPredicate] Element predicates .exists, .doesNotExist, .isHittable and .isNotHittable are not allowed in this function
   
   @return resulting XCUIElementQuery
   */
  public func descendants(ofType elementType: XCUIElement.ElementType, which predicates: [ElementPredicate]) -> XCUIElementQuery {
    return self.descendants(matching: elementType).matching(predicates)
  }
}
