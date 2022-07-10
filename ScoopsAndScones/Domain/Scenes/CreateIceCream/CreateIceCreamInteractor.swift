//
//  CreateIceCreamInteractor.swift
//  ScoopsAndScones
//
//  Created by Gabriela Sillis on 10/07/22.
//

import Foundation

protocol CreateIceCreamBussinesLogic {
    func loadIceCream(request: CreateIceCream.LoadIceCream.Request)
}

final class CreateIceCreamInteractor: CreateIceCreamBussinesLogic {
    var presenter: CreateIceCreamPresentationLogic?
    
    func loadIceCream(request: CreateIceCream.LoadIceCream.Request) {
        let iceCream = Bundle.main.decode(IceCream.self, from: "icecream.json")
        let response = CreateIceCream.LoadIceCream.Response(iceCreamData: iceCream)
        presenter?.presentIceCream(response: response)
    }
}
