//
//  BaseViewModelTests.swift
//  FetchTakeHomeProjectTests
//
//  Created by Jeff Chien on 9/8/24.
//

import XCTest
@testable import FetchTakeHomeProject

final class BaseViewModelTests: XCTestCase {

    private var networkManagerMock: NetworkManagerProtocol!
    private var viewModel: BaseViewModel!
    
    @MainActor
    override func setUp() {
        super.setUp()
        networkManagerMock = NetworkManagerMock()
        viewModel = BaseViewModel(networkManager: networkManagerMock)
    }

    override func tearDown() {
        networkManagerMock = nil
        viewModel = nil
        super.tearDown()
    }
    
    @MainActor
    func test_SetErrorMessage() {
        viewModel.setErrorMessage(with: URLError(.badServerResponse))
        XCTAssertNotEqual(viewModel.errorMessage, "")
        XCTAssertTrue(viewModel.viewState.isErrorOccured)
    }
}
