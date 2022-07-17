//
//  CreateIceCreamViewTests.swift
//  ScoopsAndSconesTests
//
//  Created by Gabriela Sillis on 15/07/22.
//

import XCTest
@testable import ScoopsAndScones

final class CreateIceCreamViewTests: XCTestCase {
    private var interactorSpy = InteractorSpy()
    private lazy var sut = makeSut(interactorSpy: interactorSpy)
    
    func testFetchIceCream_shouldCallLoadIceCream() {
        sut.fetchIceCream()
        XCTAssertTrue(interactorSpy.loadIceCreamCalled)
        XCTAssertEqual(interactorSpy.loadIceCreamCount, 1)
    }
    
    func testFetchIceCream_shouldCallLoadIceCream_withCorrectRequest() {
        let request = CreateIceCream.LoadIceCream.Request()
        sut.fetchIceCream()
        XCTAssertEqual(interactorSpy.request, request)
    }
}

extension CreateIceCreamViewTests {
    private func makeSut(interactorSpy: InteractorSpy) -> CreateIceCreamView {
        let iceCreamDataStore = IceCreamDataStore()
        let sut = CreateIceCreamView(iceCream: iceCreamDataStore, interactor: interactorSpy)
        return sut
    }
}
