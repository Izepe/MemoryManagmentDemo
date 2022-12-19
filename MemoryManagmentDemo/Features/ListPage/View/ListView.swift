//
//  ContentView.swift
//  MemoryManagementDemo
//
//  Created by Felipe Izepe on 19/12/22.
//

import SwiftUI

struct ListView: View {

  @State var viewModel = ListViewModel()

  var body: some View {
    VStack {
      NavigationView {
        List(viewModel.images) { image in
          NavigationLink  {
            let viewModel = DetailsPageViewModel(listImage: image)
            DetailsPage(viewModel: viewModel)
          } label: {
            Text(image.id)
          }
        }
      }
      .navigationTitle("Images")
    }
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ListView()
  }
}
