import SwiftUI

struct ContentView: View {
    @State private var showingAddDeviceScreen = false
    @State private var showingSyncAlert = false
    @State private var showingSceneControlScreen = false
    @State private var showingAutomationScreen = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                
                // 上方標題和快捷按鈕
                VStack {
                    HStack {
                        Text("My Home")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                }
                .padding(.horizontal)
                
                // 新增設備按鈕
                Button(action: {
                    showingAddDeviceScreen = true
                }) {
                    Text("新增設備")
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .sheet(isPresented: $showingAddDeviceScreen) {
                    AddDeviceView()
                }
                
                // 場景控制按鈕
                Button(action: {
                    showingSceneControlScreen = true
                }) {
                    Text("場景控制")
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green.opacity(0.2))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .sheet(isPresented: $showingSceneControlScreen) {
                    SceneControlView()
                }
                
                // 自動化設定按鈕
                Button(action: {
                    showingAutomationScreen = true
                }) {
                    Text("自動化設定")
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .sheet(isPresented: $showingAutomationScreen) {
                    AutomationView()
                }
                
                Spacer()
                
                // 底部導航欄
                HStack {
                    Spacer()
                    VStack {
                        Image(systemName: "house.fill")
                        Text("家庭")
                            .foregroundColor(.black)
                    }
                    Spacer()
                    VStack {
                        Image(systemName: "slider.horizontal.3")
                        Text("自動化")
                            .foregroundColor(.black)
                    }
                    Spacer()
                    VStack {
                        Image(systemName: "gearshape.fill")
                        Text("設定")
                            .foregroundColor(.black)
                    }
                    Spacer()
                }
                .padding()
                .background(Color.white)
            }
        }
    }
}

// 新增設備畫面
struct AddDeviceView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 20) {
            Text("新增設備")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("在此處模擬新增設備的流程")
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            
            Spacer()
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("完成")
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
        }
        .padding()
    }
}

// 場景控制頁面
struct SceneControlView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 20) {
            Text("場景控制")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            VStack(spacing: 16) {
                Button(action: {}) {
                    Text("回到家")
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green.opacity(0.2))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                Button(action: {}) {
                    Text("起床")
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                Button(action: {}) {
                    Text("離開家")
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red.opacity(0.2))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                Button(action: {}) {
                    Text("睡覺")
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.purple.opacity(0.2))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
            
            Spacer()
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("完成")
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
        }
        .padding()
    }
}

// 自動化設定頁面
struct AutomationView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isAutomationEnabled = false

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("取消")
                        .foregroundColor(.blue)
                }
                Spacer()
                Text("有人離開住家時")
                    .font(.headline)
                Spacer()
                Button(action: {
                    // 處理完成的動作
                }) {
                    Text("完成")
                        .foregroundColor(.blue)
                }
            }
            .padding(.horizontal)

            Toggle("啟用此自動化操作", isOn: $isAutomationEnabled)
                .padding()
                .background(Color(UIColor.systemGray5))
                .cornerRadius(10)
                .padding(.horizontal)

            TextField("有人離開住家時", text: .constant(""))
                .disabled(true)
                .padding()
                .background(Color(UIColor.systemGray5))
                .cornerRadius(10)
                .padding(.horizontal)

            VStack(alignment: .leading, spacing: 10) {
                Text("何時")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                
                HStack {
                    Image(systemName: "house.fill")
                        .foregroundColor(.blue)
                    Text("有人離開住家")
                        .fontWeight(.semibold)
                    Spacer()
                }
                .padding()
                .background(Color(UIColor.systemGray5))
                .cornerRadius(10)
                .padding(.horizontal)
            }

            Button(action: {
                // 選取配件和情境
            }) {
                HStack {
                    Text("選取配件和情境...")
                        .foregroundColor(.blue)
                    Spacer()
                }
                .padding()
                .background(Color(UIColor.systemGray5))
                .cornerRadius(10)
                .padding(.horizontal)
            }

            VStack(alignment: .leading, spacing: 10) {
                Text("情境")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                
                Text("將會設定這些情境。")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                
                HStack {
                    Image(systemName: "figure.walk.arrival")
                        .foregroundColor(.blue)
                    Text("回到家")
                        .fontWeight(.semibold)
                    Spacer()
                }
                .padding()
                .background(Color(UIColor.systemGray5))
                .cornerRadius(10)
                .padding(.horizontal)
            }

            Spacer()
        }
        .padding(.top)
    }
}

@main
struct SmartHomeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
