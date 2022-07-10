//
//  CreateIceCreamPresenter.swift
//  ScoopsAndScones
//
//  Created by Gabriela Sillis on 10/07/22.
//

import Foundation

protocol CreateIceCreamPresentationLogic {
    func presentIceCream(response: CreateIceCream.LoadIceCream.Response)
}

final class CreateIceCreamPresenter: CreateIceCreamPresentationLogic {
    var view: CreateIceCreamDisplayLogic?
    
    func presentIceCream(response: CreateIceCream.LoadIceCream.Response) {
        let viewModel = CreateIceCream.LoadIceCream.ViewModel(
            cones: response.iceCreamData.cones,
            flavors: response.iceCreamData.flavors,
            toppings: response.iceCreamData.toppings
        )
        view?.displayIceCream(viewModel: viewModel)
    }
}
