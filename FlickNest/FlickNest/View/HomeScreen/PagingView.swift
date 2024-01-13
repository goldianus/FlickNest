//
//  PagingView.swift
//  FlickNest
//
//  Created by Goldianus Solangius on 13/01/24.
//

import SwiftUI


struct PagingView<Content: View>: View {
  @Binding var index: Int
  let maxIndex: Int
  let content: () -> Content
  
  @State private var offset: CGFloat = .zero
  @State private var dragging = false
  
  init(index: Binding<Int>, maxIndex: Int, @ViewBuilder content: @escaping () -> Content) {
    self._index = index
    self.maxIndex = maxIndex
    self.content = content
  }
  
  var body: some View {
    ZStack(alignment: .bottom) {
      GeometryReader { geometry in
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(spacing: 0) {
            self.content()
              .frame(width: geometry.size.width, height: geometry.size.height)
              .clipped()
          }
        }
        .content.offset(x: self.offset(in: geometry), y: 0)
        .frame(width: geometry.size.width, alignment: .leading)
        .gesture(
          DragGesture().onChanged { value in
            withAnimation(.spring()) {
              self.dragging = true
              let newOffset = -CGFloat(self.index) * geometry.size.width + value.translation.width
              let threshold = CGFloat(50)
              if abs(newOffset - self.offset) > threshold {
                self.index = self.clampedIndex(from: self.index + Int((newOffset - self.offset) / geometry.size.width))
                self.offset = -CGFloat(self.index) * geometry.size.width
              } else {
                self.offset = newOffset
              }
            }
          }
            .onEnded { value in
              let predictedEndOffset = -CGFloat(self.index) * geometry.size.width + value.predictedEndTranslation.width
              let predictedIndex = Int(round(predictedEndOffset / -geometry.size.width))
              self.index = self.clampedIndex(from: predictedIndex)
              withAnimation(.spring()) {
                self.dragging = false
              }
            }
        )
      }
      .clipped()
      
      DotPageIndicator(index: $index, maxIndex: maxIndex)
        .padding(5)
    }
  }
  
  private func offset(in geometry: GeometryProxy) -> CGFloat {
    if self.dragging {
      return max(min(self.offset, 0), -CGFloat(self.maxIndex) * geometry.size.width)
    } else {
      return -CGFloat(self.index) * geometry.size.width
    }
  }
  
  private func clampedIndex(from predictedIndex: Int) -> Int {
    let newIndex = min(max(predictedIndex, self.index - 1), self.index + 1)
    guard newIndex >= 0 else { return 0 }
    guard newIndex <= maxIndex else { return maxIndex }
    return newIndex
  }
}

struct DotPageIndicator: View {
  @Binding var index: Int
  let maxIndex: Int
  
  var body: some View {
    HStack(spacing: 8) {
      ForEach(0...maxIndex, id: \.self) { pageIndex in
        Circle()
          .fill(pageIndex == self.index ? Color.blue : Color.white)
          .frame(width: 5, height: 5)
      }
    }
  }
}

