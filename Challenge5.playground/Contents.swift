import UIKit

//различие в строках одинаковой длины, макс в три символа - true
func checkTheDifference(first: String, second: String) -> Bool {
    guard first.count == second.count else { return false } //количество символов в строках равное
    let firstArray = Array(first) //массив символов из строки
    let secondArray = Array(second)
    var differences = 0 //счетчик
    
    for (index, letter) in firstArray.enumerated() { //enumerated возвращает пару[индекс,значение]
        if secondArray[index] != letter { //индекс второго массива!=значению индекса первого массива
            differences += 1
            if differences == 4 {
                return false
            }
        }
    }
    return true
}

checkTheDifference(first: "bbbutyv", second: "bbbrwsp")


//поиск макс длинного префикса
//в строке слова, разделенные пробелом("swim swill switch - "swi")

import Foundation

func prefix(input: String) -> String {
    let parts = input.components(separatedBy: " ") //исх/строку будем представлять как массив строк
    guard let first = parts.first else { return "" } //первый элемент массива parts, тк опционал проверяем на nill duardом
    
    var currentPrefix = "" // текущий префикс
    var maxPreffix = "" // макс длинный
    
    for letter in first { //по первому слову
        currentPrefix.append(letter) // добавляем первую букву
        
        for word in parts { //идем по словам в массиве
            if !word.hasPrefix(currentPrefix) { //если слово содержит=префикс=currentPrefix
                return maxPreffix //если не содержит,то возвращаем макс
            }
        }
        maxPreffix = currentPrefix //то добавляем букву
    }
    return maxPreffix
}
prefix(input: "swim swill switch")


//количество повторений символов в строке
//"eee!!!" = "e3!3"

func howManyTimes(input: String) -> String {
    var currentLetter: Character?
    var returnValue = ""
    var letterCounter = 0
    
    for letter in input {
        if letter == currentLetter {
            letterCounter += 1
        } else {
            if let current = currentLetter {
                returnValue.append("\(current)\(letterCounter)")
            }
            currentLetter = letter
            letterCounter = 1
        }
    }
    if let current = currentLetter {
        returnValue.append("\(current)\(letterCounter)")
    }
    return returnValue
}

howManyTimes(input: "  acccwee")
