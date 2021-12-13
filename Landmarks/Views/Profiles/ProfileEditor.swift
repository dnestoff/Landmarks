//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Third User on 12/13/21.
//

import SwiftUI


// To make it so edits don’t take effect until after the user exits edit mode, you use the draft copy of their profile during editing, then assign the draft copy to the real copy only when the user confirms an edit
struct ProfileEditor: View {
    // include a binding to the draft copy of the user’s profile
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
            let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
            let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
            return min...max
        }

    
    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications").bold()
            }
            
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Seasonal Photo").bold()
                
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    // make the landmark photos have a selectable preferred season
                    ForEach(Profile.Season.allCases) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            // make the landmark visitation goal date modifiable
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Goal Date").bold()
            }

        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
