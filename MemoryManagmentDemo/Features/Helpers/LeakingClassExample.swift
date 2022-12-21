//
//  LeakingClassExample.swift
//  MemoryManagementDemo
//
//  Created by Felipe Izepe on 21/12/22.
//

import Foundation

protocol LeakingClassDelegate: AnyObject {
  func didTheThing()
}

final class LeakingClassExample {

  /*
   Leaking delegate!, the details page will keep a strong reference to LeakingClassExample and this delegate
   will keep a reference back to the details page creating a retention cycle
   */
  var leakingDelegate: LeakingClassDelegate?

  func doSomething() {
    print("I did the thing!")
    leakingDelegate?.didTheThing()
  }
}
