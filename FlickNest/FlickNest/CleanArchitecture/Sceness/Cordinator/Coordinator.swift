//
//  Coordinator.swift
//  FlickNest
//
//  Created by Goldianus Solangius on 02/02/24.
//

import Foundation
import SwiftUI


enum Page: Hashable {
    case popular
}

final class Coordinator: ObservableObject {
  @Published var path = NavigationPath()
  func push(page: Page) {
      path.append(page)
  }
  
  @ViewBuilder
  func build(page: Page) -> some View {
    switch page {
    case .popular:
      PopularListAssembly.shared.build()
    }
  }
}
