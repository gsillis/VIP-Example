//
//  IceCreamDataStore.swift
//  ScoopsAndScones
//
//  Created by Gabriela Sillis on 10/07/22.
//
import Foundation

final class IceCreamDataStore: ObservableObject {
    @Published var displayedCones: [String] = []
    @Published var displayedFlavors: [String] = []
    @Published var displayedToppings: [String] = []
}

#if DEBUG
private extension IceCreamDataStore {
    static var sampleData: IceCreamDataStore {
        let model = IceCreamDataStore()
        model.displayedCones = ["Sugar Cone", "Cake Cone"]
        model.displayedFlavors = ["Chocolate", "Strawberry"]
        model.displayedToppings = ["Hot Fudge", "Caramel"]
        return model
    }
}
#endif
