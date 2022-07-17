//
//  CreateIceCreamModel.swift
//  ScoopsAndScones
//
//  Created by Gabriela Sillis on 10/07/22.
//

import Foundation

enum CreateIceCream {
  enum LoadIceCream {
      struct Request: Equatable {}

    struct Response {
      var iceCreamData: IceCream
    }

    struct ViewModel {
      var cones: [String]
      var flavors: [String]
      var toppings: [String]
    }
  }
}
