public protocol State{
    func stateDescription() -> String
    func responseToRequest() -> String
}

public struct StandBy:State{
    public func stateDescription() -> String {
        return "待機状態です"
    }
    
    public func responseToRequest() -> String {
        return "待機状態です"
    }
    
    public init(){}

}

public struct Online:State{
    public func stateDescription() -> String {
        return "オンラインです"
    }
    
    public func responseToRequest() -> String {
        return "今から取得を開始します"
    }
    
    public init(){}

}

public struct Lording:State{
    public func stateDescription() -> String {
        return "ロード中です"
    }
    
    public func responseToRequest() -> String {
        return "すでにロード中です"
    }
    
    public init(){}

}

public struct Offline:State{
    public func stateDescription() -> String {
        return "オフラインです"
    }
    
    public func responseToRequest() -> String {
        return "オフライン中なので、ダウンロードできません"
    }
    
    public init(){}

}

public struct NetworkError:State{
    public func stateDescription() -> String {
        return "ネットワークエラーが発生しました"
    }
    
    public func responseToRequest() -> String {
        return "エラーが発生しました"
    }
    
    public init(){}

}
