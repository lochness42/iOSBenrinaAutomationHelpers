//
//  PredicateBuildersTests.swift
//  iOSBenrinaAutomationHelpersTests
//
//  Created by Pavel Balint on 12/06/2018.
//  Copyright © 2018 Pavel Balint. All rights reserved.
//

import XCTest
@testable import iOSBenrinaAutomationHelpers

class ElementPredicatesTests: XCTestCase {

  // MARK: - and tests
  func testAndPredicateFormat() {
    let andPredicate = ElementPredicate.and
    XCTAssertEqual(andPredicate.format, "AND")
  }
  func testAndPredicateArguments() {
    let andPredicate = ElementPredicate.and
    XCTAssertNil(andPredicate.arguments)
  }

  // MARK: - or tests
  func testOrPredicateFormat() {
    let orPredicate = ElementPredicate.or
    XCTAssertEqual(orPredicate.format, "OR")
  }
  func testOrPredicateArguments() {
    let orPredicate = ElementPredicate.or
    XCTAssertNil(orPredicate.arguments)
  }

  // MARK: - isEnabled tests
  func testIsEnabledFormat() {
    let enabledPredicate = ElementPredicate.isEnabled
    XCTAssertEqual(enabledPredicate.format, "enabled == true")
  }
  func testIsEnabledPredicateArugments() {
    let enabledPredicate = ElementPredicate.isEnabled
    XCTAssertNil(enabledPredicate.arguments)
  }

  // MARK: - isDisabled tests
  func testIsDisabledPredicateFormat() {
    let disabledPredicate = ElementPredicate.isDisabled
    XCTAssertEqual(disabledPredicate.format, "NOT enabled == true")
  }
  func testIsDisabledPredicateArugments() {
    let disabledPredicate = ElementPredicate.isDisabled
    XCTAssertNil(disabledPredicate.arguments)
  }

  // MARK: - exists tests
  func testExistsPredicateFormat() {
    let existsPredicate = ElementPredicate.exists
    XCTAssertEqual(existsPredicate.format, "exists == true")
  }
  func testExistsPredicateArguments() {
    let existsPredicate = ElementPredicate.exists
    XCTAssertNil(existsPredicate.arguments)
  }

  // MARK: - doesNotExist tests
  func testDoesNotExistPredicateFormat() {
    let doesNotExistPredicate = ElementPredicate.doesNotExist
    XCTAssertEqual(doesNotExistPredicate.format, "NOT exists == true")
  }
  func testDoesNotExistPredicateArguments() {
    let doesNotExistPredicate = ElementPredicate.doesNotExist
    XCTAssertNil(doesNotExistPredicate.arguments)
  }

  // MARK: - isHittable tests
  func testIsHittablePredicateFormat() {
    let isHittablePredicate = ElementPredicate.isHittable
    XCTAssertEqual(isHittablePredicate.format, "hittable == true")
  }
  func testIsHittablePredicateArguments() {
    let isHittablePredicate = ElementPredicate.isHittable
    XCTAssertNil(isHittablePredicate.arguments)
  }

  // MARK: - isNotHittable tests
  func testIsNotHittablePredicateFormat() {
    let isNotHittablePredicate = ElementPredicate.isNotHittable
    XCTAssertEqual(isNotHittablePredicate.format, "NOT hittable == true")
  }
  func testIsNotHittablePredicateArguments() {
    let isNotHittablePredicate = ElementPredicate.isNotHittable
    XCTAssertNil(isNotHittablePredicate.arguments)
  }

  // MARK: - isSelected tests
  func testIsSelectedPredicateFormat() {
    let isSelectedPredicate = ElementPredicate.isSelected
    XCTAssertEqual(isSelectedPredicate.format, "selected == true")
  }
  func testIsSelectedPredicateArguments() {
    let isSelectedPredicate = ElementPredicate.isSelected
    XCTAssertNil(isSelectedPredicate.arguments)
  }

