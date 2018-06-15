//
//  NSPredicate+ElementPredicate.swift
//  iOSBenrinaAutomationHelpers
//
//  Created by Pavel Balint on 15/06/2018.
//  Copyright © 2018 Pavel Balint. All rights reserved.
//

extension NSPredicate {
  public convenience init(elementPredicates: [ElementPredicate]) {
    self.init(format: elementPredicates.format, argumentArray: elementPredicates.arguments)
  }
}
