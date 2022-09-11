//
//  InfoView.swift
//  Otters
//
//  Created by Vincent Nguyen on 9/10/22.
//

import SwiftUI

struct InfoView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack {
                VStack {
                    Text("Doctor's Notes")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .frame(height: 80)
                        .foregroundColor(.black)
                    
                    ScrollView {
                        VStack(alignment: .leading) {
                            Text("What is Diabetes?")
                                .font(.system(size: 28, weight: .bold, design: .rounded))
                                .padding(.top, 16)
                                .foregroundColor(.black)
                            Text("Diabetes occurs when there is too much sugar in your bloodstream. Our bodies need insulin to help move the sugar into our cells to give us energy. However, sometimes the insulin is not produced or made in small amounts in our body. This leads to an abundance of sugar/glucose in your bloodstream. Do not worry, you are not alone, about 1 in 10 otters have this disease as well. Further, it is very important to get treatment because untreated diabetes can lead to damage to the large blood vessels of the heart, brain and legs (macrovascular complications) damage to the small blood vessels, causing problems in the eyes, kidneys, feet and nerves (microvascular complications).")
                                .font(.system(size: 16, weight: .regular, design: .rounded))
                                .foregroundColor(.black)
                            Text("Common Side Effects")
                                .font(.system(size: 28, weight: .bold, design: .rounded))
                                .padding(.top, 20)
                                .foregroundColor(.black)
                            Text("""
                            • Increased thirst
                            • Frequent urination
                            • Increased hunger
                            • Unintended weight loss
                            • Fatigue
                            • Blurred vision
                            • Slow-healing sores
                            • Frequent infections
                            """)
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            
                            Text("Tips for Success")
                                .font(.system(size: 28, weight: .bold, design: .rounded))
                                .padding(.top, 20)
                                .foregroundColor(.black)
                            Text("""
                                • Make sure to incorporate a healthy diet of fruits, vegetables, wholegrains, beans, nuts, lean animal protein (fish and seafood), plant-based protein. Limit yourself on sugary foods and drinks that can raise your blood glucose level. Be aware of highly processed foods that could contain hidden carbohydrates.
                                • Being physically active can help you manage the disease. This happens because exercising can increase insulin sensitivity, which helps the cells use any available insulin to take up glucose from the blood.
                                
                                """)
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            .foregroundColor(.black)
                        }
                        .padding(.horizontal, 10)
                    }
                    .background(Color(hex: 0xfafafa))
                    .cornerRadius(30, corners: [.topLeft, .topRight])
                }
                .background(backgroundBlue)
                
                Button {
                    withAnimation {
                        viewRouter.currentScreen = .groupChatScreen
                    }
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 360, height: 70)
                            .cornerRadius(25)
                            .foregroundColor(primaryButtonColor)
                        Text("Back")
                            .font(.system(size: 32, weight: .medium, design: .rounded))
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
