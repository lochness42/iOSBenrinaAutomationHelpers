//
//  XCUIElement+Elements.swift
//  iOSBenrinaAutomationHelpers
//
//  Created by Pavel Balint on 13/06/2018.
//  Copyright © 2018 Pavel Balint. All rights reserved.
//

import XCTest
import Foundation

extension XCUIElement {

  /**
   Returns descendants of element satisfying the element predicates for chosen element type
   - Warning: Element predicates .exists, .doesNotExist, .isHittable and .isNotHittable are not allowed in this function

   ## Usage Example: ##
   ````
   XCUIApplication().descendants(ofType: .any, which: [.contains(.identifier, "test"), .and, .doesNotEndWith(.label, "endsWith")]
   ````

   - Parameter elementType: descendants' element type
   - Parameter predicates: array of predicates [ElementPredicate] that descendants should fulfil.

   - Returns: resulting XCUIElementQuery
   */
  public func descendants(ofType elementType: ElementType, which predicates: [ElementPredicate]) -> XCUIElementQuery {
    return self.descendants(matching: elementType).matching(predicates)
  }

  /**
   Returns children of element satisfying the element predicates for chosen element type
   - Warning: Element predicates .exists, .doesNotExist, .isHittable and .isNotHittable are not allowed in this function

   ## Usage Example: ##
   ````
   XCUIApplication().children(ofType: .any, which: [.contains(.identifier, "test"), .and, .doesNotEndWith(.label, "endsWith")]
   ````

   - Parameter elementType: descendants' element type
   - Parameter predicates: array of predicates [ElementPredicate] that descendants should fulfil

   - Returns: resulting XCUIElementQuery
   */
  public func children(ofType elementType: ElementType, which predicates: [ElementPredicate]) -> XCUIElementQuery {
    return self.children(matching: elementType).matching(predicates)
  }

  /**
   Waits for element to satisfy element predicates within time limit.
   - Note: Doesn't fail if time limit has been exceeded, just returns False.
   ## Usage Example: ##
   ````
   XCUIApplication().wait(until: [.hittable, .or, .contains(.identifier, "test"), atMostFor: 2]
   ````
   - Parameter elementPredicates: array of predicates that element should fulfil
   - Parameter timeout: (optional)
   - Parameter xctWaiter: (for testing purposes)

   - Returns: True if element predicates were satisfied witin time limit for chosen element
   */
  public func wait(until elementPredicates: [ElementPredicate], atMostFor timeout: TimeInterval = timeout, xctWaiter: XCTWaiter = XCTWaiter()) -> Bool {
    let predicate = NSPredicate(elementPredicates: elementPredicates)
    return XCTContext.runActivity(named: "Checking for element fulfil predicate \"\(predicate.predicateFormat)\"\nwithin \(timeout)s\nfor \(self.description)") { _ -> Bool in
      let expectation = XCTNSPredicateExpectation(predicate: predicate, object: self)
      let result = xctWaiter.wait(for: [expectation], timeout: timeout)
      return result == .completed
    }
  }

  /**
   Toggle action for **switch** elements only
   - Remark: does nothing if **XCUIElement** is not of type **Switch**

   - Returns: True if element value changed after tapping on it
   */
  public func toggle() -> Bool {
    if self.elementType == .switch {
      let initialValue = self.value as! String
      self.tap()
      return self.wait(until: [.doesNotEqual(.value, initialValue)], atMostFor: 1)
    } else {
      return false
    }
  }

  // MARK: - Repeated swipe functions
  public func swipeDown(repeats times: Int = 2) {
    for _ in 0 ..< times {
      self.swipeDown()
    }
  }

  public func swipeUp(repeats times: Int = 2) {
    for _ in 0 ..< times {
      self.swipeUp()
    }
  }

  public func swipeLeft(repeats times: Int = 2) {
    for _ in 0 ..< times {
      self.swipeLeft()
    }
  }

