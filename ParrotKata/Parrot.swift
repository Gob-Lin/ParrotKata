//
// Created by Paolo Piccini on 08/03/23.
//

import Foundation

public protocol Parroting {
    var baseSpeed: Double { get }
    func speed() -> Double
}

public extension Parroting {
    var baseSpeed: Double {
        12
    }
}

public class ParrotManager {
    let parrot: Parroting

    public init(parrot: Parroting) {
        self.parrot = parrot
    }
}

class Parrot {

    let parrotManager: ParrotManager

    public init(parrotManager: ParrotManager) {
        self.parrotManager = parrotManager
    }

    public func speed() -> Double {
        let parrot = parrotManager.parrot
        return parrot.speed()
    }
}





public class EuropeanParrot: Parroting {
    public func speed() -> Double {
        baseSpeed
    }
}

public class AfricanParrot: Parroting {

    let loadFactor: Double = 9
    let numberOfCoconuts: Int

    public init(numberOfCoconuts: Int) {
       self.numberOfCoconuts = numberOfCoconuts
    }

    public func speed() -> Double {
        max(0, baseSpeed - loadFactor * Double(numberOfCoconuts))
    }
}

class NorwegianParrot: Parroting {
    let voltage: Double
    let isNailed: Bool

    public init(voltage: Double, isNailed: Bool) {
        self.voltage = voltage
        self.isNailed = isNailed
    }

    public func baseSpeed(voltage: Double) -> Double {
        min(24.0, voltage * baseSpeed)
    }

    public func speed() -> Double {
        isNailed ? 0 : baseSpeed(voltage: voltage)
    }
}
