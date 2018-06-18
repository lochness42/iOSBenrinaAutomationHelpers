//
//  NSPredicateForElementPredicatesTests.swift
//  iOSBenrinaAutomationHelpersTests
//
//  Created by Pavel Balint on 12/06/2018.
//  Copyright © 2018 Pavel Balint. All rights reserved.
//

import XCTest
@testable import iOSBenrinaAutomationHelpers

class NSPredicateForElementPredicatesTests: XCTestCase {
  func testChainingElementPredicatesWithNSPredicate() {
    let chainedNSPredicate = NSPredicate(elementPredicates: [.exists, .or, .contains(.value, "test"), .and, .doesNotEndWith(.attribute("attribute"), "END")])
    XCTAssertEqual(chainedNSPredicate.predicateFormat, "exists == 1 OR (value CONTAINS[cd] \"test\" AND (NOT attribute ENDSWITH[cd] \"END\"))")
  }

  func testNSPredicateWhereElementPredicateHasNoArguments() {
    let nsPredicate = NSPredicate(elementPredicates: [.exists])
    XCTAssertEqual(nsPredicate.predicateFormat, "exists == 1")
  }

}
