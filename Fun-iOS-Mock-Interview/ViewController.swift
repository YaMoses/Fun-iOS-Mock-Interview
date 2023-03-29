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
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action:#selector(handleTap(_:))))
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
    
    @objc func handleTap(_ sender: UIGestureRecognizer) {
        addView(with: selectedColor, at: sender.location(in: view))
    }
    
    func addView(with color: UIColor, at location: CGPoint) {
        let square = UIView(frame: CGRect(x: location.x, y: location.y, width: 50.0, height: 50.0))
        square.backgroundColor = selectedColor
        view.addSubview(square)
    }
}
