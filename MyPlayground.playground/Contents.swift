import UIKit
import Foundation

// ALUNO: ROSEMBERG TORRES NUNES

/*
 Task 1
 
 Calcule a média, moda e mediana de um array de doubles.
 */

class Calculator {
    
    func mean(numbers: [Double]){
        var meanValue: Double = 0.0
        numbers.forEach { (value) in
            meanValue += value
        }
        print("Média: \(meanValue/Double(numbers.count))")
    }
    
    func median(numbers: [Double]){
        numbers.sorted(by: <)
        
        if numbers.count % 2 == 0 {
            let half = numbers.count / 2
            let value = (numbers[half] + numbers[half+1]) / 2
            print("Mediana: \(value)")
        } else {
            let index = Double(Double(numbers.count)/2)
            let rounded = Int(index.rounded())
            print("Mediana: \(numbers[rounded])")
        }
    }
    
    func mode(numbers: [Double]){
        var location: Int = 0
        var frequency: Int = 0
        var temp: Int = 0
        
        for index in 0..<numbers.count {
            for value in numbers {
                if numbers[index] == value {
                    temp += 1
                }
            }
            if frequency < temp {
                frequency = temp
            }
            
            temp = 0
        }
        
        for index in 0..<numbers.count {
            for value in numbers {
                if numbers[index] == value {
                    temp += 1
                }
            }
            if frequency == temp {
                location = index
            }
            temp = 0
        }
        
        print("\(numbers[location]) " + " \(frequency)")
    }
}
print("\n")
let calculator = Calculator()
calculator.mean(numbers:[2.0, 4.0, 6.0, 8.0, 10.0])
calculator.median(numbers:[4.0, 2.0, 2.0, 6.0, 8.0, 8.0, 10.0, 9.0, 10.0, 1.0])
calculator.mode(numbers:[4.0, 2.0, 2.0, 6.0, 8.0, 8.0, 10.0, 9.0, 10.0, 0.0, 1.0, 1.0])

/*
 Task 2
 
 Crie 3 classes, para simbolizar tipos diferentes de strings: EmptyString ReversedString, PeLanguageString.
 As classes devem herdar de um protocol chamado: StringContract.
 Ele deverá conter 1 único método chamado transformInto() -> String.
 Ele também deve ter uma variável chamada: stringValue do tipo String.
 O transformIndo da EmptyString deve retornar uma string vazia.
 O transformIndo da ReversedString deve retornar a string invertida do atributo stringValue.
 O transformIndo da PeLanguage deve transforma a string seguindo a lógica da língua do P.
 Lógica da lingua do P: A cada 2 letras ou espaços ou final de palavra, adicionar a sílaba "pe".
 Exemplo: "a aula foi boa" vira "ape peaupelape pefopeipe pebopeape.
 */

protocol StringContract {
    
    var stringValue: String { get set }
    
    func transformInto() -> String
}

class EmptyString: StringContract {
    var stringValue: String = ""
    
    func transformInto() -> String {
        return stringValue
    }
}

class ReversedString: StringContract {
    var stringValue: String = "Rosemberg Torres Nunes"
    
    func transformInto() -> String {
        let toLowerCased = stringValue.lowercased()
        let toReversed = String(toLowerCased.reversed())
        return toReversed.capitalized
    }
}

class PeLanguageString: StringContract {
    var stringValue: String = "A aula foi boa"
    
    func transformInto() -> String {
        let splitValue = stringValue.split(separator: " ")
        var peString = ""
        
        splitValue.forEach { (word) in
            if word.count > 2 {
                peString += " \(word.enumerated().compactMap({ ($0 > 0) && ($0 % 2 == 0) ? "pe\($1)" : "\($1)" }).joined())"
            } else {
                peString += " \(word.enumerated().compactMap({ ($0 > 0) && ($0 % 2 == 0) ? "\($0)pe" : "\($1)" }).joined())"
            }
        }
        
        var peStringSplit = peString.split(separator: " ")
        
        peString = ""
        for count in 0..<peStringSplit.count {
            if count == 0 {
                peString += "\(peStringSplit[count])pe "
            } else {
                peString += "pe\(peStringSplit[count])pe "
            }
        }
        
        return peString
    }
}
print("\n")
print(EmptyString().transformInto())
print(ReversedString().transformInto())
print(PeLanguageString().transformInto())

