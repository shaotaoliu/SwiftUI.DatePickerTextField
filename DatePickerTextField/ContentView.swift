import SwiftUI

struct ContentView: View {
    @State private var contact = Contact()
    @State private var showInfo = false
    @State private var presented = false
    @State private var strHiredDate = ""
    
    var body: some View {
        Form {
            Section("Name") {
                TextField("Name", text: $contact.name)
            }
            
            Section("Birthday (UITextField)") {
                DatePickerTextField(placeholder: "Select Date", date: $contact.dob)
            }
            
            Section("Hired Date (DateField)") {
                DateField(placeholder: "Select Date", presented: $presented, date: $contact.hiredDate, value: $strHiredDate)
            }
            
            Section {
                Button("Save") {
                    showInfo = true
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .listRowBackground(Color(UIColor.systemGroupedBackground))
                .buttonStyle(.borderless)
                .sheet(isPresented: $showInfo) {
                    Text(contact.name)
                    
                    if let dob = contact.dob {
                        Text(dob, style: .date)
                    }
                }
            }
        }
        .calendarSheet(presented: $presented, value: $strHiredDate)
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
    var hiredDate: Date? = nil
}
