//
//  LockInView.swift
//  LiLo
//
//  Created by Darren Thiores on 02/04/24.
//

import SwiftUI
import LocalAuthentication

struct LockInView: View {
    @Binding var state: HomeState
    let onEvent: (HomeEvent) -> Void
    
    private var lockers: [LockerResponse] {
        switch state.selectedArea {
        case .AreaA:
            state.areaA.lockers
        case .AreaB:
            state.areaB.lockers
        case .AreaC:
            state.areaC.lockers
        case .AreaD:
            state.areaD.lockers
        }
    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 0) {
                AreaRow(
                    selectedArea: state.selectedArea,
                    areaA: state.areaA,
                    areaB: state.areaB,
                    areaC: state.areaC,
                    areaD: state.areaD,
                    onClick: { area in
                        onEvent(.SelectArea(area: area))
                    },
                    proxy: proxy
                )
                
                Spacer()
                    .frame(height: 24)
                
                LockerList(
                    lockers: lockers,
                    selectedLocker: state.selectedLocker,
                    onClick: { locker in
                        onEvent(.SelectLocker(locker: locker))
                    }
                )
                
                Spacer()
                    .frame(height: 24)
                    .alert(isPresented: $state.showErrorAlert) {
                        Alert(
                            title: Text("Unexpected Error Appeared")
                                .font(.Headline),
                            message: Text(state.error ?? "Unexpected Error just appeared"),
                            dismissButton: .default(Text("Try Again").font(.Body))
                        )
                    }
                
                if let locker = state.selectedLocker {
                    var numberText: String {
                        if locker.number < 10 {
                            "0\(locker.number)"
                        } else {
                            "\(locker.number)"
                        }
                    }
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Selected Locker")
                                .font(.Headline)
                                .foregroundColor(.black)
                            
                            Text("\(locker.area) - \(numberText)")
                                .font(.LargeTitle)
                                .foregroundColor(
                                    state.selectedLocker?.status == 1 ? .darkTosca : .darkVermillion
                                )
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                    
                    Spacer()
                    
                    Text("Remember to place your belongings inside the locker before locking in")
                        .font(.Body2)
                        .padding(.horizontal, 60)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                        .frame(height: 24)
                    
                    Button {
                        onEvent(.ShowConfirmationAlert)
                    } label: {
                        Text("Lock In")
                            .font(.Headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 48)
                    }
                    .tint(Color.darkTosca)
                    .padding(.horizontal, 16)
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(
                        .roundedRectangle(radius: 10)
                    )
                    .disabled(state.selectedLocker?.status == 2)
                    .alert(isPresented: $state.showConfirmationAlert) {
                        Alert(
                            title: Text("Lock in this locker?")
                                .font(.Headline),
                            message: Text(
                                "Remember to place your belongings inside the locker before locking in"
                                )
                                .font(.Body2),
                            primaryButton: .destructive(
                                Text("No")
                                    .font(.Body),
                                action: {
                                    onEvent(.DismissConfirmationAlert)
                                }
                            ),
                            secondaryButton: .default(
                                Text("Yes")
                                    .font(.Body)
                                    .fontWeight(.semibold),
                                action: {
                                    onEvent(.DismissConfirmationAlert)
                                    //onEvent(.LockIn)
                                    authenticate()
                                }
                            )
                        )
                    }
                    
                    Spacer()
                        .frame(height: 16)
                    
                    Button {
                        onEvent(.ShowReportAlert)
                    } label: {
                        Text("Report Locker")
                            .font(.Headline)
                            .foregroundColor(Color.darkVermillion)
                            .frame(maxWidth: .infinity, minHeight: 48)
                    }
                    .background(
                        RoundedRectangle(
                            cornerRadius: 10,
                            style: .continuous
                        )
                        .stroke(Color.vermillion, lineWidth: 2)
                        
                    )
                    .padding(.horizontal, 16)
                    .alert(isPresented: $state.showReportAlert) {
                        Alert(
                            title: Text("Report this locker?")
                                .font(.Headline),
                            message: Text(
                                "Reporting this locker will change the locker availability status"
                                )
                                .font(.Body2),
                            primaryButton: .destructive(
                                Text("No")
                                    .font(.Body),
                                action: {
                                    onEvent(.DismissReportAlert)
                                }
                            ),
                            secondaryButton: .default(
                                Text("Yes")
                                    .font(.Body)
                                    .fontWeight(.semibold),
                                action: {
                                    onEvent(.DismissReportAlert)
                                    
                                    if state.selectedLocker?.status == 1 {
                                        onEvent(.ReportFilled)
                                    } else {
                                        onEvent(.ReportEmpty)
                                    }
                                }
                            )
                        )
                    }
                }
            }
            .padding(.vertical, 24)
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Make sure that you're managing you own locker"

            context.evaluatePolicy(
                .deviceOwnerAuthenticationWithBiometrics,
                localizedReason: reason
            ) { success, authenticationError in
                if success {
                    onEvent(
                        .LockIn
                    )
                } else {
                    print(authenticationError?.localizedDescription ?? "Verification failed")
//                    onEvent(
//                        .AuthenticationError(message: authenticationError?.localizedDescription ?? "We can't verify your identity")
//                    )
                }
            }
        } else {
            onEvent(
                .AuthenticationError(message: error?.localizedDescription ?? "Please, make sure to enable biometrics verification")
            )
        }
    }
}

#Preview {
    LockInView(
        state: .constant(
            HomeState(
               areaA: .init(
                   lockers: Dummy.lockers
               ),
               selectedLocker: Dummy.lockers[2]
           )
        ),
        onEvent: { _ in }
    )
}
