//
//  HelpersTests.swift
//  iOSBenrinaAutomationHelpersTests
//
//  Created by Pavel Balint on 15/06/2018.
//  Copyright © 2018 Pavel Balint. All rights reserved.
//

import XCTest
@testable import iOSBenrinaAutomationHelpers

class HelpersTests: XCTestCase {
    
  func testCheckAllowedElementPredicatesForAllowedPredicateTypes() {
    let predicates: [ElementPredicate] = [.isEnabled, .isDisabled, .contains(.identifier, "test")]
    XCTAssertFalse(checkAllowedElementPredicates(predicates))
  }

  func testCheckAllowedElementPredicatesForNotAllowedPredicateTypes() {
    let predicates: [ElementPredicate] = [.exists, .doesNotExist, .isHittable, .isNotHittable]
    XCTAssertTrue(checkAllowedElementPredicates(predicates))
  }

  func testCanGetAndSetDefaultTimeout() {
    XCTAssertEqual(timeout, 2)
    timeout = 5
    XCTAssertEqual(timeout, 5)
  }

  func testToggleSwitchOn() {
    XCTAssertEqual(ToggleSwitch.on.rawValue, "1")
  }

  func testToggleSwitchOff() {
    XCTAssertEqual(ToggleSwitch.off.rawValue, "0")
  }
}

