//
//  MealDetailViewModelTests.swift
//  FetchTakeHomeProjectTests
//
//  Created by Jeff Chien on 9/8/24.
//

import XCTest
@testable import FetchTakeHomeProject

final class MealDetailViewModelTests: XCTestCase {

    private var networkManagerMock: NetworkManagerProtocol!
    private var viewModel: MealDetailViewModel!
    
    @MainActor
    override func setUp() {
        super.setUp()
        networkManagerMock = NetworkManagerMock()
        viewModel = MealDetailViewModel(networkManager: networkManagerMock)
    }

    override func tearDown() {
        networkManagerMock = nil
        viewModel = nil
        super.tearDown()
    }
    
    @MainActor
    func test_GetPokemonDetail_Succuss() async throws {
        await viewModel.getMealDetail(by: "123")
        XCTAssertTrue(viewModel.viewState.isFinished)
        XCTAssertEqual(viewModel.mealDetail?.id, "123")
        XCTAssertEqual(viewModel.mealDetail?.name, "test")
        XCTAssertEqual(viewModel.mealDetail?.category, "desert")
        XCTAssertEqual(viewModel.mealDetail?.instructions, "one two three four five")
        XCTAssertEqual(viewModel.mealDetail?.thumb, "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")
        XCTAssertEqual(viewModel.mealDetail?.area, "USA")
    }
    
    @MainActor
    func test_GetPokemonDetail_Failure() async throws {
        (networkManagerMock as! NetworkManagerMock).hasError = true
        viewModel = MealDetailViewModel(networkManager: networkManagerMock)
        await viewModel.getMealDetail(by: "123")
        XCTAssertTrue(viewModel.viewState.isErrorOccured)
        XCTAssertNil(viewModel.mealDetail)
    }

}
