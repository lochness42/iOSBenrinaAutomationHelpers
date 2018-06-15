//
//  Helpers.swift
//  iOSBenrinaAutomationHelpers
//
//  Created by Pavel Balint on 15/06/2018.
//  Copyright © 2018 Pavel Balint. All rights reserved.
//

fileprivate var _timeout: TimeInterval = 2

public var timeout: TimeInterval {
  get {
    return _timeout
  }
  set {
    _timeout = newValue
  }
}
