//
//  ElementAttributesTests.swift
//  iOSBenrinaAutomationHelpersTests
//
//  Created by Pavel Balint on 12/06/2018.
//  Copyright © 2018 Pavel Balint. All rights reserved.
//

import XCTest
@testable import iOSBenrinaAutomationHelpers

class ElementAttributesTests: XCTestCase {
  // MARK: - identifier attribute test
  func testIdentifierAttributeValue() {
    XCTAssertEqual(ElementAttribute.identifier.format, "identifier")
  }

  // MARK: - label attribute test
  func testLabelAttributeValue() {
    XCTAssertEqual(ElementAttribute.label.format, "label")
  }

  // MARK: - text attribute test
  func testTextAttributeValue() {
    XCTAssertEqual(ElementAttribute.title.format, "title")
  }

  // MARK: - value attribute test
  func testValueAttributeValue() {
    XCTAssertEqual(ElementAttribute.value.format, "value")
  }

  // MARK: - placeholderValue attribute test
  func testPlaceholderValueAttributeValue() {
    XCTAssertEqual(ElementAttribute.placeholderValue.format, "placeholderValue")
  }

  // MARK: - custom attribute test
  func testCustomAttributeValue() {
    XCTAssertEqual(ElementAttribute.attribute("test").format, "test")
  }
}
