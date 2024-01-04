//
//  CustomHostingController.swift
//  RandomWeatherApp
//
//  Created by Carlos Roig Salvador on 11/12/23.
//

import Foundation
import SwiftUI
import UIKit

class CustomHostingController <Content>: UIHostingController<AnyView> where Content : View {

    public init(shouldShowNavigationBar: Bool, rootView: Content, backgroundColor: UIColor = .white) {
      super.init(rootView: AnyView(rootView.navigationBarHidden(!shouldShowNavigationBar)))
      self.view.backgroundColor = backgroundColor
  }

  @objc required dynamic init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
}
