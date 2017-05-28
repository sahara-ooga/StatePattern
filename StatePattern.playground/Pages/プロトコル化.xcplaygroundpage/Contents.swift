//: [Previous](@previous)

//: 参考 [ダイナミックObjective-C (117) デザインパターンをObjective-Cで - State (1)](http://s.news.mynavi.jp/column/objc/117/index.html)
import Foundation

class Connector:OwnNetworkState{
    static let shared = Connector()
    
    var networkState: NetworkState
    
    private init() {
        self.networkState = StandBy()
    }
    
    func descriptState() {
        print(self.networkState.stateDescription())
    }
    
    func sendRequestToFetchData(parameters:[String:Any]) {
        self.networkState.sendRequestToFetchData(params: parameters, sender: self)
    }
    
    func change(state:NetworkState) {
        self.networkState = state
    }
}

let connector = Connector.shared
connector.descriptState()
connector.sendRequestToFetchData(parameters: ["url":"example.com"])
connector.descriptState()

//: [Next](@next)
