

import UIKit
import CoreData

class ProgramViewController: UITableViewController {
    
    var context: NSManagedObjectContext!
    
    var programs = ["1. Приседания: 20х10; 50x8; 60x8/2 \n2. Разгибание ног сидя: 4x12 \n3. Cгибание ног лёжа: 3х12 \n4.Выпады в ходьбе с гантелями 10кг 6 шагов на каждую ногу 3 подхода \n5. Голень: 4х15", "1. Жим лёжа: 20х12; 50х8; 60х8; 70x8 два подхода \n2. Сведения в бабочке или кроссовере 4х12 \n3. Тяга вертикального блока сидя за голову 4х12 \n4. Тяга горизонтального блока к поясу сидя 5х12 \n5. Брусья 3х12", "1. Тяга горизонтального блока к поясу: 5х12 \n2. Шраги: 4х12 \n3. Разведения рук в бабочке 4х12 \n4. Тяга вертикального блока за голову: 4х12 \n5. Бицепс со штангой стоя: 5х12 \n6. Гиперэкстензия: 3х15"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return programs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "macCell", for: indexPath) as! ProgramTableViewCell
        
        cell.nameLabel.text = programs[indexPath.row]
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}


    

