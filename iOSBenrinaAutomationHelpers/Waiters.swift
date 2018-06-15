//
//  Waiters.swift
//  iOSBenrinaAutomationHelpers
//
//  Created by Pavel Balint on 13/06/2018.
//  Copyright © 2018 Pavel Balint. All rights reserved.
//

import XCTest

/**
 Wait function that returns true/false depending whether element satisfied predicates within time limit

 @param element that we're checking and array of predicates, timeout is optional

 @return boolean depending whether predicates got satisfied within time limit
 */

public func Wait(forElement element: XCUIElement, thatShould elementPredicates: [ElementPredicate], atMost timeout: TimeInterval = timeout, xctWaiter: XCTWaiter = XCTWaiter()) -> Bool {
    return element.wait(until: elementPredicates, atMost: timeout, xctWaiter: xctWaiter)
}

/**
 Wait function that fails depending whether element satisfied predicates within time limit
 
 @param element that we're checking and array of predicates, timeout is optional
 
 @return fails if predicates didn't get satisfied within time limit
 */
public func Wait(forElement element: XCUIElement, to elementPredicates: [ElementPredicate], atMost timeout: TimeInterval = timeout, xctWaiter: XCTWaiter = XCTWaiter(), file: StaticString = #file, line: UInt = #line) {
  XCTAssertTrue(element.wait(until: elementPredicates, atMost: timeout, xctWaiter: xctWaiter),
                "Waiting for element to fulfil \(NSPredicate(elementPredicates: elementPredicates).predicateFormat) within \(timeout)s failed for \(element.debugDescription)",
                file: #file, line: #line)
}
