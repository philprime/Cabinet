//
//  Array+Identifiable_Spec.swift
//  CabinetTests
//
//  Created by Philip Niedertscheider on 01.07.20.
//

import Quick
import Nimble
@testable import CabinetCore

class String_NilSpec: QuickSpec {

    override func spec() {
        describe("String") {
            describe("nil if empty") {

                it("should return nil if string is empty") {
                    expect("".nilIfEmpty).to(beNil())
                }

                it("should return string if string is not empty") {
                    expect("ABC".nilIfEmpty) == "ABC"
                }
            }
        }
    }
}
