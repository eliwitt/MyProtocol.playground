//: Playground - noun: a place where people can play

import Cocoa
//
// exercise type hold basic info for the given activity
//
protocol ExerciseType: CustomStringConvertible {
    var name: String { get }
    var caloriesBurned: Double { get }
    var minutes: Double { get }
}
//
// an elliptical exercise
//
struct EllipticalTrainer: ExerciseType {
    let name = "Elliptical Machine"
    let caloriesBurned: Double
    let minutes: Double
}
//
// a running exercise
//
struct Treadmill: ExerciseType {
    let name = "Treadmill"
    let caloriesBurned: Double
    let minutes: Double
    let distanceInMiles: Double
}
//
// extend the base type of exercise type add a method
//
extension ExerciseType {
    var description: String {
        return "Exercise (\(name), burned \(caloriesBurned) calories in \(minutes) minutes)"
    }
    var caloriesBurnedPerMinute: Double {
        return caloriesBurned / minutes
    }
}
//
// now we add an extension for Treadmill's description
//
extension Treadmill {
    var description: String {
        return "Treadmill (\(caloriesBurned) calories and \(distanceInMiles) miles in \(minutes) mintues)"
    }
}
//
// extend sequence type to count the total calories for the exercises in the array(a.k.a. sequence)
//
extension SequenceType where Generator.Element == ExerciseType {
    func totalCaloriesBurned() -> Double {
        var total: Double = 0
        for exercise in self {
            total += exercise.caloriesBurned
        }
        return total
    }
}

var str = "Hello, playground"
// create an elliptical exercise
let ellipticalWorkout = EllipticalTrainer(caloriesBurned: 335, minutes: 30)
// create a running exercise
let runningWorkout = Treadmill(caloriesBurned: 350, minutes: 25, distanceInMiles: 4.2)

print(str)
// print the results of the elliptical
print(" My elliptical workout results cals \(ellipticalWorkout.caloriesBurned) in \(ellipticalWorkout.minutes)")
// using the extension cal the calories per min
print("I burned cals per min ", String(format: "%.2f", ellipticalWorkout.caloriesBurnedPerMinute))
print("I ran \(runningWorkout.distanceInMiles) miles today and burned \(runningWorkout.caloriesBurned) in \(runningWorkout.minutes) min")
print("I burned cals per min \(runningWorkout.caloriesBurnedPerMinute)")

// now create an array using the two exercises and cal the total of both 
let mondayWorkout: [ExerciseType] = [ellipticalWorkout, runningWorkout]
// now using the sequence extension cal the total fro the array
print("Your total cal burn from your routines is ", String(format: "%.0f", mondayWorkout.totalCaloriesBurned()))
//
// using CustomStringConvertible on our Exercise type and then adding the description in the extension we
// can do the following.  So what we have done is created c# Tostring function.
// Note that treadmill overrides the default Tostring type method.
//
print(ellipticalWorkout)
print(runningWorkout)