  // MARK: - isNotSelected tests
  func testIsNotSelectedPredicateFormat() {
    let isNotSelectedPredicate = ElementPredicate.isNotSelected
    XCTAssertEqual(isNotSelectedPredicate.format, "NOT selected == true")
  }
  func testIsNotSelectedPredicateArguments() {
    let isNotSelectedPredicate = ElementPredicate.isNotSelected
    XCTAssertNil(isNotSelectedPredicate.arguments)
  }

  // MARK: - contains tests
  func testContainsPredicateFormat() {
    let containsPredicate = ElementPredicate.contains(.attribute("text"), "test")
    XCTAssertEqual(containsPredicate.format, "text CONTAINS[cd] %@")
  }
  func testContainsPredicateArguments() {
    let containsPredicate = ElementPredicate.contains(.attribute("text"), "test")
    let arguments = containsPredicate.arguments as! [String]
    XCTAssertEqual(arguments, ["test"])
  }
  func testContainsCheckPredicateFormat() {
    let containsPredicate = ElementPredicate.contains(.attribute("text"), "test")
    let predicate = NSPredicate(elementPredicates: [containsPredicate])
    XCTAssertEqual(predicate.predicateFormat, "text CONTAINS[cd] \"test\"")
  }

  // MARK: - doesNotContain tests
  func testDoesNotContainPredicateFormat() {
    let doesNotContainPredicate = ElementPredicate.doesNotContain(.attribute("text"), "test")
    XCTAssertEqual(doesNotContainPredicate.format, "NOT text CONTAINS[cd] %@")
  }
  func testDoesNotContainPredicateArguments() {
    let doesNotContainPredicate = ElementPredicate.doesNotContain(.attribute("text"), "test")
    let arguments = doesNotContainPredicate.arguments as! [String]
    XCTAssertEqual(arguments, ["test"])
  }
  func testDoesNotContainPredicateCheckPredicateFormat() {
    let doesNotContainPredicate = ElementPredicate.doesNotContain(.attribute("text"), "test")
    let predicate = NSPredicate(elementPredicates: [doesNotContainPredicate])
    XCTAssertEqual(predicate.predicateFormat, "NOT text CONTAINS[cd] \"test\"")
  }

  // MARK: - equals tests
  func testEqualsPredicateFormat() {
    let equalsPredicate = ElementPredicate.equals(.attribute("text"), "test")
    XCTAssertEqual(equalsPredicate.format, "text ==[c] %@")
  }
  func testEqualsPredicateArguments() {
    let equalsPredicate = ElementPredicate.equals(.attribute("text"), "test")
    let arguments = equalsPredicate.arguments as! [String]
    XCTAssertEqual(arguments, ["test"])
  }
  func testEqualsPredicateCheckPredicateFormat() {
    let equalsPredicate = ElementPredicate.equals(.attribute("text"), "test")
    let predicate = NSPredicate(elementPredicates: [equalsPredicate])
    XCTAssertEqual(predicate.predicateFormat, "text ==[c] \"test\"")
  }

  // MARK: - doesNotEqual tests
  func testDoesNotEqualPredicateFormat() {
    let doesNotEqualPredicate = ElementPredicate.doesNotEqual(.attribute("text"), "test")
    XCTAssertEqual(doesNotEqualPredicate.format, "NOT text ==[c] %@")
  }
  func testDoesNotEqualPredicateArguments() {
    let doesNotEqualPredicate = ElementPredicate.doesNotEqual(.attribute("text"), "test")
    let arguments = doesNotEqualPredicate.arguments as! [String]
    XCTAssertEqual(arguments, ["test"])
  }
  func testDoesNotEqualPredicateCheckPredicateFormat() {
    let doesNotEqualPredicate = ElementPredicate.doesNotEqual(.attribute("text"), "test")
    let predicate = NSPredicate(elementPredicates: [doesNotEqualPredicate])
    XCTAssertEqual(predicate.predicateFormat, "NOT text ==[c] \"test\"")
  }