/*
 Task 3
 
 Crie classes e structs necessárias para implementar uma Lista encadeada.
 A lista deve ser composta por um Nó de Inteiros.
 A lista deve possuir métodos para:
 - inserção de um elemento ao final da lista, em uma dada posição da lista, deleção de elemento da lista de uma dada posição.
 */

/*
 Task 4
 
 Crie uma pilha com operações de push, pop e visualização dos elementos da pilha.

 */

/*
 Task 5
 
 Crie uma extensão da classe String para inverter uma instância de String.
 */

extension String {
    func toReversed(_ value: String) -> String {
        var newValue = ""
        
        value.forEach { (character) in
            newValue = "\(character)" + newValue
        }
        
        return newValue
    }
}
print("\n")
let name = String().toReversed("Rosemberg Torres Nunes")
print(name)

/*
 Task 6
 
 Implemente uma função que retorne o reduce dos dados,
 dado um array de inteiros de entrada e uma função lambda de redução.
 Exemplo:
 a. Entrada [ 1,2,3,4,5];
 b. Função de redução: soma comum de todos os termos
 c. Saída : 15
 d. PS: faça a lógica ser dinâmica para comportar qualquer função de redução informada pelo programador
 */

class ReduceFunction {
    func fReduce(numbers: [Int], with completion: (Int) -> Int) -> Int {
        return numbers.reduce(0, { x, y in
            x + y
        })
    }
}
print("\n")
let rdc = ReduceFunction().fReduce(numbers: [2, 4, 6, 8, 10]) { (result) -> Int in
    return result
}
print(rdc)

/*
 Task 7
 
 Crie uma função de flatmap em que um array de listas de inteiros entrará como parâmetro
 e como saída será um único array composto por todos os elementos de todas as listas internas do array de listas informado da entrada.
 */

func flatMapFunc(value: [[Int]]) -> [Int]{
    return Array(value.joined())
}
print("\n")
let result = flatMapFunc(value: [[1, 3, 5, 7, 9], [0, 2, 4, 6, 8, 10]]).sorted()
print(result)


/*
 Task 8
 
 Implemente uma calculadora científica (classe ScientificCalculator) com métodos para executar as 4 operações
 básicas, cálculo de seno, cosseno, tangente, raiz quadrada, exponencial, fatorial e logaritmo natural.
*/

class ScientificCalculator {
    
    func calculateAddition(first: Int, second: Int) {
        print("\(first + second)")
    }
    
    func calculateDivision(first: Int, second: Int) {
        print("\(first / second)")
    }
    
    func calculateMultiplication(first: Int, second: Int) {
        print("\(first * second)")
    }
    
    func calculateSubtraction(first: Int, second: Int) {
        print("\(first - second)")
    }
    
    func calculateSin(value: Double) {
        print("\(sin(value))")
    }
    
    func calculateCos(value: Double) {
        print("\(cos(value))")
    }
    
    func calculateTang(value: Double) {
        print("\(tan(value))")
    }
    
    func calculateSquareRoot(value: Double) {
        print("\(value.squareRoot())")
    }
    
    func calculateExpo(first: Double, second: Double) {
        print("\(pow(first, second))")
    }
    
    func calculateFat(value: Int) {
        
        if(value < 0){
            print("-1")
        } else if(value == 0){
            print("1")
        } else {
            var result = 1
            for count in 1...value {
                result = result * count
            }
            print(result)
        }
    }
    
    func calculateLogNatural(value: Double) {
        print("\(log(value))")
    }
}
print("\n")
let scientificCalculator = ScientificCalculator()
scientificCalculator.calculateAddition(first: 2, second: 2)
scientificCalculator.calculateMultiplication(first: 5, second: 2)
scientificCalculator.calculateDivision(first: 10, second: 2)
scientificCalculator.calculateSubtraction(first: 10, second: 2)
scientificCalculator.calculateSquareRoot(value: 25)
scientificCalculator.calculateSin(value: 72)
scientificCalculator.calculateCos(value: 72)
scientificCalculator.calculateTang(value: 72)
scientificCalculator.calculateExpo(first: 3, second: 3)
scientificCalculator.calculateFat(value: 5)
scientificCalculator.calculateLogNatural(value: 10)

