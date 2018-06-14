//
//  XCUIElement+Elements.swift
//  iOSBenrinaAutomationHelpers
//
//  Created by Pavel Balint on 13/06/2018.
//  Copyright © 2018 Pavel Balint. All rights reserved.
//

import Foundation
import XCTest

extension XCUIElement {
    public func elements(ofType elementType: ElementType, which predicate: [ElementPredicate]) -> XCUIElementQuery {
        return self.descendants(matching: elementType).matching(NSPredicate(elementPredicates: predicate))
    }
}