  // MARK: - beginsWith tests
  func testBeginsWithPredicateFormat() {
    let beginsWithPredicate = ElementPredicate.beginsWith(.attribute("text"), "test")
    XCTAssertEqual(beginsWithPredicate.format, "text BEGINSWITH[cd] %@")
  }
  func testBeginsWithPredicateArguments() {
    let beginsWithPredicate = ElementPredicate.beginsWith(.attribute("text"), "test")
    let arguments = beginsWithPredicate.arguments as! [String]
    XCTAssertEqual(arguments, ["test"])
  }
  func testBeginsWithPredicateCheckPredicateFormat() {
    let beginsWithPredicate = ElementPredicate.beginsWith(.attribute("text"), "test")
    let predicate = NSPredicate(elementPredicates: [beginsWithPredicate])
    XCTAssertEqual(predicate.predicateFormat, "text BEGINSWITH[cd] \"test\"")
  }

  // MARK: - doesNotBeginWith tests
  func testDoesNotBeginWithPredicateFormat() {
    let doesNotBeginWithPredicate = ElementPredicate.doesNotBeginWith(.attribute("text"), "test")
    XCTAssertEqual(doesNotBeginWithPredicate.format, "NOT text BEGINSWITH[cd] %@")
  }
  func testDoesNotBeginWithPredicateArguments() {
    let doesNotBeginWithPredicate = ElementPredicate.doesNotBeginWith(.attribute("text"), "test")
    let arguments = doesNotBeginWithPredicate.arguments as! [String]
    XCTAssertEqual(arguments, ["test"])
  }
  func testDoesNotBeginWithPredicateCheckPredicateFormat() {
    let doesNotBeginWithPredicate = ElementPredicate.doesNotBeginWith(.attribute("text"), "test")
    let predicate = NSPredicate(elementPredicates: [doesNotBeginWithPredicate])
    XCTAssertEqual(predicate.predicateFormat, "NOT text BEGINSWITH[cd] \"test\"")
  }

  // MARK: - endsWith tests
  func testEndsWithPredicateFormat() {
    let endsWithPredicate = ElementPredicate.endsWith(.attribute("text"), "test")
    XCTAssertEqual(endsWithPredicate.format, "text ENDSWITH[cd] %@")
  }
  func testEndsWithPredicateArguments() {
    let endsWithPredicate = ElementPredicate.endsWith(.attribute("text"), "test")
    let arguments = endsWithPredicate.arguments as! [String]
    XCTAssertEqual(arguments, ["test"])
  }
  func testEndsWithPredicateCheckPredicateFormat() {
    let endsWithPredicate = ElementPredicate.endsWith(.attribute("text"), "test")
    let predicate = NSPredicate(elementPredicates: [endsWithPredicate])
    XCTAssertEqual(predicate.predicateFormat, "text ENDSWITH[cd] \"test\"")
  }

  // MARK: - doesNotEndWith tests
  func testDoesNotEndWithPredicateFormat() {
    let doesNotEndWithPredicate = ElementPredicate.doesNotEndWith(.attribute("text"), "test")
    XCTAssertEqual(doesNotEndWithPredicate.format, "NOT text ENDSWITH[cd] %@")
  }
  func testDoesNotEndWithPredicateArguments() {
    let doesNotEndWithPredicate = ElementPredicate.doesNotEndWith(.attribute("text"), "test")
    let arguments = doesNotEndWithPredicate.arguments as! [String]
    XCTAssertEqual(arguments, ["test"])
  }
  func testDoesNotEndWithPredicateCheckPredicateFormat() {
    let doesNotEndWithPredicate = ElementPredicate.doesNotEndWith(.attribute("text"), "test")
    let predicate = NSPredicate(elementPredicates: [doesNotEndWithPredicate])
    XCTAssertEqual(predicate.predicateFormat, "NOT text ENDSWITH[cd] \"test\"")
  }

