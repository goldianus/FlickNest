//
//  TabView.swift
//  FlickNest
//
//  Created by Goldianus Solangius on 11/01/24.
//

import SwiftUI


enum TabItem: Int {
  case home, notification, download, profile
}


struct TabViewController: View {
  var body: some View {
    TabView {
      HomeScreen()
        .tabItem {
          Label("Home", systemImage: "house.circle.fill")
        }
      
      PopularView()
        .tabItem {
          Label("Notification", systemImage: "bell.circle.fill")
        }
      
      SplashView()
        .tabItem {
          Label("Download", systemImage: "arrow.down.circle.fill")
        }
      
      NotesView()
        .tabItem {
          Label("Profile", systemImage: "person.crop.circle")
        }
    }
    .accentColor(.primaryRed)
    .onAppear {
      let appearance = UITabBarAppearance()
      appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
      appearance.backgroundColor = UIColor(Color.primaryMain)
      appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.primaryRed]
      appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.lightGray]
      appearance.stackedLayoutAppearance.focused.titleTextAttributes = [.foregroundColor: UIColor.primaryRed]
      
      UITabBar.appearance().standardAppearance = appearance
      UITabBar.appearance().scrollEdgeAppearance = appearance
    }
  }
}


//#Preview {
//  TabView()
//}



struct NotesView:  View {
  var body: some View {
    Text("onboarding")
  }
}
