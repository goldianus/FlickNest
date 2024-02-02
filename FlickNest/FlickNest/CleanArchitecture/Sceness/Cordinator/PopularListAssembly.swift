//
//  PopularListAssembly.swift
//  FlickNest
//
//  Created by Goldianus Solangius on 02/02/24.
//

import Foundation
import SwiftUI

class PopularListAssembly {
  static let shared = PopularListAssembly()
  
  func build() -> some View {
    let service = ApiServiceImpl()
    let repository = PopularListRepositoryImpl()
    let interactor = PopularListInteractor()
    let viewModel = PopularListViewModel()
    let presenter = PopularListPresenter()
    
    viewModel.interactor = interactor
    interactor.presenter = presenter
    presenter.viewModel = (viewModel as! any PopularListDisplayLogic)
    
    return PopularListView(viewModel: viewModel)
  }
  
}