  // MARK: - matchesWithRegex tests
  func testMatchesWithRegexPredicateFormat() {
    let matchesWithRegexPredicate = ElementPredicate.matchesWithRegex(.attribute("text"), "test")
    XCTAssertEqual(matchesWithRegexPredicate.format, "text MATCHES %@")
  }
  func testMatchesWithRegexPredicateArguments() {
    let matchesWithRegexPredicate = ElementPredicate.matchesWithRegex(.attribute("text"), "test")
    let arguments = matchesWithRegexPredicate.arguments as! [String]
    XCTAssertEqual(arguments, ["test"])
  }
  func testMatchesWithRegexPredicateCheckPredicateFormat() {
    let matchesWithRegexPredicate = ElementPredicate.matchesWithRegex(.attribute("text"), "test")
    let predicate = NSPredicate(elementPredicates: [matchesWithRegexPredicate])
    XCTAssertEqual(predicate.predicateFormat, "text MATCHES \"test\"")
  }

  // MARK: - doesNotMatchWithRegex tests
  func testDoesNotMatchWithRegexPredicateFormat() {
    let doesNotMatchWithRegexPredicate = ElementPredicate.doesNotMatchWithRegex(.attribute("text"), "test")
    XCTAssertEqual(doesNotMatchWithRegexPredicate.format, "NOT text MATCHES %@")
  }
  func testDoesNotMatchWithRegexPredicateArguments() {
    let doesNotMatchWithRegexPredicate = ElementPredicate.doesNotMatchWithRegex(.attribute("text"), "test")
    let arguments = doesNotMatchWithRegexPredicate.arguments as! [String]
    XCTAssertEqual(arguments, ["test"])
  }
  func testDoesNotMatchWithRegexPredicateFormatCheckPredicateFormat() {
    let doesNotMatchWithRegexPredicate = ElementPredicate.doesNotMatchWithRegex(.attribute("text"), "test")
    let predicate = NSPredicate(elementPredicates: [doesNotMatchWithRegexPredicate])
    XCTAssertEqual(predicate.predicateFormat, "NOT text MATCHES \"test\"")
  }

  // MARK: - isOneOfTheValues tests
  func testIsOneOfTheValuesPredicateFormat() {
    let isOneOfTheValuesPredicate = ElementPredicate.isOneOfTheValues(.attribute("text"), ["test", "test2"])
    XCTAssertEqual(isOneOfTheValuesPredicate.format, "text in { %@, %@ }")
  }
  func testIsOneOfTheValuesPredicateArguments() {
    let isOneOfTheValuesPredicate = ElementPredicate.isOneOfTheValues(.attribute("text"), ["test", "test2"])
    let arguments = isOneOfTheValuesPredicate.arguments as! [String]
    XCTAssertEqual(arguments, ["test", "test2"])
  }
  func testIsOneOfTheValuesPredicateCheckPredicateFormat() {
    let isOneOfTheValuesPredicate = ElementPredicate.isOneOfTheValues(.attribute("text"), ["test", "test2"])
    let predicate = NSPredicate(elementPredicates: [isOneOfTheValuesPredicate])
    XCTAssertEqual(predicate.predicateFormat, "text IN {\"test\", \"test2\"}")
  }

  // MARK: - isNotOneOfTheValues tests
  func testIsNotOneOfTheValuesPredicateFormat() {
    let isNotOneOfTheValuesPredicate = ElementPredicate.isNotOneOfTheValues(.attribute("text"), ["test", "test2"])
    XCTAssertEqual(isNotOneOfTheValuesPredicate.format, "NOT text in { %@, %@ }")
  }
  func testIsNotOneOfTheValuesPredicateArguments() {
    let isNotOneOfTheValuesPredicate = ElementPredicate.isNotOneOfTheValues(.attribute("text"), ["test", "test2"])
    let arguments = isNotOneOfTheValuesPredicate.arguments as! [String]
    XCTAssertEqual(arguments, ["test", "test2"])
  }
  func testIsNotOneOfTheValuesPredicateCheckPredicateFormat() {
    let isNotOneOfTheValuesPredicate = ElementPredicate.isNotOneOfTheValues(.attribute("text"), ["test", "test2"])
    let predicate = NSPredicate(elementPredicates: [isNotOneOfTheValuesPredicate])
    XCTAssertEqual(predicate.predicateFormat, "NOT text IN {\"test\", \"test2\"}")
  }
}
