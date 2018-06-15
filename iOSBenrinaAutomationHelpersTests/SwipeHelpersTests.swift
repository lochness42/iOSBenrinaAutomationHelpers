//
//  SwipeHelpersTests.swift
//  iOSBenrinaAutomationHelpersTests
//
//  Created by Pavel Balint on 15/06/2018.
//  Copyright © 2018 Pavel Balint. All rights reserved.
//

import XCTest
@testable import iOSBenrinaAutomationHelpers

class SwipeHelpersTests: XCTestCase {
  func testSwipeUpVector() {
    let vector = SwipeDirection.up.vector
    XCTAssertEqual(vector.x, 0.0)
    XCTAssertEqual(vector.y, -1.0)
  }

  func testSwipeDownVector() {
    let vector = SwipeDirection.down.vector
    XCTAssertEqual(vector.x, 0.0)
    XCTAssertEqual(vector.y, 1.0)
  }

  func testSwipeLeftVector() {
    let vector = SwipeDirection.left.vector
    XCTAssertEqual(vector.x, -1.0)
    XCTAssertEqual(vector.y, 0.0)
  }

  func testSwipeRightVector() {
    let vector = SwipeDirection.right.vector
    XCTAssertEqual(vector.x, 1.0)
    XCTAssertEqual(vector.y, 0.0)
  }

  func testShortSwipeLength() {
    XCTAssertEqual(SwipeLength.short.multiplier, 100)
  }

  func testRegularSwipeLength() {
    XCTAssertEqual(SwipeLength.regular.multiplier, 300)
  }

  func testLongSwipeLength() {
    XCTAssertEqual(SwipeLength.long.multiplier, 500)
  }

  func testCustomSwipeLength() {
    XCTAssertEqual(SwipeLength.custom(42).multiplier, 42)
  }

  func testCalculateNormalisedVectorForSwipeLeft() {
    let direction = SwipeDirection .left
    let length = SwipeLength.regular
    let elementFrame = CGRect(x: 0, y: 0, width: 150, height: 150)
    do {
      let resultVector = try calculateNormalisedVectorForSwipe(expectedLengthInPixels: length, direction: direction, elementFrame: elementFrame)
      XCTAssertEqual(resultVector, CGVector(dx: -2.0, dy: 0.0))
    } catch {
      XCTFail()
    }
  }

  func testCalculateNormalisedVectorForSwipeDown() {
    let direction = SwipeDirection .down
    let length = SwipeLength.regular
    let elementFrame = CGRect(x: 0, y: 0, width: 150, height: 150)
    do {
      let resultVector = try calculateNormalisedVectorForSwipe(expectedLengthInPixels: length, direction: direction, elementFrame: elementFrame)
      XCTAssertEqual(resultVector, CGVector(dx: 0.0, dy: 2.0))
    } catch {
      XCTFail()
    }
  }

  func testCalculateNormalisedVectorForInvalidFrameWidth() {
    let direction = SwipeDirection .down
    let length = SwipeLength.regular
    let elementFrame = CGRect(x: 0, y: 0, width: 0, height: 150)
    XCTAssertThrowsError(try calculateNormalisedVectorForSwipe(expectedLengthInPixels: length, direction: direction, elementFrame: elementFrame))
  }

  func testCalculateNormalisedVectorForInvalidFrameHeight() {
    let direction = SwipeDirection .down
    let length = SwipeLength.regular
    let elementFrame = CGRect(x: 0, y: 0, width: 150, height: 0)
    XCTAssertThrowsError(try calculateNormalisedVectorForSwipe(expectedLengthInPixels: length, direction: direction, elementFrame: elementFrame))
  }
}
