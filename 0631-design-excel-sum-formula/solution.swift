extension String {
    var parseKey: (row: Int, column: Character) {
        (row: Int(dropFirst())!, column: Character(String(prefix(1))))
    }
}

final class Cell {
    var numbers: [String] = []
    var value: Int = 0 
    var isDirty: Bool = false
}

private let colOrder: [Character] = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")

class Excel {
    private var sheet: [String: Cell] = [:]

    init(_ height: Int, _ width: Character) {
        guard let wIdx = colOrder.firstIndex(of: width) else { return }
        for col in colOrder.prefix(through: wIdx) {
            for row in 1...height {
                sheet["\(col)\(row)"] = Cell()
            }
        }
        // print(sheet)
    }
    
    func set(_ row: Int, _ column: Character, _ val: Int) {
        let key = "\(column)\(row)"
        guard let cell = sheet[key] else { return }
        markAsDirty()
        cell.numbers = []
        cell.value = val
        // print(key ,cell)
    }
    
    @discardableResult
    func get(_ row: Int, _ column: Character) -> Int {
        let key = "\(column)\(row)"
        guard let cell = sheet[key] else { return 0 }
        if !cell.numbers.isEmpty && cell.isDirty {
            cell.value = computeSum(cell.numbers)  
            cell.isDirty = false                   
        }
        return cell.value
        
    }
    
    @discardableResult
    func sum(_ row: Int, _ column: Character, _ numbers: [String]) -> Int {
        markAsDirty()
        let key = "\(column)\(row)"
        guard let cell = sheet[key] else { return 0 }

        cell.numbers = numbers
        let result = computeSum(numbers)
        cell.value = result
        return result
    }

    private func computeSum(_ numbers: [String]) -> Int {
        var result = 0
        for elem in numbers {
            if elem.contains(":") { // range like 
                let parts = elem.split(separator: ":").map { String($0) }
                let a = parts[0].parseKey
                let b = parts[1].parseKey
                precondition(a.column <= b.column, "column a should be smaller or equal to b")
                precondition(a.row <= b.row, "row a should be smaller than b")
                let colRange = colOrder.prefix(through: colOrder.firstIndex(of: b.column)!)
                    .drop(while: { $0 != a.column })
                for column in colRange {
                    for row in a.row...b.row {
                        let a = "\(column)\(row)".parseKey
                        result += get(a.row, a.column)
                    }
                }
            } else { // single cell
                let a = elem.parseKey
                result += get(a.row, a.column)
            }
        }
        return result
    }

    private func markAsDirty() {
        for key in sheet.keys {
            sheet[key]?.isDirty = true
        }
    }
}

/**
 * Your Excel object will be instantiated and called as such:
 * let obj = Excel(height, width)
 * obj.set(row, column, val)
 * let ret_2: Int = obj.get(row, column)
 * let ret_3: Int = obj.sum(row, column, numbers)
 */