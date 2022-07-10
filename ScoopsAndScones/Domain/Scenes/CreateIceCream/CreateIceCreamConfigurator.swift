//
//  CreateIceCreamConfigurator.swift
//  ScoopsAndScones
//
//  Created by Gabriela Sillis on 10/07/22.
//

import SwiftUI

extension CreateIceCreamView {
    func configureView() -> some View {
        var view = self
        let interactor = CreateIceCreamInteractor()
        let presenter = CreateIceCreamPresenter()
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
        return view
    }
}
