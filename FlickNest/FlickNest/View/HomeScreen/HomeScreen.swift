//
//  HomeScreen.swift
//  FlickNest
//
//  Created by Goldianus Solangius on 13/01/24.
//

import SwiftUI

struct HomeScreen: View {
  
  var body: some View {
    NavigationView {
      ZStack {
        
        VStack {
          ScrollView {
            MainBanner()
              .frame(width: UIScreen.main.bounds.width, height: 350)
              
            VStack(spacing: 4.0) {
              MovieCarouselView(title: "Popular Movies", btnSeeAll: "See All")
                .padding(.top, 10)
              MovieCarouselView(title: "Now Playing", btnSeeAll: "See All")
              MovieCarouselView(title: "Coming Soon", btnSeeAll: "See All")
            }
          }
        }
      }
      .background(Color.primaryMain.edgesIgnoringSafeArea(.all))
      .edgesIgnoringSafeArea(.all)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          
          VStack(alignment: .center, spacing: 10) {
            Button {
              print("Action")
            } label: {
              Image(systemName: "magnifyingglass")
                .padding()
                .frame(width: 40, height: 40)
                .foregroundColor(.white)
                .background(Color.primaryBlue.opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .circular))
            }
          }
        }
      }
    }
  }
  
}

#Preview {
  HomeScreen()
}
