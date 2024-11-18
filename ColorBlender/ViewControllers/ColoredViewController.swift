//
//  ColoredViewController.swift
//  ColorBlender
//
//  Created by Anastasya Maximova on 13.11.2024.
//

import UIKit

protocol ColorBlenderViewControllerDelegate {
    func setViewColor(red: CGFloat, green: CGFloat, blue: CGFloat)
}

final class ColoredViewController: UIViewController {
    
    private var red: CGFloat = 1
    private var green: CGFloat = 1
    private var blue: CGFloat = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewColor(red: red, green: green, blue: blue)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorBlenderVC = segue.destination as? ColorBlenderViewController
        colorBlenderVC?.redColor = red
        colorBlenderVC?.greenColor = green
        colorBlenderVC?.blueColor = blue
        colorBlenderVC?.delegate = self
    }
}

//MARK: - ColorBlenderViewControllerDelegate
extension ColoredViewController: ColorBlenderViewControllerDelegate {
    func setViewColor(red: CGFloat, green: CGFloat, blue: CGFloat) {
       view.backgroundColor = UIColor(
            red: CGFloat(red),
            green: CGFloat(green),
            blue: CGFloat(blue),
            alpha: 1
        )
        self.red = red
        self.green = green
        self.blue = blue
    }
}

