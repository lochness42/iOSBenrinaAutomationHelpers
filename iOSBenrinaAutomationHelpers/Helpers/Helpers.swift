//
//  Helpers.swift
//  iOSBenrinaAutomationHelpers
//
//  Created by Pavel Balint on 15/06/2018.
//  Copyright © 2018 Pavel Balint. All rights reserved.
//

fileprivate var _defaultTimeout: TimeInterval = 2

public var defaultTimeout: TimeInterval {
  get {
    return _defaultTimeout
  }
  set {
    _defaultTimeout = newValue
  }
}

fileprivate var _defaultSwipeLength: SwipeLength = .regular

public var defaultSwipeLength: SwipeLength {
  get {
    return _defaultSwipeLength
  }
  set {
    _defaultSwipeLength = newValue
  }
}
