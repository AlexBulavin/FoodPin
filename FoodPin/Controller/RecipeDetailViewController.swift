//
//  RecipeDetailViewController.swift
//  FoodPin
//
//  Created by Alex on 09.09.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit
import CoreBluetooth

class RecipeDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CBCentralManagerDelegate, CBPeripheralDelegate {
    

    
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var headerView: RecipeDetailHeaderView!
    @IBAction func close(segue:UIStoryboardSegue){
        dismiss(animated: true, completion: nil)
    }
    var ratingChanged = "No rating yet"
    var recipe = Recipes()

    @IBOutlet var rateIt2: UIButton!
    @IBAction func rateRecipe(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: { [self] in
            if let rating = segue.identifier {
            print(rating)
            switch rating {
                case "zero":
                ratingChanged = "⭐︎⭐︎⭐︎⭐︎⭐︎"
                    print(ratingChanged)
                    recipe.recipeRating = ratingChanged
                    rateIt2.setTitle(ratingChanged, for: .normal)
                return
                    
                case "one":
                ratingChanged = "★⭐︎⭐︎⭐︎⭐︎"
                    self.recipe.recipeRating = ratingChanged
                    print(recipe.recipeRating)
                    rateIt2.setTitle(ratingChanged, for: .normal)
                return

                case "two":
                ratingChanged = "★★⭐︎⭐︎⭐︎"
                    self.recipe.recipeRating = ratingChanged
                    print(recipe.recipeRating)
                    rateIt2.setTitle(ratingChanged, for: .normal)
                return

                case "tree":
                ratingChanged = "★★★⭐︎⭐︎"
                    self.recipe.recipeRating = ratingChanged
                    print(recipe.recipeRating)
                    rateIt2.setTitle(ratingChanged, for: .normal)
                return

                case "four":
                ratingChanged = "★★★★⭐︎"
                    self.recipe.recipeRating = ratingChanged
                    print(recipe.recipeRating)
                    rateIt2.setTitle(ratingChanged, for: .normal)
                return

                case "five":
                ratingChanged = "★★★★★"
                    self.recipe.recipeRating = ratingChanged
                    print(recipe.recipeRating)
                    rateIt2.setTitle(ratingChanged, for: .normal)
                return

                default:
                ratingChanged = "No rating yet"
                    self.recipe.recipeRating = ratingChanged
                    print(recipe.recipeRating)
                    rateIt2.setTitle(ratingChanged, for: .normal)
                return
            }

        }
        })
    }
    
    var centralManager: CBCentralManager!
    var scale: CBPeripheral?
    
    let serviceUUID = CBUUID(string: "780A") //ID сервиса 780А
    let kitchenScaleCharacteristicUUID = CBUUID(string: "8AA2")//Unknown characterristic 
    //UUID: 8AA2
    //Properties: Notify
    //Value 0x0C-0D-00-00-81-10-17-00 где 0D-00 - это вес
    
    @IBOutlet weak var weightLabel: UILabel!
    
   
    // MARK: - Central manager delegate
    func  centralManagerDidUpdateState(_ central: CBCentralManager)  {
        if central.state == .poweredOn { //Проверяем, включен ли Bluetooth на телефоне. Если не выключен, то выводится системное сообщение о необходимостиadvertisementData  его включить.
            centralManager.scanForPeripherals(withServices: [serviceUUID], options: nil)
            print("Power is ON \n \(#file) Функция \(#function ) строка \(#line)")
            print("centralManager \(String(describing: centralManager)) \n")
            
        }
    }

    func centralManager (_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print("\nName   : \(peripheral.name ?? "(No name)")")
        print("RSSI   : \(RSSI)")
            for ad in advertisementData {
                print("AD Data: \(ad)\n\n")
            }
        centralManager.stopScan()
        scale = peripheral
        centralManager.connect(peripheral, options: nil)
        let CBAdvertisementDataManufacturerDataKey: String // The manufacturer data of a peripheral.
//        print("\(#file) Функция \(#function ) строка \(#line)")
//        print("CBAdvertisementDataManufacturerDataKey \(advertisementData) \n")
        let CBAdvertisementDataServiceDataKey: String //A dictionary that contains service-specific advertisement data.
        let CBAdvertisementDataServiceUUIDsKey: String //An array of service UUIDs.
        let CBAdvertisementDataOverflowServiceUUIDsKey: String //An array of UUIDs found in the overflow area of the advertisement data.
        let CBAdvertisementDataTxPowerLevelKey: String //The transmit power of a peripheral.
        let CBAdvertisementDataIsConnectable: String //A Boolean value that indicates whether the advertising event type is connectable.
        let CBAdvertisementDataSolicitedServiceUUIDsKey: String //An array of solicited service UUIDs.
//        print("\(#file) Функция \(#function ) строка \(#line)")
//        print("centralManager \(String(describing: centralManager)) \n scale =  \(scale)")
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        peripheral.delegate = self
        peripheral.discoverServices([serviceUUID])
//        print("\(#file) Функция \(#function ) строка \(#line)")
//        print("centralManager \(String(describing: peripheral)) \n")
    }
    // MARK: - Peripheral delegate
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices eror: Error?) {
        if let service = peripheral.services?.first(where: { $0.uuid == serviceUUID
        }) {
            peripheral.discoverCharacteristics([kitchenScaleCharacteristicUUID], for: service)
//            print("\(#file) Функция \(#function ) строка \(#line)")
//            print("peripheral \(String(describing: peripheral)) \n")
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
            print("\(#file) Функция \(#function ) строка \(#line)")
            
        if let characteristic = service.characteristics?.first(where: { $0.uuid == kitchenScaleCharacteristicUUID}) {
            peripheral.setNotifyValue(true, for: characteristic) //true означает, что если девайс опубликует (отправит) данные, приложение будет их слушать и принимать.
            print("\(#file) Функция \(#function ) строка \(#line)")
            print("peripheral \(String(describing: peripheral)) \n")
        }
      
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?)  {
        //Всякий раз при получении новых данных от девайса вызывается этот метод (функция).
        if let data = characteristic.value {
            let weight: Int = data.withUnsafeBytes { $0.pointee }  >> 8 & 0xFFFFFF //В data приходит сразу много данных для более эффективного использования канала передачи данных. Например, первые 8 бит согласно спецификации - это Flag - выбор типа данных (граммы, унции, фунты и т.д.). Далее идут данные веса в гр в uint24, если Flag = 00. Далее данные веса в LB в uint8, если Flag = 01, далее данные веса в OZ в SFLOAT, если Flag = 10 (наверное) и так далее.
            //Мы можем сделать операцию Shift 8 бит в начале (Flags) и далее, закончив его на 0xFFFFFF (что есть 16ричное представление первых 24 бит). Мы должны поставить маску на ту часть, которая нас интересует. И оставить остальные биты = 0.
            weightLabel.text = String(weight) + " гр."
            print("\(#file) Функция \(#function ) строка \(#line)")
            print("peripheral \(String(describing: weightLabel.text)) \n")
            tableView.reloadData()
        }
    }
    // MARK: - Detail View controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.largeTitleDisplayMode = .never // Для того, чтобы navigation bar title был всегда маленький и не перегружал внимание пользователя
        // Configure header view
        headerView.recipeName.text = recipe.recipeNames
        headerView.recipeImageView.image = UIImage(named: recipe.recipeImages)
        headerView.heartImageView.isHidden = (recipe.recipeIsLiked) ? false : true
        
        // Set the table view's delegate and data source
        tableView.delegate = self
        tableView.dataSource = self
        
        // Configure the table view's style
        tableView.separatorStyle = .none
        
        //«customize navigation bar
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .white
        
        tableView.contentInsetAdjustmentBehavior = .never //В этой строке говорим iOS, чтобы navigation bar не ограничивала content area при свайпе снизу вверх.
        
        //Запрещаем скрытие navigation Bar
        navigationController?.hidesBarsOnSwipe = false
        UIApplication.shared.statusBarStyle = .lightContent
        // MARK: - BLE controller initiating
        centralManager = CBCentralManager()
        centralManager.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
        rateIt2.setTitle(recipe.recipeRating, for: .normal)
        
        // MARK: - BLE controller initiating
        centralManager = CBCentralManager()
        centralManager.delegate = self
    }
    
    
    // MARK: - UITableViewDataSource methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RecipeDetailDescriptionCell.self), for: indexPath) as! RecipeDetailDescriptionCell
            cell.recipeDescriptionLabel.text = recipe.recipeDescription
            cell.selectionStyle = .none
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RecipeIngredientsCell.self), for: indexPath) as! RecipeIngredientsCell
            cell.recipeIngredientsLabel.text = recipe.recipeIngredients
            cell.selectionStyle = .none
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RecipeDetailSeparatorCell.self), for: indexPath) as! RecipeDetailSeparatorCell
            cell.AddressLabel.text = "Адрес: " + recipe.recipeAuthorLocations
            cell.selectionStyle = .none
            return cell
            
        case 3:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RecipeDetailMapCell.self), for: indexPath) as! RecipeDetailMapCell
            cell.configure(location: recipe.recipeAuthorLocations)
            
            cell.selectionStyle = .none
            
            return cell
            
        default:
            fatalError("Failed to instantiate the table view cell for detail view controller. Если появляется эта ошибка, нужно проверить количество ячеек, которые мы хотим создать в     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { сейчас там return 2 } То есть имеем 2 ячейки - одна для описания рецепта, вторая для перечисления ингредиентов. Строка \(#line)")
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Функция нажатия на экран (только на ячейках с описанием рецепта и ингредиентами). Подымает ActionSheet
    
    //    @IBAction func clickOnScreen(_ sender: UIButton) { возможно задействуем эту кнопку позже при клике на header
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        
        case 0...1:
            let optionMenu = UIAlertController(title: nil, message: "Что Вы хотите сделать?", preferredStyle: .actionSheet) //.alert) это опциональное оформление сообщения. Алерт или actionSheet
            optionMenu.view.tintColor = UIColor(red: 90.0/255.0, green: 45.0/255.0 , blue: 128.0/255.0, alpha: 1.0) //Изменить цвет текста сообщения на фирменный 90;45;128
            optionMenu.view.backgroundColor = UIColor(red: 90.0/255.0, green: 45.0/255.0 , blue: 128.0/255.0, alpha: 0.85)//Изменить цвет фона сообщения
            
            if let popoverController = optionMenu.popoverPresentationController {
                if let cell = tableView.cellForRow(at: indexPath) {
                    popoverController.sourceView = cell
                    popoverController.sourceRect = cell.bounds
                }
            }
            
            // Add actions to the menu
            let callActionHandler = { (action:UIAlertAction!) -> Void in
                let alertMessage = UIAlertController(title: "Сервис временно недоступен", message: "Извините, сервис пока не доступен, пожалуйста попробуйте позже.",
                                                     preferredStyle: .alert)
                alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                alertMessage.view.tintColor = UIColor(red: 90.0/255.0, green: 45.0/255.0 , blue: 128.0/255.0, alpha: 0.85)//Изменить цвет текста ОК
                self.present(alertMessage, animated: true, completion: nil)
            }
            
            // Add Call action
            let callAction = UIAlertAction(title: "Позвонить " + "123-000- (indexPath.row)" , style: .default, handler: callActionHandler) //вместо \(indexPath.row) нужно передать адекватный ID рецепта
            optionMenu.addAction(callAction)
            
            //        // Добавить/убрать в избранное
            //        let checkInTitle = self.recipe.recipeIsLiked ? "Удалить из избранноого" : "Добавить в избранное"
            //        let checkInAction = UIAlertAction(title: checkInTitle, style: .default, handler: {
            //            (action:UIAlertAction!) -> Void in
            //
            //            self.recipeFaviritesIndicator.isHidden = self.recipe.recipeIsLiked
            //            self.recipe.recipeIsLiked = self.recipe.recipeIsLiked ? false : true
            ////            let parentVC = (self.navigationController?.parent)! as! RecipesTableViewController
            ////            parentVC.recipeIsLiked[self.indexPathRowDetail] = !self.recipeIsLiked
            //
            //        })
            //
            //        optionMenu.addAction(checkInAction)
            
            //Add Share recipe action. Делимся рецептом с друзьями.
            let shareRecipeAction = UIAlertAction(title: "Поделиться", style: .default, handler: {
                (action:UIAlertAction!) -> Void in
                
                let defaultText = "Рекомендую попробовать:" + "\n" + self.recipe.recipeNames + "\n" + "Кухня: " + self.recipe.recipeType + "\n" + "Автор рецепта: " + self.recipe.recipeAuthorLocations + "\n" + "Способ приготовления: " + "\n" + self.recipe.recipeDescription + "\n\n" + "Состав блюда:" + "\n" + self.recipe.recipeIngredients + "\n\n" + "Рецепт доступен в мобильном приложении:" + "\n" + "https://apps.apple.com/ru/app/ready-for-sky/id927991375" + "\n\n" + "https://play.google.com/store/apps/details?id=com.readyforsky"
                
                let activityController: UIActivityViewController
                
                if let defaultPicture = UIImage(named: self.recipe.recipeImages)
                { activityController = UIActivityViewController(activityItems: [ defaultText, defaultPicture], applicationActivities: nil) }
                else
                { activityController = UIActivityViewController(activityItems: [ defaultText], applicationActivities: nil) }
                
                self.present(activityController, animated: true, completion: nil)
                
            })
            optionMenu.addAction(shareRecipeAction)
            
            //Add cancel action
            let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
            
            optionMenu.addAction(cancelAction)
            
            // Display the menu
            present(optionMenu, animated: true, completion: nil)
            
            return
        case 2...3: // Если нажали на ячейки 2 или 3 не подымаем UIAlertAction, а переходим на экран с полной картой и отображением ресторана, представившего этот рецепт.
            
            return
        default:
            fatalError("Ошибка при нажатии на ячейку с Map")
        }
    }
    
    // MARK: - Готовим segue и перебрасываем в него данные
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMap" {
            let destinationController = segue.destination as! MapViewController
            destinationController.recipe = recipe
            
            let backItem = UIBarButtonItem()
                backItem.title = "Recipe book"
                navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
            
        } else if segue.identifier == "rateIt" || segue.identifier == "rateIt2" {
            let destinationController = segue.destination as! RateViewController
            destinationController.recipe = recipe
        }
    }
}
