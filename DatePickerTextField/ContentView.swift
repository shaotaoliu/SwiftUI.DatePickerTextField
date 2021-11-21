import SwiftUI

struct ContentView: View {
    @State private var contact = Contact()
    @State private var showInfo = false
    
    var body: some View {
        Form {
            Section("Name") {
                TextField("Name", text: $contact.name)
            }
            
            Section("Birthday") {
                DatePickerTextField(placeholder: "Select Date", date: $contact.dob)
            }
            
            Section {
                Button("Save") {
                    showInfo = true
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .listRowBackground(Color(UIColor.systemGroupedBackground))
                .sheet(isPresented: $showInfo) {
                    Text(contact.name)
                    
                    if let dob = contact.dob {
                        Text(dob, style: .date)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Contact {
    let id = UUID()
    
    var name = ""
    var dob: Date? = nil
}
