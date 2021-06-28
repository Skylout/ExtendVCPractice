//
//  ViewController.swift
//  ExtendVCPractice
//
//  Created by Леонид on 28.06.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var coolButton: UIButton!
    var isAlreadyPressed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coolButton.layer.borderWidth = 1.0
        coolButton.layer.cornerRadius = 2.0
    }

    @IBAction func coolButtonPressed(_ sender: UIButton) {
        if !isAlreadyPressed {
            showBlackSquare()
            isAlreadyPressed = true
            DispatchQueue.main.async {
                self.coolButton.setTitle("Убрать квадрат", for: .normal)
            }
        } else {
            hideBlackSquare()
            isAlreadyPressed = false
            DispatchQueue.main.async {
                self.coolButton.setTitle("Вернуть квадрат на законное место", for: .normal)
            }
        }
    }
    
}

extension ViewController {
    func showBlackSquare () {
        let w = UIScreen.main.bounds.width
        let h = UIScreen.main.bounds.height
        
        let blackSquare = UIView(frame: CGRect(x: w/2, y: h/2, width: 25, height: 25))
        blackSquare.layer.backgroundColor = UIColor.black.cgColor
        blackSquare.tag = 60
        self.view.addSubview(blackSquare)
    }
    
    func hideBlackSquare () {
        if let viewWithCurrentTag = self.view.viewWithTag(60) {
            viewWithCurrentTag.removeFromSuperview()
        }
    }
}
