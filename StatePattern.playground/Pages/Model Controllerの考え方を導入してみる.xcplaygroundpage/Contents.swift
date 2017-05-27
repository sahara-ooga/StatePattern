//: [Previous](@previous)

import UIKit

class StateController{
    var state:State = Default()
    
    func change(state:State) {
        self.state = state
    }
    
    func stateDescription() -> String{
        return self.state.stateDescription() 
    }
    
    func responseToRequest() -> String {
        return self.state.responseToRequest() 
    }
}
//: [Next](@next)
