//
//  SwiftUIView.swift
//  mobden
//
//  Created by administrator on 3/7/20.
//  Copyright © 2020 motaz. All rights reserved.
//

import SwiftUI
import PDFKit

struct PlanInfoView: View {
   var url: URL

    var body: some View {
        ZStack{
            PDFKitRepresentedView(url)
        }
        
        
    }
}

struct SupervisionPlanInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PlanInfoView(url: URL(string: "cvdcvd")!)
    }
}




struct PDFKitRepresentedView: UIViewRepresentable {
    let url: URL

    init(_ url: URL) {
        self.url = url
    }

    func makeUIView(context: UIViewRepresentableContext<PDFKitRepresentedView>) -> PDFKitRepresentedView.UIViewType {
        // Create a `PDFView` and set its `PDFDocument`.
        let pdfView = PDFView()
        
        
        pdfView.document = PDFDocument(url: self.url)
        return pdfView
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PDFKitRepresentedView>) {
        // Update the view.
    }
}
