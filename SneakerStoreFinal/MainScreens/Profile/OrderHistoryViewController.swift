import UIKit

class OrderHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let orderHistory = OrderHistory.shared
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.rowHeight = 100
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: "HistoryTableViewCell")
        
        orderHistory.getSneakers(docuementID: "e03guMtStrsMnfEqHCXa") {
//            print(self.orderHistory.sneakersArray)
        }
        
        orderHistory.getData {
            self.view.addSubview(self.tableView)
            self.tableView.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.top.equalToSuperview()
                make.width.equalTo(390)
                make.height.equalTo(650)
            }
            self.tableView.reloadData()
          
        }

    }
    

}
extension OrderHistoryViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderHistory.ordersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell", for: indexPath) as? HistoryTableViewCell else { return UITableViewCell() }
        orderHistory.getSneakers(docuementID: orderHistory.ordersArray[indexPath.row].ID) {
            cell.configure(order: self.orderHistory.ordersArray[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let orderInfo = OrderInformation()
        orderInfo.configure(order: orderHistory.ordersArray[indexPath.row])
        navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(orderInfo, animated: true)
    }
}
