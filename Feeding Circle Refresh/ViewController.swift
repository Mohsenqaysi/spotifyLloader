//
//  ViewController.swift
//  Feeding Circle Refresh
//
//  Created by Mohsen Qaysi on 1/13/18.
//  Copyright © 2018 Mohsen Qaysi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var pulsingLayer:  CAShapeLayer!
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    let circleViewOne: UIView = {
        let view = UIView(frame: CGRect(x: 20, y: 0, width: 30, height: 30))
        view.layer.cornerRadius = view.frame.height / 2
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let circleViewTwo: UIView = {
        let view = UIView(frame: CGRect(x: 60, y: 0, width: 30, height: 30))
        view.layer.cornerRadius = view.frame.height / 2
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    let circleViewThree: UIView = {
        let view = UIView(frame: CGRect(x: 60, y: 0, width: 30, height: 30))
        view.layer.cornerRadius = view.frame.height / 2
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    fileprivate func addViews() {
        // View animations
        view.addSubview(containerView)
        containerView.addSubview(circleViewOne)
        containerView.addSubview(circleViewTwo)
        containerView.addSubview(circleViewThree)
        
        // add containerView to the center of the mani view
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        // Add constaints to the circles
        _ = circleViewOne.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 80, bottomConstant: 0, rightConstant: 0, widthConstant: 30, heightConstant: 30)
        
        _ = circleViewTwo.anchor(top: containerView.topAnchor, left: circleViewOne.rightAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 30, heightConstant: 30)
        
        _ = circleViewThree.anchor(top: containerView.topAnchor, left: circleViewTwo.rightAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 30, heightConstant: 30)
        // animate the circles
        circleViewOne.transform = CGAffineTransform(scaleX: 0, y: 0)
        circleViewTwo.transform = CGAffineTransform(scaleX: 0, y: 0)
        circleViewThree.transform = CGAffineTransform(scaleX: 0, y: 0)
        
        UIView.animate(withDuration: 0.7) {
            self.circleViewOne.transform = .identity
            self.circleViewTwo.transform = .identity
            self.circleViewThree.transform = .identity
        }
        
        UIView().startCustomAnimation(animatedView: circleViewOne, delay: 0.3, scaledByX: 0.5, scaledByY: 0.5)
        UIView().startCustomAnimation(animatedView: circleViewTwo, delay: 0.6, scaledByX: 0.5, scaledByY: 0.5)
        UIView().startCustomAnimation(animatedView: circleViewThree,delay: 0.9, scaledByX: 0.5, scaledByY: 0.5)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red:0.16, green:0.16, blue:0.16, alpha:1.0)
        addViews()
    }
}

extension CAShapeLayer {
    
    func circleLayer(center: UIView, radius: CGFloat, fillColor: CGColor) -> CAShapeLayer {
        // drow a circle
        let shapeLayer = CAShapeLayer()
        let ciclePath = UIBezierPath(arcCenter: center.center, radius: radius, startAngle: 0, endAngle: CGFloat.pi * 2 , clockwise: true)
        shapeLayer.path = ciclePath.cgPath
        shapeLayer.fillColor = fillColor
        return shapeLayer
    }
}

extension UIView {
    func startCustomAnimation(animatedView: UIView, delay: CGFloat = 0.5, scaledByX: CGFloat, scaledByY: CGFloat) {

        UIView.animate(withDuration: 0.7, delay: TimeInterval(delay), usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [.repeat,.autoreverse], animations: {
            animatedView.transform = animatedView.transform.scaledBy(x: scaledByX, y: scaledByY)
        }) { (completed) in
            animatedView.transform = .identity
        }
    }
}

