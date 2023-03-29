//
//  ViewController.swift
//  Fun-iOS-Mock-Interview
//
//  Created by Yamoses on 27/03/2023.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet var theButtons: [UIButton]!
    
    private var selectedColor: UIColor = .black
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

//MARK: Action outlets
private extension ViewController {

    @IBAction func theButtonsStamped(_ sender: UIButton) {
        // Extract stamp color from the buttons background color.
        guard let buttonColor = sender.backgroundColor else { return }
        
        // Update internal values.
        selectedColor = buttonColor
        updateButtonColors(selectedButton: sender)
    }
    
}

//MARK: Helper methods
private extension ViewController {
    func updateButtonColors(selectedButton: UIButton) {
        // Deselect all the color buttons.
        theButtons.forEach { $0.alpha = 1.0 }
        
        // Select the relevant color button.
        selectedButton.alpha = 0.5
    }
}
