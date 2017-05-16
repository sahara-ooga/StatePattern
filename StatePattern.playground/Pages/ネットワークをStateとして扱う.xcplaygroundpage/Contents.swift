//: [Previous](@previous)

import Foundation

protocol State{
    func stateDescription() -> String
    func responseToRequest() -> String
}

struct Online:State{
    func stateDescription() -> String {
        return "オンラインです"
    }
    
    func responseToRequest() -> String {
        return "今から取得を開始します"
    }
}

struct Lording:State{
    func stateDescription() -> String {
        return "ロード中です"
    }
    
    func responseToRequest() -> String {
        return "すでにロード中です"
    }
}

struct Offline:State{
    func stateDescription() -> String {
        return "オフラインです"
    }
    
    func responseToRequest() -> String {
        return "オフライン中なので、ダウンロードできません"
    }
}

struct NetworkError:State{
    func stateDescription() -> String {
        return "ネットワークエラーが発生しました"
    }
    
    func responseToRequest() -> String {
        return "エラーが発生しました"
    }
}


//: [Next](@next)
