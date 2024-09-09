//
//  MealListView.swift
//  FetchTakeHomeProject
//
//  Created by Jeff Chien on 9/5/24.
//

import SwiftUI

struct MealListView: View {
    @StateObject private var viewModel = MealListViewModel()
    
    var body: some View {
        NavigationStack {            
            List(viewModel.meals, id: \.id) { meal in
                HStack {
                    AsyncImage(url: URL(string: meal.thumb)) { image in
                        image
                            .resizable()
                            .frame(width: 100, height: 100)
                    } placeholder: {
                        Rectangle()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                            .foregroundColor(.gray)
                            .opacity(0.3)
                    }
                    NavigationLink {
                        MealDetailView(mealId: meal.id)
                    } label: {
                        Text(meal.name)
                            .font(.title2)
                            .padding()
                    }
                }
            }
            .listStyle(.plain)
            .overlay {
                if viewModel.viewState.isLoading {
                    ProgressView()
                }
            }
            .task {
                await viewModel.getMealList()
            }
            .refreshable {
                await viewModel.getMealList()
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Desserts")
                        .font(.title)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("", systemImage: "arrow.clockwise") {
                        Task {
                            await viewModel.getMealList()
                        }
                    }
                }
            }
            .toolbarBackground(.visible, for: .navigationBar)
        }
        .alert("Error Occurs", isPresented: $viewModel.viewState.isErrorOccured) {
            Button("ok", role: .cancel) { }
        } message: {
            Text(viewModel.errorMessage)
        }
    }
}

#Preview {
    MealListView()
}
