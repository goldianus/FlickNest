//
//  MainBanner.swift
//  FlickNest
//
//  Created by Goldianus Solangius on 13/01/24.
//

import SwiftUI

struct MainBanner: View {
  @State var index = 0
  var dataImage = imageBanner
  
  fileprivate func ImageSlide() -> some View {
    return PagingView(index: $index.animation(), maxIndex: self.dataImage.count - 1) {
      ForEach(self.dataImage, id:\.self) { image in
        Image(image.image)
          .resizable()
          .scaledToFill()
      }
    }
  }
    var body: some View {
      NavigationView {
        VStack {
          ImageSlide()
            .onAppear {
              startTimer()
            }
        }
      }
    }
  
  // MARK: - Helper
  func startTimer() {
    let timer = Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { timer in
      withAnimation {
        if self.index < self.dataImage.count - 1 {
          self.index += 1
        } else {
          self.index = 0
        }
      }
    }
    
    RunLoop.current.add(timer, forMode: .common)
  }
}


#Preview {
    MainBanner()
}
