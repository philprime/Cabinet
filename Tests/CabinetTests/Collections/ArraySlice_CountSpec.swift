//
//  ArraySlice_CountSpec.swift
//  CabinetTests
//
//  Created by Philip Niedertscheider on 25.09.20.
//  Copyright © 2020 Philip Niedertscheider. All rights reserved.
//

import Quick
import Nimble
@testable import Cabinet

class ArraySlice_CountSpec: QuickSpec {

    override func spec() {
        describe("ArraySlice") {
            describe("Count") {
                let values = [
                    1,
                    1,
                    2,
                    2,
                    3,
                    1,
                    2,
                    3
                ]
                let slice = values[0...5]

                it("should return zero if array is empty") {
                    expect([Int]()[0..<0].count(where: { $0 == 1 })) == 0
                }

                it("should return correct count") {
                    expect(slice.count(where: { $0 == 1 })) == 3
                    expect(slice.count(where: { $0 == 2 })) == 2
                    expect(slice.count(where: { $0 == 3 })) == 1
                }
            }
        }
    }
}
