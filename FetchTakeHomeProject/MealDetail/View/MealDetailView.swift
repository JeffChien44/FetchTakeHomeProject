//
//  MealDetailView.swift
//  FetchTakeHomeProject
//
//  Created by Jeff Chien on 9/6/24.
//

import SwiftUI

struct MealDetailView: View {
    @StateObject private var viewModel = MealDetailViewModel()
    var mealId: String
    
    var body: some View {
        NavigationStack {
            if let mealDetail = viewModel.mealDetail {
                List {
                    InformationView(mealDetail: mealDetail)
                    IngredientView(mealDetail: mealDetail)
                }
                .navigationTitle(mealDetail.name)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .task {            
            await viewModel.getMealDetail(by: mealId)
        }
        .alert("Error Occurs", isPresented: $viewModel.viewState.isErrorOccured) {
            Button("ok", role: .cancel) { }
        } message: {
            Text(viewModel.errorMessage)
        }
    }
}

struct InformationView: View {
    private var mealDetail: MealDetail
    
    var body: some View {
        Section {
            Text("Category: \(mealDetail.category)")
            Text("Area: \(mealDetail.area)")
            Text("Instructions: \(mealDetail.instructions)")
            if let drinkAlternate = mealDetail.drinkAlternate {
                Text("Drink Alternate: \(drinkAlternate)")
            }
            if let tags = mealDetail.tags {
                Text("Tags: \(tags)")
            }
            if let youtube = mealDetail.youtube,
               let url = URL(string: youtube) {
                Link("Youtube", destination: url)
            }
            if let source = mealDetail.source,
               let url = URL(string: source){
                Link("Source", destination: url)
            }
        } header: {
            let urlString = mealDetail.imageSource ?? mealDetail.thumb
            AsyncImage(url: URL(string: urlString)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Rectangle()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                    .foregroundColor(.gray)
                    .opacity(0.3)
            }
        }
        .formStyle(.columns)
    }
    
    init(mealDetail: MealDetail) {
        self.mealDetail = mealDetail
    }
}

struct IngredientView: View {
    private var mealDetail: MealDetail
    
    var body: some View {
        Section {
            ForEach(mealDetail.ingredients, id: \.name) { ingredient in
                HStack(alignment: .top) {
                    Text(ingredient.name)
                    Spacer()
                    Text(ingredient.measure)
                }
            }
        } header: {
            Text("Ingredients")
                .font(.title)
        }
        .formStyle(.columns)
    }
    
    init(mealDetail: MealDetail) {
        self.mealDetail = mealDetail
    }
}

#Preview {
    MealDetailView(mealId: "53049")
}
