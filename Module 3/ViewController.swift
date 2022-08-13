//
//  ViewController.swift
//  Module 3
//
//  Created by Влад Бокин on 12.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Tasks
        task1()
        task2()
        task3_4()
       
    }
    // MARK: - Task 1
    func task1() {
        
        //Написать простое замыкание в переменной myClosure, замыкание должно выводить в консоль фразу "I love Swift". Вызвать это замыкание. Далее написать функцию, которая будет запускать заданное замыкание заданное количество раз. Объявить функцию так: func repeatTask (times: Int, task: () -> Void). Функция должна запускать times раз замыкание task . Используйте эту функцию для печати «I love Swift» 10 раз.

        let myClosure = {
            print("I love Swift!")
        }
        
        func repeatTask(times: Int, task: () -> Void) {
            var i = 0
            while i < times {
                i += 1
                print("№\(i)")
                task()
                
            }
        }
        
        repeatTask(times: 10, task: myClosure)
    }
    
    // MARK: - Task 2
    func task2() {
        
    //Условия: есть начальная позиция на двумерной плоскости, можно осуществлять последовательность шагов по четырем направлениям up, down, left, right. Размерность каждого шага равна 1. Создать перечисление Directions с направлениями движения. Создать переменную location с начальными координатами (0,0), создать массив элементами которого будут направления из перечисления. Положить в этот массив следующую последовательность шагов: [.up, .up, .left, .down, .left, .down, .down, .right, .right, .down, .right]. Програмно вычислить какие будут координаты у переменной location после выполнения этой последовательности шагов.

        var location: (x: Int, y: Int) = (x: 0, y: 0)
        
        enum Directions {
            case up
            case down
            case left
            case right
        }
        
        let stepsArray: [Directions] = [.up, .up, .left, .down, .left, .down, .down, .right, .right, .down, .right]
        
        func findLocation(currentLocation: inout (x: Int, y: Int), stepsDirection: [Directions]) {
            
            for step in stepsDirection {
                switch step {
                case .up:
                    currentLocation.y += 1
                case .down:
                    currentLocation.y -= 1
                case .left:
                    currentLocation.x -= 1
                case .right:
                    currentLocation.x += 1
                }
                //print("\(step) \(currentLocation)")
            }
        }
        
        findLocation(currentLocation: &location, stepsDirection: stepsArray)
        print(location)
    }
    
}

// MARK: - Task 3
// Создать класс Rectangle с двумя неопциональными свойствами: ширина и длина. Реализовать в этом классе метод вычисляющий и выводящий в консоль периметр прямоугольника. Создать экземпляр класса и вызвать у него этот метод.

class Rectangle {
   
   var width = 0.0
   var height = 0.0
   
   func perimetr() {
       print("Периметр равен: \((width * 2) + (height * 2))")
   }
   
   init(width: Double, height: Double) {
       self.width = width
       self.height = height
   }
}

let myRect = Rectangle(width: 10, height: 15)

// MARK: - Task 4
//Создать расширение класса Rectangle, которое будет обладать вычисляемым свойством площадь. Вывести в консоль площадь уже ранее созданного объекта.

extension Rectangle {
    var square: Double {
        return self.width * self.height
    }
}

func task3_4() {
    myRect.perimetr()
    print("Площадь равна: \(myRect.square)")
}

