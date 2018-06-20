//
//  Array+ElementPredicate.swift
//  iOSBenrinaAutomationHelpers
//
//  Created by Pavel Balint on 15/06/2018.
//  Copyright © 2018 Pavel Balint. All rights reserved.
//

// Extension of Array to be able to prepare parameters for NSPredicate
extension Array where Element == ElementPredicate {
  internal var format: String {
    var formatString = ""
    self.forEach { formatString += "\($0.format) " }
    return formatString.trimmingCharacters(in: NSCharacterSet.whitespaces)
  }
  
  internal var arguments: [Any]? {
    var argumentList: [Any] = []
    
    self.forEach { match in
      if let argumentsInMatch = match.arguments {
        argumentList.append(contentsOf: argumentsInMatch)
      }
    }
    return argumentList.count > 0 ? argumentList : nil
  }
}
