//: [Previous](@previous)

import Foundation

class StatePatternYumichan{
    private var state:State? = nil
    
    func changeState(newState:State) {
        self.state = newState
    }
    
    func morningGreet() -> String{
        return self.state?.morningGreet() ?? ""
    }
    
    func getProtectionForCold() -> String {
        return self.state?.getProtectionForCold() ?? ""
    }
    
}

protocol State{
    func morningGreet() -> String
    func getProtectionForCold() -> String
}

struct BadMoodState:State{
    func morningGreet() -> String {
        return "おお"
    }
    
    func getProtectionForCold() -> String {
        return "ももひき"
    }
}

struct OrdinaryState:State{
    func morningGreet() -> String {
        return "おっす"
    }
    
    func getProtectionForCold() -> String {
        return "走る"
    }
}

var yumichan = StatePatternYumichan()
yumichan.changeState(newState: BadMoodState())

yumichan.morningGreet()
yumichan.getProtectionForCold()

yumichan.changeState(newState: OrdinaryState())
yumichan.morningGreet()
yumichan.getProtectionForCold()

//: [Next](@next)
