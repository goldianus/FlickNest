//
//  MovieListCell.swift
//  FlickNest
//
//  Created by Goldianus Solangius on 11/01/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieListCell: View {
  var moviesData: ResultDataProvider
  var body: some View {
    HStack(alignment: .center) {
      HStack(spacing: 10) {
        MovieImageView()
        MovieDetailsView()
      }.padding(.all, 15)
    }
    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
    .background(.white)
    .cornerRadius(10)
    .shadow(radius: 5)
    .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
  }
  
  @ViewBuilder
  func MovieImageView() -> some View {
    let imgUrl = URL(string: "\(imagePath)" + "\(moviesData.posterPath )")
    CustomSDWebImageView(imgURL: imgUrl, 
                         imgWidth: 80,
                         imgHeight: 80,
                         placeholderImage: "StringConstants.placeholderImageFilm",
                         isCircle: false)
  }
  
  @ViewBuilder
  func MovieDetailsView() -> some View {
    VStack(alignment: .leading, spacing: 05) {
      Text("\(moviesData.title )").fontWeight(.semibold).lineLimit(1)
        .foregroundColor(.black)
      HStack {
        Image(systemName: "StringConstants.placeholderImageCalender")
        let releaseDate = DateFormatter.convertDateString(moviesData.releaseDate )
        Text(releaseDate)
      }
      .font(.caption)
      .foregroundColor(.gray)
      
      HStack {
        Image(systemName: "StringConstants.placeholderImageThumbsUp")
        Text("\(moviesData.voteCount )" + " | Rate: " + String(format: "%0.1f", (moviesData.voteAverage )) + "/10")
      }
      .font(.caption)
      .foregroundColor(.gray)
    }
  }
  
}

//#Preview {
//  MovieListCell(moviesData: <#ResultDataProvider#>)
//}



extension DateFormatter {
  
  static func convertDateString(_ dateString: String) -> String {
    let inputFormatter = DateFormatter()
    inputFormatter.dateFormat = "yyyy-MM-dd"
    
    let outputFormatter = DateFormatter()
    outputFormatter.dateFormat = "dd MMM, yyyy"
    
    if let date = inputFormatter.date(from: dateString) {
      return outputFormatter.string(from: date)
    } else {
      return ""
    }
  }
}
