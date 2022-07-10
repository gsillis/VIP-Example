//
//  IceCream.swift
//  ScoopsAndScones
//
//  Created by Gabriela Sillis on 10/07/22.
//

struct IceCream: Decodable, Equatable {
    let cones: [String]
    let flavors: [String]
    let toppings: [String]
}
