//
//  UITabController.swift
//  CovidApp
//
//  Created by Gustavo Afonso on 30/01/2021.
//

import Foundation

class MyTabBarController: UITabBarController {

   var myString: String?

   override func viewDidLoad() {
       super.viewDidLoad()

   }
}

class MyChildViewController1: UIViewController {

   var myTabBar: MyTabBarController? {
       return tabBarController as? MyTabBarController
   }

   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)

      print("stringValue: \(myTabBar?.myString ?? "nil")")

      myTabBar?.myString = "Value of controller 1"
   }
}


class MyChildViewController2: UIViewController {

   var myTabBar: MyTabBarController? {
       return tabBarController as? MyTabBarController
   }

   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)

      print("stringValue: \(myTabBar?.myString ?? "nil")")

      myTabBar?.myString = "Value of controller 1"
   }
}
