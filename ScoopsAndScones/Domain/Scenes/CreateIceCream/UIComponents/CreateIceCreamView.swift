//
//  CreateIceCreamView.swift
//  ScoopsAndScones
//
//  Created by Gabriela Sillis on 10/07/22.
//

import SwiftUI

protocol CreateIceCreamDisplayLogic {
    func displayIceCream(viewModel: CreateIceCream.LoadIceCream.ViewModel)
}

struct CreateIceCreamView: View {
    @ObservedObject var iceCream = IceCreamDataStore()
    @State private var selectedCone = ""
    @State private var selectedFlavor = ""
    @State private var selectedTopping = ""
    @State private var showDoneAlert = false
    var interactor: CreateIceCreamBussinesLogic?
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Picker("Select a cone or cup", selection: $selectedCone) {
                        ForEach(iceCream.displayedCones, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("Choose your flavor", selection: $selectedFlavor) {
                        ForEach(iceCream.displayedFlavors, id: \.self) {
                            Text($0)
                        }
                    }
                    .disabled(selectedCone.isEmpty)
                    Picker("Choose a topping", selection: $selectedTopping) {
                        ForEach(iceCream.displayedToppings, id: \.self) {
                            Text($0)
                        }
                    }
                    .disabled(selectedCone.isEmpty || selectedFlavor.isEmpty)
                } header: {
                    
                }
                Section {
                    Button {
                        showDoneAlert = true
                    } label: {
                        Text("Done")
                            .font(.title3)
                            .frame(
                                maxHeight: .infinity,
                                alignment: .center
                            )
                    }
                    .disabled(showIceCreamImage())
                    .alert(isPresented: $showDoneAlert) {
                        Alert(
                            title: Text("Your ice cream is ready!"),
                            message: Text("Let's make a new one. You can never have too much ice cream..."),
                            dismissButton: .default(Text("OK")) {
                                selectedCone = ""
                                selectedFlavor = ""
                                selectedTopping = ""
                            })
                    }
                }
                Section {
                    CreateIceCreamImageView(
                        selectedCone: $selectedCone,
                        selectedFlavor: $selectedFlavor,
                        selectedTopping: $selectedTopping
                    )
                }
            }
            .navigationTitle("Scoops&Scones")
            .onAppear() {
                fetchIceCream()
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct CreateIceCreamView_Previews: PreviewProvider {
    static var previews: some View {
        CreateIceCreamView(iceCream: IceCreamDataStore())
    }
}

private extension CreateIceCreamView {
    func fetchIceCream() {
      let request = CreateIceCream.LoadIceCream.Request()
      interactor?.loadIceCream(request: request)
    }
    
    func showIceCreamImage() -> Bool {
        if selectedCone.isEmpty || selectedFlavor.isEmpty || selectedTopping.isEmpty {
            return true
        }
        return false
    }
}

extension CreateIceCreamView: CreateIceCreamDisplayLogic {
    func displayIceCream(viewModel: CreateIceCream.LoadIceCream.ViewModel) {
        iceCream.displayedCones = viewModel.cones
        iceCream.displayedFlavors = viewModel.flavors
        iceCream.displayedToppings = viewModel.toppings
    }
}
