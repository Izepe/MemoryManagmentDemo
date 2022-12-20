//
//  ImageCache.swift
//  MemoryManagementDemo
//
//  Created by Felipe Izepe on 19/12/22.
//

import Foundation
import UIKit

final class ImageCache {
  static let shared: ImageCache = ImageCache()

  private var images: [ListImage]

  private init() {
    images = []
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(clearCache),
      name: UIApplication.didReceiveMemoryWarningNotification,
      object: nil
    )
  }

  func getImage(named image: String) -> ListImage {
    if let image = images.first(where: { $0.named == image }) {
      return image
    }
    let listImage = ListImage(id: image, named: image)
    images.append(listImage)
    return listImage
  }

  @objc func clearCache() {
    images = []
  }
}
