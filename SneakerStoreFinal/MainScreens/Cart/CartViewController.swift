import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let vector = ImageFactory.Image(name: "cartVector", isHidden: false)
    let cart = Cart.shared
    let date = Date()
    
    
    let dateFormatter = DateFormatter()
    
    let mainText: UILabel = {
        let text = UILabel()
        text.text = "Cart is empty"
        text.textColor = .black
        text.font = .systemFont(ofSize: 28, weight: .semibold)
        text.textAlignment = .center
        
        return text
    }()
    
    let smallText: UILabel = {
        let text = UILabel()
        text.text = "Find interesting models in the Catalog."
        text.textColor = .black
        text.font = .systemFont(ofSize: 17, weight: .regular)
        text.textAlignment = .center
        
        return text
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.rowHeight = 160
        return tableView
    }()
    
    let totalAmount: UILabel = {
        let text = UILabel()
        text.font = .systemFont(ofSize: 20, weight: .bold)
        text.textAlignment = .left
        text.text = "Find interesting models in the Catalog."
        return text
    }()
    
    
    let button = ButtonFactory.buttonWithoutIcon(name: "Confirm Order", color: .black)
    @objc private func buttonDidPress() {
        print("Button was pressed!")
        let allert = allertInButton()
        
        present(allert, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Cart"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CartTableViewCell.self, forCellReuseIdentifier: "CartTableViewCell")
        dateFormatter.dateFormat = "dd/MM/yyyy"
        cart.getData {
            if self.cart.sneakersArray.count == 0 {
                self.view.addSubview(self.vector)
                self.vector.snp.makeConstraints { make in
                    make.centerX.equalToSuperview()
                    make.top.equalToSuperview()
                }
                self.view.addSubview(self.mainText)
                self.mainText.snp.makeConstraints { make in
                    make.centerX.equalToSuperview()
                    make.top.equalToSuperview().offset(386)
                    make.width.equalTo(354)
                    make.height.equalTo(34)
                }
                self.view.addSubview(self.smallText)
                self.smallText.snp.makeConstraints { make in
                    make.centerX.equalToSuperview()
                    make.top.equalToSuperview().offset(436)
                    make.width.equalTo(354)
                    make.height.equalTo(22)
                }
                self.button.layer.opacity = 0
                self.totalAmount.layer.opacity = 0
                
            } else {
                self.view.addSubview(self.tableView)
                self.tableView.snp.makeConstraints { make in
                    make.centerX.equalToSuperview()
                    make.top.equalToSuperview()
                    make.width.equalTo(390)
                    make.height.equalTo(650)
                }
                self.totalAmount.layer.opacity = 1
                self.view.addSubview(self.totalAmount)
                self.totalAmount.text = "Total amount: $\(self.getTotalAmount())"
                self.totalAmount.snp.makeConstraints { make in
                    make.leading.equalToSuperview().offset(18)
                    make.top.equalTo(self.tableView.snp_bottomMargin)
                    make.width.equalTo(390)
                    make.height.equalTo(40)
                }
                
                self.view.addSubview(self.button)
                self.button.layer.opacity = 1
                self.button.addTarget(self, action: #selector(self.buttonDidPress), for: .touchUpInside)
                self.button.snp.makeConstraints { make in
                    make.bottom.equalToSuperview().offset(-104)
                    make.centerX.equalToSuperview()
                    make.height.equalTo(54)
                    make.width.equalTo(358)
                }
            }
            
            self.tableView.reloadData()
        }
        
    }

    func getTotalAmount() -> Int {
        var amount = 0
        for sneaker in cart.sneakersArray {
            amount = amount + sneaker.price
        }
        return amount
    }
    
    func allertInButton() -> UIAlertController {
        
        let allert = UIAlertController(title: "Proceed with payment", message: "Are you sure you want to continue?", preferredStyle: .alert)
        
        allert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { smth in
            print("canceled")
        }))
        allert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { smth in
            print("confirmed")
            
            self.cart.sendToHistory(order: Order(sneakers: self.cart.sneakersArray, date: self.dateFormatter.string(from: self.date), quatity: self.cart.sneakersArray.count, price: self.getTotalAmount(), ID: ""))
            for sneaker in self.cart.sneakersArray {
                self.cart.deleteData(sneaker: sneaker)
            }
            
        let conformation = OrderConformation()
        if let sheet = conformation.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        self.navigationController?.present(conformation, animated: true)
        }))
        return allert
    }
        
        
}



extension CartViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(1)
        return cart.sneakersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(2)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as? CartTableViewCell else {
            return UITableViewCell()}
        cell.configure(sneaker: cart.sneakersArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                cart.deleteData(sneaker: cart.sneakersArray[indexPath.row])
            }
    }

}
