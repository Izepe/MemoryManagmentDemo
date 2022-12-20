//
//  DetailsPageViewModel.swift
//  MemoryManagementDemo
//
//  Created by Felipe Izepe on 19/12/22.
//

import Foundation

final class DetailsPageViewModel {

  let listImage: ListImage
  var leakingCallback: (() -> Void)?

  init(imageNamed: String) {
    self.listImage = ImageCache.shared.getImage(named: imageNamed)
  }

  func onAppear() {
    leakingCallback = {
      // The automatic memory leak was not able to identify this leak
      DispatchQueue.global(qos: .background).async {
        for i in 0..<10000000 {
          print("Test leak \(self.listImage.id) - \(i)")
        }
      }
    }
    leakingCallback?()
  }
}

extension DetailsPageViewModel: Hashable {
  static func == (lhs: DetailsPageViewModel, rhs: DetailsPageViewModel) -> Bool {
    lhs.listImage.named == rhs.listImage.named
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(listImage.named)
  }
}
