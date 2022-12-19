//
//  DetailsPage.swift
//  MemoryManagementDemo
//
//  Created by Felipe Izepe on 19/12/22.
//

import SwiftUI

struct DetailsPage: View {

  let viewModel: DetailsPageViewModel

  var body: some View {
    VStack {
      Spacer()
      Text(viewModel.listImage.id)
      Divider()
      Image(viewModel.listImage.named)
        .fixedSize()
    }
    .onAppear {
      viewModel.onAppear()
    }
  }
}

struct DetailsPage_Previews: PreviewProvider {

  static let image = UIImage()

  static var previews: some View {
    DetailsPage(viewModel: .init(
      listImage: .init(id: "0", named: "0")))
  }
}
