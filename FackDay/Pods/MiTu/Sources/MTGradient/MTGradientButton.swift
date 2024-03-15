//
//  MTGradientButton.swift
//  MiTu
//
//  Created by MiTu on 21/11/21.
//  Copyright (c) 2021-Present MiTu Team

#if os(iOS)
import UIKit

public class MTGradientButton: UIButton {
    
    //MARK: Variables
    public var colors: [UIColor] = [.black, .white] {
        didSet {
            self.gradientLayer.colors = colors.map({$0.cgColor})
            layoutIfNeeded()
        }
    }
    
    public var startPoint: MTGradientPoint = .centerLeft {
        didSet {
            self.gradientLayer.startPoint = startPoint.point
            layoutIfNeeded()
        }
    }
    
    public var endPoint: MTGradientPoint = .centerRight {
        didSet {
            self.gradientLayer.endPoint = endPoint.point
            layoutIfNeeded()
        }
    }
    
    public var locations: [NSNumber] = [0.0, 1.0] {
        didSet {
            self.gradientLayer.locations = locations
            layoutIfNeeded()
        }
    }
    
    
    public var type: CAGradientLayerType = .axial {
        didSet {
            self.gradientLayer.type = type
            layoutIfNeeded()
        }
    }
    
    private let gradientLayer = CAGradientLayer()

    //MARK: init
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
}

//MARK: - functions
public extension MTGradientButton {
    private func setupView() {
        gradientLayer.colors = colors.map({$0.cgColor})
        gradientLayer.startPoint = startPoint.point
        gradientLayer.endPoint = endPoint.point
        gradientLayer.locations = self.locations
        gradientLayer.frame = bounds
        
        layer.addSublayer(gradientLayer)
    }
}

#endif

