//
//  HomeBannerModel.swift
//  FlickNest
//
//  Created by Goldianus Solangius on 13/01/24.
//

import Foundation


struct HomeBannerModel: Identifiable, Hashable {
  var id = UUID()
  var image: String
}


let imageBanner: [HomeBannerModel] = [
  HomeBannerModel(image: "img-Adventure"),
  HomeBannerModel(image: "img-Cargo-Ben"),
  HomeBannerModel(image: "img-Collapse"),
  HomeBannerModel(image: "img-GLASS"),
  HomeBannerModel(image: "img-Graphic-Art"),
  HomeBannerModel(image: "img-Red-Notice"),
  HomeBannerModel(image: "img-Harry-Potter"),
  HomeBannerModel(image: "img-The-Queen's"),
  HomeBannerModel(image: "img-Watch")
]
