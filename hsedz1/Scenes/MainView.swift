//
//  MainView.swift
//  hsedz1
//
//  Created by Andrey Stepanov on 06.02.2026.
//

import SwiftUI

struct MainView: View {
    private let beds = Bed.beds

    @State private var currentBedIndex: Int = 0

    var body: some View {
        VStack {
            titleLabel

            Spacer()

            bedTitle

            HStack {
                backButton

                Spacer()

                bedImage

                Spacer()

                nextButton
            }

            Spacer()
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
    }
}

private extension MainView {
    var titleLabel: some View {
        Text("which bed are you sleeping the hardest?")
            .font(.system(size: 24, weight: .bold))
    }

    var bedImage: some View {
        Image(beds[currentBedIndex].image)
            .resizable()
            .scaledToFit()
            .frame(height: 300)
    }

    var bedTitle: some View {
        Text(beds[currentBedIndex].title)
            .padding(.bottom, 20)
    }

    var nextButton: some View {
        Button {
            setNextBedImage()
        } label: {
            Image(systemName: "chevron.right")
        }
    }

    var backButton: some View {
        Button {
            setPreviousBedImage()
        } label: {
            Image(systemName: "chevron.left")
        }
    }
}

// ViewModel🤣
private extension MainView {
    func setPreviousBedImage() {
        currentBedIndex = (currentBedIndex - 1 + beds.count) % beds.count
    }

    func setNextBedImage() {
        currentBedIndex = (currentBedIndex + 1) % beds.count
    }
}
