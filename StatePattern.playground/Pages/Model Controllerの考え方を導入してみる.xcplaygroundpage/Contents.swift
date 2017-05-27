//: [Previous](@previous)
//: 参考：https://code.tutsplus.com/tutorials/the-right-way-to-share-state-between-swift-view-controllers--cms-28474

import UIKit

//アプリ起動時にstateを設定する
//Reachabilityでできるようにしてもいいかも

class AppDelegate:UIResponder,UIApplicationDelegate{
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        if let firstViewController = window?.rootViewController as? FirstViewController{
            firstViewController.stateController = StateController()
        }
        
        return true
    }
}

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

//:通信には専用のControllerが必要。通信した結果をmodel controllerに渡す
//class NewworkingController{
//    var stateController:StateController
//    
//    init(stateController:StateController) {
//        self.stateController = stateController
//    }
//    
//    func fetchData() {
//        //fetch data
//        
//        self.stateController.state = Lording()
//    }
//}

class FirstViewController:UIViewController {
    var stateController:StateController!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let state = stateController.state
        print(state.stateDescription())
        print(state.responseToRequest())
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let secondViewController = segue.destination as? SecondViewController{
            secondViewController.stateController = self.stateController
        }
    }
}

class SecondViewController:UIViewController{
    var stateController:StateController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let state = stateController.state
        print(state.stateDescription())
        print(state.responseToRequest())
    }
    
    
    func someNetworkRequest(){
        let newOnlineState = Online()
        stateController.change(state:newOnlineState)
    }
}

//FirstViewControllerが表示される
let vc = FirstViewController()
vc.stateController = StateController()
vc.viewWillAppear(true)

//通信状態が変化する
vc.stateController.change(state: Offline())
vc.viewWillAppear(false)

//: [Next](@next)
