/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The start view.
*/

import SwiftUI
import HealthKit

struct StartView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    
    var workoutTypes: [HKWorkoutActivityType] = [.mindAndBody]
    
//    var body: some View {
//        NavigationView {
//            VStack {
//                Button(action: {
//                    workoutManager.selectedWorkout = workoutTypes[0]
//                    NavigationLink(destination: SessionPagingView(), label: {
//                        Text("")
//                    })
////                        .isDetailLink(false)
////                        .frame(width: 0, height: 0)
//                }, label: {
//                    Text("Start Workout")
//                })
//            }
//        }
//        .onAppear {
//            workoutManager.requestAuthorization()
//        }
//    }
    
    var body: some View {
        List(workoutTypes) { workoutType in
            NavigationLink(workoutType.name, destination: SessionPagingView(),
                           tag: workoutType, selection: $workoutManager.selectedWorkout)
            .padding(EdgeInsets(top: 15, leading: 5, bottom: 15, trailing: 5))
        }
        .listStyle(.carousel)
        //.navigationBarTitle("Workouts")
        .onAppear {
            workoutManager.requestAuthorization()
        }
    }
}


struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView().environmentObject(WorkoutManager())
    }
}

extension HKWorkoutActivityType: Identifiable {
    public var id: UInt {
        rawValue
    }

    var name: String {
        switch self {
        case .mindAndBody:
            return "Begin Session"
        default:
            return ""
        }
    }
}
