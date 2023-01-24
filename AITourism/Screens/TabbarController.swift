//
//  File.swift
//  AITourism
//
//  Created by Mekhriddin Jumaev on 21/01/23.
//

import SETabView
import UIKit
import AlanSDK

let mainColor = UIColor.init(hex: "#5864cc")
let whiteColor = UIColor.white

class TabbarController: SETabViewController {
    /// Alan button
    var button: AlanButton!

    fileprivate var text: AlanText!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addViewController()
        setupAlan()
        
        self.button.onCommand = { command in
          guard let commandName = command?["command"] as? String else {
            return
          }
            switch commandName {
            case "cell1":
                NotificationCenter.default.post(name: NSNotification.Name("cell1"), object: nil)
            case "cell2":
                NotificationCenter.default.post(name: NSNotification.Name("cell2"), object: nil)
            case "cell3":
                NotificationCenter.default.post(name: NSNotification.Name("cell3"), object: nil)
            case "cell4":
                NotificationCenter.default.post(name: NSNotification.Name("cell4"), object: nil)
            case "cell5":
                NotificationCenter.default.post(name: NSNotification.Name("cell5"), object: nil)
            default:
                print("XXX")
            }
        }
        
    }

    private func addViewController() {
        let controller1 = HomeViewController()
        controller1.tabBarItem.image = UIImage.init(systemName: "house.fill")
        controller1.tabBarItem.title = "About"

        let controller2 = RegionsViewController()
        controller2.tabBarItem.image = UIImage.init(systemName: "location.fill")
        controller2.tabBarItem.title = "Regions"
        
        let controller3 = ContactViewController()
        controller3.tabBarItem.image = UIImage.init(systemName: "phone.fill")
        controller3.tabBarItem.title = "Contact Us"
        
        viewControllers = [
            UINavigationController(rootViewController: controller1), UINavigationController(rootViewController: controller2), UINavigationController(rootViewController: controller3)
        ]
        setTabColors(backgroundColor: mainColor,
                     ballColor: (mainColor),
                     tintColor: whiteColor,
                     unselectedItemTintColor: whiteColor,
                     barTintColor: .yellow)
        
        setViewControllers(viewControllers)
    }
    
    fileprivate func setupAlan() {

        /// Define the project key
        let config = AlanConfig(key: "cadfcd54e88c6e3d7c0e7badf77c3c2c2e956eca572e1d8b807a3e2338fdd0dc/stage")
                
        ///  Init the Alan button
        self.button = AlanButton(config: config)
                
        /// Init the Alan text panel
        self.text = AlanText(frame: CGRect.zero)
                
        /// Add the button and text panel to the view
        self.view.addSubview(self.button)
        self.button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.text)
        self.text.translatesAutoresizingMaskIntoConstraints = false

        let views = ["button" : self.button!, "text" : self.text!]
        let horizontalText = NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[text]-20-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: views)
        self.view.addConstraints(horizontalText)
        button.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-60 - 20)
            make.trailing.equalTo(view).offset(-20)
            make.height.width.equalTo(64)
        }

        text.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-60 - 20)
            make.height.width.equalTo(64)
        }
        /// Handle commands from Alan Studio
        self.button.onCommand = { command in
          guard let commandName = command?["command"] as? String else {
            return
          }
          print(commandName)
        }

    }
}
