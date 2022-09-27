import UIKit

class OrderInformation: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let history = OrderHistory.shared
    
    var order = Order(sneakers: [], date: "Fh", quatity: 23, price: 23, ID: "hsdf")
    
    lazy var smallPlate1 = OrderViews.smallPlate(text1: "Ordered", text2: self.order.date)
    lazy var smallPlate2 = OrderViews.smallPlate(text1: "\(self.order.quantity) items: Total (Including Delivery) ", text2: String(self.order.price))
    
    lazy var tableView: UITableView = {
          let tableView = UITableView()
          tableView.backgroundColor = .white
          tableView.rowHeight = 160
          return tableView
      }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SneakersTableViewCell.self, forCellReuseIdentifier: "SneakersTableViewCell")

        view.addSubview(smallPlate1)
        smallPlate1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(104)
            make.leading.equalToSuperview()
        }
        
        view.addSubview(smallPlate2)
        smallPlate2.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(170)
            make.leading.equalToSuperview()
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.centerX.equalToSuperview()
            make.width.equalTo(390)
            make.height.equalTo(650)
        }
    }

    
    func configure(order: Order) {
        self.order = order
    }
                      
}
extension OrderInformation {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print(order.sneakers.count)
        return order.sneakers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SneakersTableViewCell", for: indexPath) as? SneakersTableViewCell else {
            return UITableViewCell()}

            cell.configure(sneaker: order.sneakers[indexPath.row])
        return cell
    }
}
    

