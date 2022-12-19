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

  init(listImage: ListImage) {
    self.listImage = listImage

  }

  func onAppear() {
    leakingCallback = {
      // The automatic memory leak was not able to identify this leak
      print("Test leak \(self.listImage.id)")
    }
    leakingCallback?()
  }
}
