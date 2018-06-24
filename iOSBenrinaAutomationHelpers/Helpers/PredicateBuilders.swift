//
//  PredicateBuilders.swift
//  iOSBenrinaAutomationHelpers
//
//  Created by Pavel Balint on 12/06/2018.
//  Copyright © 2018 Pavel Balint. All rights reserved.
//

public enum ElementAttribute: Equatable {
  /** representing identifier or accessibilityIdentifier attribute of element */
  case identifier
  /** representing label attribute of element */
  case label
  /** representing title attribute of element */
  case title
  /** representing value attribute of element */
  case value
  /** representing placeholder value of element */
  case placeholderValue
  /** can represent any attribute attribute of element defined by user */
  case attribute(String)

  public var format: String {
    switch self {
    case .identifier: return "identifier"
    case .label: return "label"
    case .title: return "title"
    case .value: return "value"
    case .placeholderValue: return "placeholderValue"
    case .attribute(let customAttribute): return "\(customAttribute)"
    }
  }
}

public enum ElementPredicate {
  case and
  case or

  case isEnabled
  case isDisabled
  case exists
  case doesNotExist
  case isHittable
  case isNotHittable
  case isSelected
  case isNotSelected

  case contains(ElementAttribute, String)
  case doesNotContain(ElementAttribute, String)
  case equals(ElementAttribute, String)
  case doesNotEqual(ElementAttribute, String)
  case beginsWith(ElementAttribute, String)
  case doesNotBeginWith(ElementAttribute, String)
  case endsWith(ElementAttribute, String)
  case doesNotEndWith(ElementAttribute, String)
  case matchesWithRegex(ElementAttribute, String)
  case doesNotMatchWithRegex(ElementAttribute, String)
  case isOneOfTheValues(ElementAttribute, [String])
  case isNotOneOfTheValues(ElementAttribute, [String])

  public var format: String {
    switch self {
    case .and: return "AND"
    case .or: return "OR"

    case .isEnabled: return "enabled == true"
    case .isDisabled: return "NOT \(ElementPredicate.isEnabled.format)"
    case .exists: return "exists == true"
    case .doesNotExist: return "NOT \(ElementPredicate.exists.format)"
    case .isHittable: return "hittable == true"
    case .isNotHittable: return "NOT \(ElementPredicate.isHittable.format)"
    case .isSelected: return "selected == true"
    case .isNotSelected: return "NOT \(ElementPredicate.isSelected.format)"

    case .contains(let attribute, _): return "\(attribute.format) CONTAINS[cd] %@"
    case .doesNotContain(let attribute, let notContainingString): return "NOT \(ElementPredicate.contains(attribute, notContainingString).format)"
    case .equals(let attribute, _): return "\(attribute.format) ==[c] %@"
    case .doesNotEqual(let attribute, let attributeValue): return "NOT \(ElementPredicate.equals(attribute, attributeValue).format)"
    case .beginsWith(let attribute, _): return "\(attribute.format) BEGINSWITH[cd] %@"
    case .doesNotBeginWith(let attribute, let attributeValue): return "NOT \(ElementPredicate.beginsWith(attribute, attributeValue).format)"
    case .endsWith(let attribute, _): return "\(attribute.format) ENDSWITH[cd] %@"
    case .doesNotEndWith(let attribute, let attributeValue): return "NOT \(ElementPredicate.endsWith(attribute, attributeValue).format)"
    case .matchesWithRegex(let attribute, _): return "\(attribute.format) MATCHES %@"
    case .doesNotMatchWithRegex(let attribute, let regex): return "NOT \(ElementPredicate.matchesWithRegex(attribute, regex).format)"

    case .isOneOfTheValues(let attribute, let values): return "\(attribute.format) in { \(Array(repeating: "%@", count: values.count).joined(separator: ", ")) }"
    case .isNotOneOfTheValues(let attribute, let values): return "NOT \(ElementPredicate.isOneOfTheValues(attribute, values).format)"
    }
  }

  public var arguments: [Any]? {
    switch self {
    case .and: return nil
    case .or: return nil

    case .isEnabled: return nil
    case .isDisabled: return nil
    case .exists: return nil
    case .doesNotExist: return nil
    case .isHittable: return nil
    case .isNotHittable: return nil
    case .isSelected: return nil
    case .isNotSelected: return nil

    case .contains(_, let containingString): return [containingString]
    case .doesNotContain(_, let notContainingString): return [notContainingString]
    case .equals(_, let attributeValue): return [attributeValue]
    case .doesNotEqual(_, let attributeValue): return [attributeValue]
    case .beginsWith(_, let attributeValue): return [attributeValue]
    case .doesNotBeginWith(_, let attributeValue): return [attributeValue]
    case .endsWith(_, let attributeValue): return [attributeValue]
    case .doesNotEndWith(_, let attributeValue): return [attributeValue]
    case .matchesWithRegex(_, let regex): return [regex]
    case .doesNotMatchWithRegex(_, let regex): return [regex]

    case .isOneOfTheValues(_, let values): return values
    case .isNotOneOfTheValues(_, let values): return values
    }
  }
}

// MARK: - Helper for checking allowed ElementPredicates
/**
 Some element predicates will result in failure if they are used for querying for **XCUIElement** or **XCUIElementQuery** due to not conforming to XCUIElementAttributes protocol
 They can be used in waiter functions though
 - Parameter predicates: array of predicates that has to be checked for presence of .exists, .doesNotExist, .isHittable or .isNotHittable
*/
func checkAllowedElementPredicates(_ predicates: [ElementPredicate]) -> Bool {
  return predicates.contains(where: { elementPredicate in
    switch elementPredicate {
    case .exists, .doesNotExist, .isHittable, .isNotHittable:
      return true
    default:
      return false
    }
  })
}
