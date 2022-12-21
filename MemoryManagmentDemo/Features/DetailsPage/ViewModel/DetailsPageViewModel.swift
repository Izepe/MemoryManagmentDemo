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
  var leakingClass = LeakingClassExample()
  /*
   Reference to the view that creates a retention cycle, the OS already keeps a strong reference to the
   view while it is being displayed so there is no need to create a strong reference here.
   This is also an anti-patter because the View Model should not have a reference to the view itself.
   The idea is that it is able to be reused in more than one view if possible and also it should
   not be dealing with UI elements
  */
  var leakingViewReference: DetailsPage?

  init(imageNamed: String) {
    self.listImage = ImageCache.shared.getImage(named: imageNamed)
  }

  func onAppear(page: DetailsPage) {
    leakingCallback = {
      // The automatic memory leak was not able to identify this leak
      DispatchQueue.global(qos: .background).async {
        for i in 0..<10000000 {
          print("Test leak \(self.listImage.id) - \(i)")
        }
      }
    }
    leakingCallback?()
    leakingClass.leakingDelegate = self
    leakingViewReference = page
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

extension DetailsPageViewModel: LeakingClassDelegate {
  func didTheThing() {
    print("He done did the thing")
  }
}
