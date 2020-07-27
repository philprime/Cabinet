//
//  Partial.swift
//  Cabinet
//
//  Created by Philip Niedertscheider on 10.02.20.
//  Copyright © 2020 Philip Niedertscheider. All rights reserved.
//

public protocol PartialConvertible {

    init(partial: Partial<Self>) throws

}
