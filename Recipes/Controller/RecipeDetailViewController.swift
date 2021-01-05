//
//  RecipeDetailViewController.swift
//  FoodPin
//
//  Created by Alex on 09.09.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit
import CoreBluetooth
import CoreData

class RecipeDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CBCentralManagerDelegate, CBPeripheralDelegate {
    

    
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var headerView: RecipeDetailHeaderView!
    @IBAction func close(segue:UIStoryboardSegue){
        dismiss(animated: true, completion: nil)
    }
    var ratingChanged = "No rating yet"
    var recipe: RecipeMO!
    
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

                case "three":
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
    
    // MARK: - Kitchen scale
    
    let serviceKitchenUUID = CBUUID(string: "780A") //ID сервиса 780А для кухонных весов
    let kitchenScaleCharacteristicUUID = CBUUID(string: "8AA2")//UUID: 8AA2
    //Properties: Notify
    //Value 0x0C-0D-00-00-81-10-17-00 где 0D-00 - это вес
    
    // MARK: - Body scale
    /*  SCALE
     App -Search-> Device
     Device -Broadcast-> App
        Broadcast Information:
        [Service UUID] [Local Name]
     • Service UUID: 0x7892
     [Local Name]: [Flag]+[Model Name]
     Flag:
     ‘0’-Normal Mode
     ‘1’-Pairing Mode
        Model Name: 5 characters, e.g. ‘1257B’
        How to get the device into pairing mode:
        Press and hold the corresponding button on the device until you can see two ‘o’ jumping up and down on the display.
     
     App -Connect-> Device
     App -Read Device info-> Device
        Device Information:
     • [Manufacturer Name]
     • [Firmware Version]
     • [Hardware Version]
     • [Software Version]
     • [Serial Number]
     
     App -Enable Characteristics-> Device
        Characteristics UUID:
    • [0x8A81] [Write]: Information transfer from App to Device
    • [0x8A82][Indicate]: Information transfer from Device to App
    • [0x8A24][Indicate]: Weight measurement transfer from Device to App
    • [0x8A22][Indicate]: Body composition transfer from Device to App
    • [0x8A25][Notify]: Weight measurement transfer from Device to App
     
     //Pairing Device
     Device -Password-> App
     Password:
     [Characteristics UUID] [Command] [Password]
     • [Characteristics UUID]: 0x8A82
     • [Command]: 0xA0
     • [Password]: 4 bytes. If the App gets 0xA0 0xA4 0x39 0xCD 0x20, then it’s 0x20CD39A4
     App -Account ID-> Device
     Account ID:
     [Characteristics UUID] [Command] [Account ID]
     • [Characteritics UUID]: 0x8A81
     • [Command]: 0x21
     • [Account ID]: 4 bytes, e.g. 0x78DF094B. The Account ID should be unique for each App account and should be sent as 0x21 0x4B 0x09 0xDF 0x78
     //Random Number:
     Device -Random Number-> App
     [Characteristics UUID] [Command] [Random Number]
     • [Characteristics UUID]: 0xA82
     • [Command]: 0xA1
     • [Random Number]: 4 bytes. If gets 0xA1 0x48 0xFE 0x90 0xAB, then it’s 0xAB90FE48.
     
     //Verification Code:
     App -Verification code-> Device
     Characteristics UUID] [Command] [Verification Code]
     • [Characteristics UUID]: 0x8A81
     • [Command]: 0x20
     • [Verification Code]: 4 bytes, e.g. [Password]=0x20CD39A4 XOR [Random
     Number]=0xAB90FE48, then [Verification Code]=0x8B5DC7
     • It should be sent as below 0x20 0xEC 0xC7 0x5D 0x8B

     //Verification
     Device -Verification code-> App
     If the verification code is correct, then it can go to the next step, or the Bluetooth connection will disconnect.
     
     //User№ & Name
     Device -User№ & Name-> App
     [Characteristics UUID] [Command] [User No.&Name]
     • [Characteristics UUID]: 0x8A82
     • [Command]: 0x83
     • [User No.&Name]
        : User No.[Byte1]:
     [0x01]...[0x08]: User 1 ... User 8
     [Other value]: Invalid
     User Name[Byte2-19]: 18 characters in ASCII
     
     //Connect User
     App -Connect User-> Device
     [Characteristics UUID] [Command] [Connect User]
     • [Characteristics UUID]: 0x8A81
     • [Command]: 0x03
     • [Connect User]:
     User No.[Byte1]:
     [0x01]...[0x08]: User 1 ... User 8 [Other value]: Invalid
     User Name[Byte2-19]: 18 characters in ASCII, utf8s type.
     • If you need to connect User 1 and name it as John, then it should be sent as below 0x03 0x01 0x4A 0x6F 0x6B 0x6E 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20
     0x20 0x20 0x20 0x20
     
     //User Profile
     App -User Profile-> Device
     [Characteristics UUID] [Command] [User Profile]
     • [Characteristics UUID]: 0x8A81
     • [Command]: 0x51
     • [User Profile]:
        Flag[Byte1]: 0x07
        User №[Byte2]: [0x01]...[0x08]: User 1 ... User 8 [Other value]: Invalid
     Gender[Byte3]:
        [0x01]: Male, Normal
        [0x02]: Female, Normal
        [0x03]: Male, Athlete
        [0x04]: Female, Athlete
        [Other value]: Invalid
     Age[Byte4]: [unit8], e.g. 30 years old, then it’s 0x1E
     Height[Byte5-6]: Always in meter[SFLOAT], e.g. 1.853m and 1.853 x 10^3=1853, then byte5=0x3D, byte6=0x07 OR 0xD0=0xD7.
     D means there are three decimal places
     • So the profile of User 1 can be set up as below
     0x51 0x07 0x01 0x01 0x1E 0x 0x3D 0xD7
     
    //Time Offset - вычисление времени взвешивания
    App -Time Offset-> Device
     [Characteristics UUID] [Command] [Time Offset]
     • [Characteristics UUID]: 0x8A81
     • [Command]: 0x02
     • [Time Offset]: 4 bytes, e.g. 0x0AF8D1D0
     
     How to calculate the time offset:
     • The base time is always 0:00:00 1st Jan 2010.
     • In case the current time is 13:00:00 1st Nov 2015.
     • The time offset is 365+365+366+365+365+304+13/24 days. • In second the time offset is 184,078,800 = 0x0AF8D1D0
     • The complete command should be
     0x02 0xD0 0xD1 0xF8 0x0A
     
     App -Enable Disconnection-> Device
     Enable Disconnection:
     [Characteristics UUID] [Command]
     • [Characteristics UUID]: 0x8A81
     • Command: 0x22
     
     App -Bluetooth Disconnected-> Device
     Bluetooth Disconnected:
     The pairing is finished after “[ ]” is shown on the display of the device.
     The App shouls store the Password, Model Name, Serial Number, Mac Address, etc for the next connection. The device will disconnected after getting Enable Disconnection Command.
     
     // MARK: - Normal Use
     App -Search-> Device
     Broadcast Information:
     [Service UUID] [Local Name]
     • Service UUID: 0x7892
     • [Local Name]: [Flag]+[Model Name]+[Account ID]
     Flag: ‘0’-Normal Mode ‘1’-Pairing Mode
     Model Name: 5 characters, e.g. ‘1144B’
     Account ID: 8 characters. In case the Account ID the device got is 0x78DF094B then it should be ’4’ ‘B’ ‘0’ ‘9’ ‘D’ ‘F’ ‘7’ ‘8’ in the broadcast information.
     
     Device -Broadcast-> App
     How to get the scale into normal mode:
     • Press the unit button at the back of the scale to turn it on.
     • Step on the scale to turn it on.
     
     App -Connect-> Device
     Connect:
     • Please verify the Service UUID before connect
     • Please verify the Account ID before connect
     
     App -Enable Characteristics-> Device
     Characteristics UUID:
     • [0x8A81][Write]: Information transfer from App to Device
     • [0x8A82][Indicate]: Information transfer from Device to App
     • [0x8A24][Indicate]: Weight measurement transfer from Device to App
     • [0x8A22][Indicate]: Body composition transfer from Device to App
     • [0x8A25][Notify]: Weight measurement transfer from Device to App
     
     Device -Random Number-> App
     Random Number:
     [Characteristics UUID] [Command] [Random Number]
     • [Characteristics UUID]: 0x8A82
     • [Command]: 0xA1
     • [Random Number]: 4 bytes. If gets 0xA1 0x48 0xFE 0x90 0xAB, then it’s 0xAB90FE48
     
     App -Verification Code-> Device
     Verification Code:
     [Characteristics UUID] [Command] [Verification Code]
     • [Characteristics UUID]: 0x8A81
     • [Command]: 0x20
     • [Verification Code]: 4 bytes, e.g. [Password]=0x20CD39A4 XOR [Random
     Number]=0xAB90FE48, then [Verification Code]=0x8B5DC7EC
     • It should be sent as below 0x20 0xEC 0xC7 0x5D 0x8B
     
     Verification:
     If the verification code is correct, then it can go to the next step, or the Bluetooth connection will disconnect.
     
     App -Time Offset-> Device
     Time Offset:
     [Characteristics UUID] [Command] [Time Offset]
     • [Characteristics UUID]: 0x8A81
     • [Command]: 0x02
     • [Time Offset]: 4 bytes, e.g. 0x0AF8D1D0
     
     How to calculate the time offset:
     • The base time is always 0:00:00 1st Jan 2010.
     • In case the current time is 13:00:00 1st Nov 2015.
     • The time offset is 365+365+366+365+365+304+13/24 days. • In second the time offset is 184,078,800 = 0x0AF8D1D0
     • The complete command should be
     0x02 0xD0 0xD1 0xF8 0x0A
     
     Device -User Profile-> App
     User Profile:
     [Characteristics UUID] [Command] [User Profile]
     • [Characteristics UUID]: 0x8A82
     • [Command]: 0xC0
     • [Measurement Data]:
     Flag[Byte1]: x07
     User No.[Byte2]:
     [0x01]...[0x08]: User 1 ... User 8
     [Other value]: Invalid
     Gender[Byte3]:
     [0x01]: Male, Normal
     [0x02]: Female, Normal
     [0x03]: Male, Athlete
     [0x04]: Female, Athlete
     [Other value]: Invalid
     Age[Byte4]: [unit8], e.g. 30 years old, then it’s 0x1E
     Height[Byte5-6]: Always in meter[SFLOAT], e.g. byte5=0x3D, byte6=0xD7, then
     0x073D x 10^-[(~D)+1]=1.853m
     
     App <-User Profile-> Device
     User Profile Update:
     The App needs to compare the received user profile with the one on itself.
     • If they are the same, then no update is needed and please go to the next steps.
     • If they are NOT the same, the App should give the users a chance to decide which one
     they would like to keep. With Command 0x51, the user profile can be updated from the App.
     
     Device -Weight Data-> App
     Measurement Data:
     [Characteristics UUID] [Weight Data]
     • [Characteristics UUID]: 0x8A24
     • [Weight Data] Flag[Byte1]:
     Bit6Bit5: [00] kg, [01] LB, [10] St. The current unit on the scale.
     Others: Reserved
     Weight[Byte2-5]: Always in kilogram. If byte2=0xC2, byte3=0x1A, byte4=0x00
     byte5=0xFE, then the weight is 0x001AC2 x 10^[-(~0xFE+1)] = 68.5kg
     
     Time Stamp[Byte6-9]: Always in second. If byte6=0xD0, byte7=0xD1, byte8=0xF8,
     byte9=0x0A, it means 184,078,800 second has passed from the base time 0:00:00 1st Jan 2010.
     Weight Difference[Byte10-13]: Reserved
     Impedance2[Byte14-17]: Always in Ohm. If byte14=0x77, byte15=0x15, byte16=0x00, byte17=0xFF, then the impedance is 0x001577 x 10^[-(~0xFF+1) 549.5Ohm.
     User ID[Byte18]:
     [0x01]...[0x08]: User 1 ... User 8 [Other value]: Invalid
     Weight Status[Byte19]:
     Bit0: [0] Unstable, [1] Stable Bit3-1: [000] Idle
     [001] Processing
     [010] Measuring with shoes
     [011] Measuring with bare feet
     [100] Measuring Complete
     [101] Error
     Others: Reserved
     
     Device -Body Composition-> App
     Body Composition:
     [Characteristics UUID] [Body Composition]
     • [Characteristics UUID]: 0x
     • [Body Composition] Flag[Byte1]: 0x6D
     Time Stamp[Byte2-5]: Always in second. If byte2=0xD0, byte3=0xD1, byte4=0xF8, byte5=0x0A, it means 184,078,800 second has passed from the base time 0:00:00 1st Jan 2010.
     User ID[Byte6]:
     [0x01]...[0x08]: User 1 ... User 8 [Other value]: Invalid
     Body Fat[Byte7-8]: If byte7=0x69, byte8=0xF0, then the body fat is 0x0069x 10^[- (~0xF+1)] = 10.5%.
     Body Water[Byte9-10]: If byte9=0xBF, byte10=0xF2, then the body water is 0x02BFx 10^[-(~0xF+1)] = 70.3%.
     Muscle Mass[Byte11-12]: If byte11=0x95, byte12=0xF1, then the muscle mass is 0x0195x 10^[-(~0xF+1)] = 40.5%.
     Bone Weight[Byte13-14]: Always in kilogram. If byte13=0x19, byte14=0xF0, then
     the bone weight is 0x0019x 10^[-(~0xF+1)] = 2.5kg
    */
    let serviceBodyUUID = CBUUID(string: "7892") //ID сервиса 780А для напольных весов
        let bodyScaleCharacteristicUUID = CBUUID(string: "8A82")//UUID: 8AA2
        
