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
        List(viewModel.imagesNames, id: \.self) { name in
          /*
           SwiftUI manages the navigation links by loading all the pages at once in memory, if you want to load them only on action you'll need to declare them with a lazy adapter or not use List
           Also the views are kept in memory once presented until the OS decides to remove them, I was not able to see the view being removed from emory nor have I found a way to force the clean so far. This is done because the init of a view takes a lot of processing so the OS values efficiency over memory usage
           */
          NavigationLink  {
            DetailsPage(viewModel: DetailsPageViewModel(imageNamed: name))
          } label: {
            Text(name)
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
