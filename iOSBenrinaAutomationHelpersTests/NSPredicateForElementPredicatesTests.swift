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
  class Element: NSObject {
    let identifier: String
    let value: String
    let attribute: String
    let exists: String
    let hittable: String
    let enabled: String

    init(identifier: String = "", value: String = "", attribute: String = "",
         exists: String = "1", hittable: String = "1", enabled: String = "1") {
      self.identifier = identifier
      self.value = value
      self.attribute = attribute
      self.exists = exists
      self.hittable = hittable
      self.enabled = enabled
    }

    override var description: String {
      return "identifier: \(identifier)\nvalue:\(value)\nattribute:\(attribute)\nexists:\(exists)\nenabled:\(enabled)\nhittable:\(hittable)"
    }
  }

  func testChainingElementPredicatesWithNSPredicate() {
    let chainedNSPredicate = NSPredicate(elementPredicates: [.exists, .or, .contains(.value, "test"), .and, .doesNotEndWith(.attribute("attribute"), "END")])
    XCTAssertEqual(chainedNSPredicate.predicateFormat, "exists == 1 OR (value CONTAINS[cd] \"test\" AND (NOT attribute ENDSWITH[cd] \"END\"))")
  }

  func testNSPredicateWhereElementPredicateHasNoArguments() {
    let nsPredicate = NSPredicate(elementPredicates: [.exists])
    XCTAssertEqual(nsPredicate.predicateFormat, "exists == 1")
  }

}
