//
//  PopularListViewModel.swift
//  FlickNest
//
//  Created by Goldianus Solangius on 02/02/24.
//

import Foundation


protocol PopularListDisplayLogic: AnyObject {
  
}


class PopularListViewModel: ObservableObject {
  // MARK: - Public properties
  
  var interactor: PopularListBusinessLogic?
  
}