  public func swipeRight(repeats times: Int = 2) {
    for _ in 0 ..< times {
      self.swipeRight()
    }
  }

  /**
   Swipes on current element until referenced element becomes hittable
   - Note: Doesn't fail if time limit has been exceeded, just returns False.
   ## Usage Example: ##
   ````
   XCUIApplication().swipeUntilAnother(becomesHittable: XCUIApplication().button["testElement"], direction: .up, length: .regular, maximumRepeats: 3)
   ````
   - Parameter element: element that we expect to become hittable
   - Parameter direction: direction of the swipe
   - Parameter length: length of the swipe
   - Parameter maximumRepeats: number of swipes attempted to get target element hittable
   - Parameter xctWaiter: (for testing purposes)

   - Returns: True if element became hittable after swiping
   */
  public func swipeUntilAnotherElement(becomesHittable element: XCUIElement, direction: SwipeDirection = .up, length: SwipeLength = .regular, maximumRepeats: Int = 3,
                                       xctWaiter: XCTWaiter = XCTWaiter()) -> Bool {
    return XCTContext.runActivity(named: "User swipes until element is hittable in \(direction) direction maximum of \(times)x with swipe length \(length) for hittable element \(element.description) on \(self.description)") {_ -> Bool in
      XCTAssert(self.exists)
      do {
        let swipeVector = try calculateNormalisedVectorForSwipe(expectedLengthInPixels: length, direction: direction, elementFrame: self.frame)
        let centerPointVector: CGVector = CGVector(dx: 0.5, dy: 0.5)
        let endPointVector: CGVector = CGVector(dx: centerPointVector.dx + swipeVector.dx, dy: centerPointVector.dy + swipeVector.dy)
        for _ in 0 ..< maximumRepeats {
          if self.wait(until: [.exists], atMostFor: 1) {
            if (element.exists && element.isHittable) {
              break
            }
            self.coordinate(withNormalizedOffset: centerPointVector).press(forDuration: 0.1, thenDragTo: self.coordinate(withNormalizedOffset: endPointVector))
          }
        }
      } catch {
        XCTFail("Invalid frame to swipe on")
      }
      return element.wait(until: [.isHittable], atMostFor: 1, xctWaiter: xctWaiter)
    }
  }

  /**
   Clears text field if element type is **textField**, **textView** or **secureTextField**.
   *Tries to tap on element if it's not selected yet.*
   - Note: Doesn't fail if element type isn't **textField**, **textView** or **secureTextField**, but does nothing as a result
   ## Usage Example: ##
   ````
   XCUIApplication().textField.element.clear()
   ````
   */
  func clear() {
    if self.elementType == .textField || self.elementType == .textView || self.elementType == .secureTextField {
      if let hasKeyboardFocus = self.value(forKey: "hasKeyboardFocus") as? Bool, !hasKeyboardFocus {
        tap()
      }

      guard let stringValue = self.value as? String else {
        XCTFail("Tried to clear value of a non string value element")
        return
      }

      let deleteString = (0..<stringValue.count).map { _ in XCUIKeyboardKey.delete.rawValue }.joined(separator: "")
      self.typeText(deleteString)
    }
  }

  /**
   Clears text field if element type is **textField**, **textView** or **secureTextField** and then types in the chosen text.
   *Tries to tap on element if it's not selected yet.*
   - Note: Doesn't fail if element type isn't **textField**, **textView** or **secureTextField**, but does nothing as a result
   - Note: Does nothing if element already has chosen text as it's value
   ## Usage Example: ##
   ````
   XCUIApplication().textField.element.clearAndEnter(text: "test")
   ````
   */
  public func clearAndEnter(text: String) {
    if self.elementType == .textField || self.elementType == .textView || self.elementType == .secureTextField {
      guard let elementText = self.value as? String else {
        XCTFail("Tried to clear and enter text into a non string value element")
        return
      }
      if elementText != text {
        self.clear()
        self.typeText(text)
      }
    }
  }
}

