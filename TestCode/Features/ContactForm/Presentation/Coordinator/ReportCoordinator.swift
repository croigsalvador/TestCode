//
//  ReportCoordinator.swift
//  TestCode
//
//  Created by Carlos Roig Salvador on 6/1/24.
//

import Foundation
import UIKit
import SwiftUI
import Dip

class ReportCoordinator: Coordinator {
    
    let container: DependencyContainer
    var rootViewController: UIViewController?
    
    init(container: DependencyContainer = DependencyContainer()) {
        self.container = container
        setupDependencies()
    }
    func start() {
        guard let saveReport: SaveReport = try? container.resolve() else {
            return
        }
        let viewModel = ContactFormViewModel(viewState: ContactFormViewState(), coordinator: self, saveReport: saveReport)
        let view = ContactFormView(viewModel: viewModel, viewState: viewModel.viewState)

        rootViewController = CustomHostingController(shouldShowNavigationBar: false, rootView: view)
    }
    
    func pop() {
        rootViewController?.navigationController?.popViewController(animated: true)
    }
    
    private func setupDependencies() {
        let cache = ReportUserDefaultsCache<ReportDataModel>(userDefaults: UserDefaults.standard)
        container.register { ReportRepositoryImpl<ReportUserDefaultsCache<ReportDataModel>>(cache: cache) as ReportRepostory }
        container.register { SaveReportImpl(try self.container.resolve()) as SaveReport }
    }
}
