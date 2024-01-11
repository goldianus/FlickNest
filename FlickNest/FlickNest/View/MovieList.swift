//
//  MovieList.swift
//  FlickNest
//
//  Created by Goldianus Solangius on 11/01/24.
//

import SwiftUI


struct MovieList: View {
  // MARK: - Properties
  @StateObject private var viewModel: MovieListViewModel
  @State private var gridVLayout : [GridItem] = [GridItem()]
  
  init(viewModel: MovieListViewModel) {
    _viewModel = StateObject(wrappedValue: viewModel)
  }
  
  var body: some View {
    NavigationStack{
      ScrollView(.vertical, showsIndicators: false) {
        LazyVGrid(columns: gridVLayout) {
          ForEach(viewModel.arrMovieList, id: \.id) { movies in
            MovieListCell(moviesData: movies)
            if movies.id == viewModel.arrMovieList.last?.id {
              if viewModel.pageCount <= viewModel.totalPages {
                ProgressView(label: {
                  Text("Loading")
                }).progressViewStyle(.circular)
                  .tint(.gray)
                  .onAppear(perform: {
                    viewModel.getMovieList(false)
                  })
              }
            }
          }
        }
        .padding(.all, 10)
      }
      .refreshable{
        
        viewModel.getResetPageNTotalCount()
        viewModel.getMovieList(true)
      }
      .onAppear(perform: {
        
        viewModel.getMovieList(true)
      })
      .navigationTitle("Movie List")
    }
    .overlay{
      LoadingView(showProgress: $viewModel.isLoading)
    }
  }
}
