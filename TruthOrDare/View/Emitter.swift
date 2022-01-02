//
//  Emitter.swift
//  NeverHaveIEver
//
//  Created by Marcus Thuvesen on 2021-07-04.
//  Copyright © 2021 Marcus Thuvesen. All rights reserved.
//

import UIKit

class Emitter {
    static func get(with image: UIImage) -> CAEmitterLayer {
        let emitter = CAEmitterLayer()
        emitter.emitterShape = CAEmitterLayerEmitterShape.rectangle
        emitter.emitterCells = generateEmitterCells(with: image)
        return emitter
    }
    
    static func generateEmitterCells(with image: UIImage) -> [CAEmitterCell] {
        var cells = [CAEmitterCell]()
        let cell = CAEmitterCell()
        cell.contents = image.cgImage
        cell.birthRate = 1.7
        cell.lifetime = 30
        cell.velocity = CGFloat(60)
        cell.emissionLongitude = (270 * (.pi/180))
        cell.emissionRange = (10 * (.pi/180))
        cells.append(cell)
        
        return cells
    }
}
