public protocol OwnNetworkState{
    var networkState:NetworkState { get set }
    func change(state:NetworkState)
}

public protocol NetworkState{
    func stateDescription() -> String
    func responseToRequest() -> String
    func sendRequestToFetchData(params:[String:Any],sender:OwnNetworkState)
}

extension NetworkState {
    public func sendRequestToFetchData(params:[String:Any],sender:OwnNetworkState){
        print(self.responseToRequest())
        return
    }
}

public struct StandBy:NetworkState{
    public func stateDescription() -> String {
        return "待機状態です"
    }
    
    public func responseToRequest() -> String {
        return "待機状態です"
    }
    
    public func sendRequestToFetchData(params: [String : Any], sender: OwnNetworkState) {
        print("情報取得処理を開始します")
    
        //接続可能性をまず調べる
        //if reachable{
        //接続不可能→
        //sender.change(state: Offline())
        //}
    
        //非同期で取得しに行く
        //else{
        //fetcher.fetchSomeData(params:params)
        //}
        
        sender.change(state: Lording())

    }
    
    public init(){}

}

public struct Online:NetworkState{
    public func stateDescription() -> String {
        return "オンラインです"
    }
    
    public func responseToRequest() -> String {
        return "今から取得を開始します"
    }
    
    public func sendRequestToFetchData(params: [String : Any], sender: OwnNetworkState) {
        print(self.responseToRequest())
        sender.change(state: Lording())
        //非同期で取得しに行く
        //fetcher.fetchSomeData(params:params)

    }
    
    public init(){}

}

public struct Lording:NetworkState{
    public func stateDescription() -> String {
        return "ロード中です"
    }
    
    public func responseToRequest() -> String {
        return "すでにロード中です"
    }
    
    public init(){}

}

public struct Offline:NetworkState{
    public func stateDescription() -> String {
        return "オフラインです"
    }
    
    public func responseToRequest() -> String {
        return "オフライン中なので、ダウンロードできません"
    }
    
    public func sendRequestToFetchData(params: [String : Any], sender: OwnNetworkState) {
        //また考えます、エラーを送る
        var offlineNetworkError = NetworkError()
        print(self.responseToRequest())
        offlineNetworkError.errorDescription = "オフラインです"
        sender.change(state: offlineNetworkError)
    }
    
    public init(){}

}

public struct NetworkError:NetworkState{
    var errorDescription:String = ""
    
    public func stateDescription() -> String {
        return "ネットワークエラーが発生しました"
    }
    
    public func responseToRequest() -> String {
        return "エラーが発生しました:\(errorDescription)"
    }
    
    public func sendRequestToFetchData(params: [String : Any], sender: OwnNetworkState) {
        print(self.responseToRequest())
    }
    
    public init(){}

}
