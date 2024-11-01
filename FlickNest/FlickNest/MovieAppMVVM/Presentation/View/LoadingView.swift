//
//  LoadingView.swift
//  FlickNest
//
//  Created by Goldianus Solangius on 11/01/24.
//

import SwiftUI

struct LoadingView: View {
  @Binding var showProgress: Bool
  var body: some View {
    ZStack{
      if showProgress {
        Group {
          Rectangle()
            .fill(.black.opacity(0.25))
            .ignoresSafeArea()
          
          ProgressView()
            .padding(15)
            .background(.white, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
        }
      }
    }
    .animation(.easeInOut(duration: 0.25), value: showProgress)
  }
}

#Preview {
  LoadingView(showProgress: .constant(false))
}