    @IBOutlet weak var weightLabel: UILabel!
    
   
    // MARK: - Central manager delegate
    func  centralManagerDidUpdateState(_ central: CBCentralManager)  {
        if central.state == .poweredOn { //Проверяем, включен ли Bluetooth на телефоне. Если не выключен, то выводится системное сообщение о необходимостиadvertisementData  его включить.
            centralManager.scanForPeripherals(withServices: [serviceKitchenUUID], options: nil)
            print("Power is ON \n \(#file) Функция \(#function ) строка \(#line)")
            print("centralManager \(String(describing: centralManager)) \n")
            
        }
    }

    func centralManager (_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        //Сканируем наш девайс в эфире.
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
        peripheral.discoverServices([serviceKitchenUUID])
//        print("\(#file) Функция \(#function ) строка \(#line)")
//        print("centralManager \(String(describing: peripheral)) \n")
    }
    // MARK: - Peripheral delegate
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices eror: Error?) {
        if let service = peripheral.services?.first(where: { $0.uuid == serviceKitchenUUID
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
            let weight = data.withUnsafeBytes { $0.load(as: Int.self) }  >> 8 & 0xFFFFFF //В data приходит сразу много данных для более эффективного использования канала передачи данных. Например, первые 8 бит согласно спецификации - это Flag - выбор типа данных (граммы, унции, фунты и т.д.). Далее идут данные веса в гр в uint24, если Flag = 00. Далее данные веса в LB в uint8, если Flag = 01, далее данные веса в OZ в SFLOAT, если Flag = 10 (наверное) и так далее.
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
        headerView.recipeName.text = recipe.recipeName //recipe.recipeName
        headerView.recipeImageView.image = UIImage(data: recpeImage as Data) //UIImage(named: recipe.recipeImage)
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
            cell.recipeDescriptionLabel.text = recipe.recipeBrief
            cell.selectionStyle = .none
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RecipeIngredientsCell.self), for: indexPath) as! RecipeIngredientsCell
            cell.recipeIngredientsLabel.text = recipe.recipeIngredients[1]
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
                
                var defaultText = ""
                defaultText = defaultText + "Рекомендую попробовать:" + "\n" + self.recipe.recipeName + "\n" + "Кухня: "
                
                defaultText = defaultText + self.recipe.recipeType + "\n" + "Автор рецепта: " + self.recipe.recipeAuthorLocations + "\n" + "Способ приготовления: " + "\n"
                
                defaultText = defaultText + self.recipe.recipeBrief + "\n\n" + "Состав блюда:" + "\n"
                
                defaultText = defaultText + self.recipe.recipeIngredients + "\n\n" + "Рецепт доступен в мобильном приложении:" + "\n" + "https://apps.apple.com/ru/app/ready-for-sky/id927991375" + "\n\n" + "https://play.google.com/store/apps/details?id=com.readyforsky"
                
                let activityController: UIActivityViewController
                
                if let defaultPicture = UIImage(data: recpeImage as Data) //UIImage(named: self.recipe.recipeImage)
                { activityController = UIActivityViewController(activityItems: [ defaultText, defaultPicture], applicationActivities: nil) }
                else
                { activityController = UIActivityViewController(activityItems: [ defaultText], applicationActivities: nil) }
                /*if let recipeImage = self.recipe[indexPath.row].image,
                let imageToShare = UIImage(data: recipeImage as Data) {*/
                
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
