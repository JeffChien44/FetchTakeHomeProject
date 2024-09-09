//
//  BaseViewModel.swift
//  FetchTakeHomeProject
//
//  Created by Jeff Chien on 9/6/24.
//

import Foundation

enum ViewState {
    case loading
    case finished
    case errorOccurred
    
    var isLoading: Bool { self == .loading }
    var isFinished: Bool { self == .finished }
    var isErrorOccured: Bool {
        get { self == .errorOccurred }
        set { self = newValue ? .errorOccurred : .finished }
    }
}

@MainActor
class BaseViewModel: ObservableObject {
    
    @Published private(set) var errorMessage = ""
    @Published var viewState: ViewState = .finished

    private(set) var networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager.shared) {
        self.networkManager = networkManager
    }
    
    func setErrorMessage(with error: Error) {
        viewState = .errorOccurred
        errorMessage = error.localizedDescription
    }
}
