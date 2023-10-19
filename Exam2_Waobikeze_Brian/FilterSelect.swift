//
//  FilterSelect.swift
//  Exam2_Waobikeze_Brian
//
//  Created by brian waobikeze on 10/19/23.
//

import SwiftUI

struct FilterSelect: View {
    @State  var peoples: [People]
    @State var ArrayOFTabs:[String] = ["Everyone","Friends","Close Friends","Relatives","Colleagues"]
    var body: some View {
        NavigationView{
            VStack{
                Text("Everyone").font(Font.system(size: 45))
                Text("Somewhere near me").font(Font.system(size: 45))
                List(ArrayOFTabs, id:\.self ){tab in
                    if tab == "Everyone"{
                        NavigationLink(destination: ContentView()){
                            HStack{
                                Text(tab).font(Font.system(size: 35))
                            }
                        }
                    }else if tab == "Friends"{
                        NavigationLink(destination: FriendsView(Friendspeoples: peoples)){
                            HStack{
                                Text(tab).font(Font.system(size: 35))
                            }
                        }
                    } else if tab == "Close Friends"{
                        NavigationLink(destination: CloseFriendsView()){
                            HStack{
                                Text(tab).font(Font.system(size: 35))
                            }
                        }
                    } else if tab == "Relatives"{
                        NavigationLink(destination: RelativesView()){
                            HStack{
                                Text(tab).font(Font.system(size: 35))
                            }
                        }
                    }else if tab == "Colleagues"{
                        NavigationLink(destination: ColleaguesView()){
                            HStack{
                                Text(tab).font(Font.system(size: 35))
                            }
                        }
                    }
                }
            }
    }
    }
}

#Preview {
    @State var TempOfPeople = [People]()
    return FilterSelect(peoples: TempOfPeople)
}
