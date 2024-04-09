//
//  CoordinatorService.swift
//  FreeGame
//
//  Created by pnkbksh on 09/04/24.
//

import Foundation
import UIKit
import SwiftUI

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    func start()
}


class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
//        if AuthManager.shared.isLoggedIn {
//            if AuthManager.shared.isPassenger {
//                navigateToPassengerHome()
//            } else {
//                navigateToDriverHome()
//            }
//        } else {
//            navigateToLogin()
//        }
        
//        navigateToLudoHome()
//        navigateToDiceHome()
        navigateToRotateBottle()
    }
    
  
    
    func navigateToLudoHome() {
        
        navigateToView{
            DiceView()
        }
      
    }
    
    
    
    func navigateToDiceHome() {
        
        navigateToView{
            CustomDiceView()
        }
      
    }
    
     func navigateToRotateBottle() {
        
        navigateToView{
            RotateBottle()
        }
      
    }
    
    
    
  
    
  
    func navigateToView<Content: View>(@ViewBuilder content: () -> Content) {
        let swiftUIView = content()
        let hostingController = UIHostingController(rootView: swiftUIView)
        navigationController.pushViewController(hostingController, animated: true)
    }
}
