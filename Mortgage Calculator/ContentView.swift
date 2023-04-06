//
//  ContentView.swift
//  Mortgage Calculator
//
//  Created by CONG LE on 4/5/23.
//
import SwiftUI

struct MortgageCalculatorView: View {
  
  // Input variables
  @State private var principal: String = ""
  @State private var interestRate: String = ""
  @State private var loanTerm: String = ""
  
  // Output variable
  @State private var monthlyPayment: Double = 0.0
  
  var body: some View {
    ZStack {
      Color(UIColor.systemBackground)
        .ignoresSafeArea()
      
      VStack(alignment: .center, spacing: 30) {
        Image(systemName: "house.fill")
          .resizable()
          .scaledToFit()
          .frame(width: 80, height: 80, alignment: .center)
          .foregroundColor(.orange)
        
        VStack(alignment: .leading, spacing: 12) {
          Text("Loan Amount")
            .font(.system(size: 18, weight: .bold, design: .default))
            .foregroundColor(Color(UIColor.label))
          
          TextField("0", text: $principal)
            .padding()
            .keyboardType(.numberPad)
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(8)
        }
        
        VStack(alignment: .leading, spacing: 12) {
          Text("Interest Rate (%)")
            .font(.system(size: 18, weight: .bold, design: .default))
            .foregroundColor(Color(UIColor.label))
          
          TextField("0", text: $interestRate)
            .padding()
            .keyboardType(.decimalPad)
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(8)
        }
        
        VStack(alignment: .leading, spacing: 12) {
          Text("Loan Term (years)")
            .font(.system(size: 18, weight: .bold, design: .default))
            .foregroundColor(Color(UIColor.label))
          
          TextField("0", text: $loanTerm)
            .padding()
            .keyboardType(.numberPad)
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(8)
        }
        
        Button(action: {
          calculateMonthlyPayment()
        }) {
          Text("Calculate")
            .font(.system(size: 24, weight: .bold, design: .default))
            .foregroundColor(.white)
            .padding(.horizontal, 32)
            .padding(.vertical, 12)
            .background(Color(UIColor.systemOrange))
            .cornerRadius(25)
            .shadow(color: Color(UIColor.systemOrange).opacity(0.5), radius: 10, x: 5, y: 5)
        }
        .padding(.top, 20)
        
        VStack(alignment: .leading, spacing: 8) {
          Text("Monthly Payment")
            .font(.system(size: 20, weight: .bold, design: .default))
            .foregroundColor(Color(UIColor.label))
          
          Text("$\(monthlyPayment, specifier: "%.2f")")
            .font(.system(size: 40, weight: .bold, design: .default))
            .foregroundColor(Color(UIColor.label))
            .padding(.top, 8)
        }
        
        Spacer()
      }
      .padding()
      
      VStack(alignment: .trailing) {
        Spacer()
        Button(action: {}) {
          Image(systemName: "questionmark.circle.fill")
            .font(.system(size: 24))
            .foregroundColor(Color(UIColor.label))
        }
        .padding(.trailing, 20)
        .padding(.bottom, 20)
      }
    }
    .navigationTitle("Mortgage Calculator")
  }
  
  func calculateMonthlyPayment() {
    let p = Double(principal) ?? 0.0
    let r = (Double(interestRate) ?? 0.0) / 1200.0
    let n = (Double(loanTerm) ?? 0.0) * 12.0
    monthlyPayment = (p * r * pow(1 + r, n)) / (pow(1 + r, n) - 1)
  }
}

struct MortgageCalculatorView_Previews: PreviewProvider {
  static var previews: some View {
    MortgageCalculatorView()
  }
}
