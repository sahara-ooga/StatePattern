//: Playground - noun: a place where people can play

//: [参考：Stateパターン](http://www.techscore.com/tech/DesignPattern/State.html/)
import UIKit

class Yumichan{
    enum State {
        case ordinary,in_bad_mood
    }
    
    var state:State = .ordinary
    
    
    /// 由美ちゃんの状態を変更するメソッド
    ///
    /// - Parameter state: 新しい状態
    func changeState(state:State) {
        self.state = state
    }
    
    func morningGreet() -> String {
        switch self.state {
        case .ordinary:
            return "オッスオッス"
        
        case .in_bad_mood:
            return "おお"
        
        default:
            return "..."
        }
    }
    
    func getProtectionForCold() -> String {
        switch self.state {
        case .ordinary:
            return "走る"
            
        case .in_bad_mood:
            return "ももひきをはく"
        default:
            return "..."
        }
    }
}
