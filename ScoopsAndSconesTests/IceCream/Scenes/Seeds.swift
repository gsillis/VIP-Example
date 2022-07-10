//
//  Seeds.swift
//  ScoopsAndSconesTests
//
//  Created by Gabriela Sillis on 10/07/22.
//

import XCTest
@testable import ScoopsAndScones

enum Seeds {
  static let iceCream = IceCream(
    cones: ["Sugar Cone", "Cake Cone", "Waffle Cone", "Cup"],
    flavors: ["Chocolate", "Strawberry", "Vanilla", "Pistachio", "Hazelnut"],
    toppings: ["Hot Fudge", "Sprinkles", "Mystery Sauce", "Chocolate Chips"]
  )
}
