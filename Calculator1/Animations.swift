//
//  Animations.swift
//  Calculator1
//
//  Created by user206820 on 10/25/21.
//
import UIKit
import Foundation

func buttonAnimation (_ sender: UIButton) {
sender.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)

UIView.animate(withDuration: 0.8,
               delay: 0,
               usingSpringWithDamping: CGFloat(0.90),
               initialSpringVelocity: CGFloat(9.0),
               options: UIView.AnimationOptions.allowUserInteraction,
               animations: {
    sender.transform = CGAffineTransform.identity
},
               completion: { Void in()  }
)
}
