//
//  Array+Only.swift
//  Memorize
//
//  Created by Brandon Wong on 8/17/20.
//  Copyright © 2020 Brandon Wong. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
