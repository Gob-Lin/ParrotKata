//
//  ParrotKataTests.swift
//  ParrotKataTests
//
//  Created by Paolo Piccini on 08/03/23.
//
//

import XCTest
@testable import ParrotKata

final class ParrotKataTests: XCTestCase {

    func testSpeedReturnType() {
        let europeanManager = ParrotManager(parrot: EuropeanParrot())
        var sut = Parrot(parrotManager: europeanManager)
        var result = sut.speed()
        XCTAssertTrue(type(of: result) == Double.self)
        let africanManager = ParrotManager(parrot: AfricanParrot(numberOfCoconuts: 5))
        sut = Parrot(parrotManager: africanManager)
        result = sut.speed()
        XCTAssertTrue(type(of: result) == Double.self)
        let norwegianManager = ParrotManager(parrot: NorwegianParrot(voltage: 100, isNailed: true))
        sut = Parrot(parrotManager: norwegianManager)
        result = sut.speed()
        XCTAssertTrue(type(of: result) == Double.self)
    }

    func testSpeedNonNegative() {
        let europeanManager = ParrotManager(parrot: EuropeanParrot())
        var sut = Parrot(parrotManager: europeanManager)
        var result = sut.speed()
        XCTAssertGreaterThanOrEqual(result, 0)
        let africanManager = ParrotManager(parrot: AfricanParrot(numberOfCoconuts: 5))
        sut = Parrot(parrotManager: africanManager)
        result = sut.speed()
        XCTAssertGreaterThanOrEqual(result, 0)
        let norwegianManager = ParrotManager(parrot: NorwegianParrot(voltage: 100, isNailed: true))
        sut = Parrot(parrotManager: norwegianManager)
        result = sut.speed()
        XCTAssertGreaterThanOrEqual(result, 0)

    }

    func testEuropeanParrotSpeed() {
        let europeanManager = ParrotManager(parrot: EuropeanParrot())
        let sut = Parrot(parrotManager: europeanManager)
        let expected = europeanManager.parrot.baseSpeed
        let result = sut.speed()
        XCTAssertEqual(result, expected)
    }

    func testAfricanParrotSpeed() {
        let parrot = AfricanParrot(numberOfCoconuts: 5)
        let africanManager = ParrotManager(parrot: parrot)
        let sut = Parrot(parrotManager: africanManager)
        let expected = max(0, parrot.baseSpeed - parrot.loadFactor * Double(5))
        let result = sut.speed()
        XCTAssertEqual(result, expected)
    }

    func testNorwegianParrotSpeedWhenNailed() {
        let parrot = NorwegianParrot(voltage: 100, isNailed: true)
        let norwegianManager = ParrotManager(parrot: parrot)
        let sut = Parrot(parrotManager: norwegianManager)
        let expected = Double(0)
        let result = sut.speed()
        XCTAssertEqual(result, expected)
    }

    func testNorwegianParrotSpeedWhenNotNailed() {
        let parrot = NorwegianParrot(voltage: 100, isNailed: false)
        let norwegianManager = ParrotManager(parrot: parrot)
        let sut = Parrot(parrotManager: norwegianManager)
        let expected = parrot.baseSpeed(voltage: parrot.voltage)
        let result = sut.speed()
        XCTAssertEqual(result, expected)
    }

}
