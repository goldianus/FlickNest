//
//  SplashView.swift
//  FlickNest
//
//  Created by Goldianus Solangius on 11/01/24.
//

import SwiftUI

struct SplashView: View {
  @State private var isLogoAnimated = false
  @State private var showMainView = false
  
  var body: some View {
    ZStack {
      Color.white
      if showMainView {
        
        let dataProvider = MovieListDataProvider()
        let viewModel = MovieListViewModel(dataProvider: dataProvider)
        MovieList(viewModel: viewModel)
      }
      
      Image("apple-fill")
        .scaleEffect(isLogoAnimated ? 1.5 : 1.0)
        .opacity(isLogoAnimated ? 0.0 : 1.0)
        .onAppear {
          withAnimation(.easeInOut(duration: 1.5)) {
            isLogoAnimated.toggle()
          }
          DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            showMainView = true
          }
        }
    }
    .edgesIgnoringSafeArea(.all)
  }
}

#Preview {
  SplashView()
}

