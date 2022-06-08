//
//  UILabel + Extension.swift
//  MarkTestTask
//
//  Created by Oleksandr Kachkin on 08.06.2022.
//

import UIKit


//MARK: - Multiple font color in a single label

extension UILabel {
  
  func changeFontColor(text: String?, otherColorText: String?, color: UIColor?) {
        let attributedString = NSMutableAttributedString(string: text!)
        let range = (text! as NSString).range(of: otherColorText!)
        attributedString.setAttributes([NSAttributedString.Key.foregroundColor: color!], range: range)
        self.attributedText = attributedString
    }
}
