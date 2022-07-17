//
//  InteractorSpy.swift
//  ScoopsAndSconesTests
//
//  Created by Gabriela Sillis on 17/07/22.
//

@testable import ScoopsAndScones

final class InteractorSpy: CreateIceCreamBussinesLogic {
    private(set) var request:  CreateIceCream.LoadIceCream.Request?
    private(set) var loadIceCreamCount = 0
    private(set) var loadIceCreamCalled = false
    
    func loadIceCream(request:  CreateIceCream.LoadIceCream.Request) {
        self.request = request
        loadIceCreamCount += 1
        loadIceCreamCalled = true
    }
}
