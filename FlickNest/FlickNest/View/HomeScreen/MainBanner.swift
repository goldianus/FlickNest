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
  let backgroundColor = Color(hex: 0x27374C)
  
  fileprivate func ImageSlide() -> some View {
    return PagingView(index: $index.animation(), maxIndex: self.dataImage.count - 1) {
      ForEach(self.dataImage, id:\.self) { image in
        Image(image.image)
          .resizable()
          .scaledToFill()
          .gradientForeground(colors: [
            backgroundColor.opacity(0.1),
            backgroundColor.opacity(0.2),
            backgroundColor.opacity(0.3),
            backgroundColor.opacity(0.4),
            Color.primaryMain,
            Color.primaryMain
            
          ])
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
      .edgesIgnoringSafeArea(.all)
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


extension View {
  public func gradientForeground(colors: [Color]) -> some View {
    self.overlay(
      LinearGradient(
        colors: colors,
        startPoint: .top,
        endPoint: .bottom)
    )
    .mask(self)
  }
}
