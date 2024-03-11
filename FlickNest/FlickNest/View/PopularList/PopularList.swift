//
//  PopularList.swift
//  FlickNest
//
//  Created by Goldianus Solangius on 11/03/24.
//

import SwiftUI

struct PopularList: View {
  // MARK: - Properties
  @StateObject private var viewModel: MovieListViewModel
  
  init(viewModel: MovieListViewModel) {
    _viewModel = StateObject(wrappedValue: viewModel)
  }
  
  var body: some View {
    NavigationStack{
      ScrollView(.horizontal, showsIndicators: false) {
        ForEach(viewModel.arrMovieList, id: \.id) { movies in
          PopularCarouselView(popularData: movies)
          if viewModel.pageCount <= viewModel.totalPages {
            ProgressView(label: {
              Text("Loading")
            }).progressViewStyle(.circular)
              .tint(.gray)
              .onAppear(perform: {
                viewModel.getPopularList()
              })
          }
        }
      }
      .refreshable{
        viewModel.getResetPageNTotalCount()
        viewModel.getPopularList()
      }
      .onAppear(perform: {
        viewModel.getPopularList()
      })
      .navigationTitle("Popular Movie")
    }
    .overlay{
      LoadingView(showProgress: $viewModel.isLoading)
    }
  }
}
