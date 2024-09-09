//
//  MealListViewModelTests.swift
//  FetchTakeHomeProjectTests
//
//  Created by Jeff Chien on 9/8/24.
//

import XCTest
@testable import FetchTakeHomeProject

final class MealListViewModelTests: XCTestCase {

    private var networkManagerMock: NetworkManagerProtocol!
    private var viewModel: MealListViewModel!
    
    @MainActor
    override func setUp() {
        super.setUp()
        networkManagerMock = NetworkManagerMock()
        viewModel = MealListViewModel(networkManager: networkManagerMock)
    }

    override func tearDown() {
        networkManagerMock = nil
        viewModel = nil
        super.tearDown()
    }
        
    @MainActor
    func test_GetMealList_Succuss() async throws {
        await viewModel.getMealList()
        XCTAssertTrue(viewModel.viewState.isFinished)
        XCTAssertEqual(viewModel.meals.count, 1)
    }
    
    @MainActor
    func test_GetMealList_Failure() async throws {
        (networkManagerMock as! NetworkManagerMock).hasError = true
        viewModel = MealListViewModel(networkManager: networkManagerMock)
        await viewModel.getMealList()
        XCTAssertTrue(viewModel.viewState.isErrorOccured)
        XCTAssertEqual(viewModel.meals.count, 0)
    }
}
