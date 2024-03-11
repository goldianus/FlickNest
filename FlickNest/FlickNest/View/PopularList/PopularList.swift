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
        HStack(alignment: .top, spacing: 4) {
          ForEach(viewModel.arrMovieList, id: \.self.id) { movies in
            PopularCarouselView(popularData: movies)
          }
        }
        .padding(.leading, 16)
      }
      .refreshable{
        viewModel.getResetPageNTotalCount()
        viewModel.getMovieList(true)
      }
      .onAppear(perform: {
        viewModel.getMovieList(true)
      })
      .navigationTitle("Popular Movie")
    }
    .overlay{
      LoadingView(showProgress: $viewModel.isLoading)
    }
  }
}
