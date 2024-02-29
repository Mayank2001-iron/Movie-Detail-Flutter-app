import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import '../../Models/history.dart';
import '../../Models/searchModel.dart';
import '../Widgets/CustomListViewTile.dart';

// ignore: must_be_immutable
class SearchPage extends StatefulWidget {
  String query;
  SearchPage({super.key, required this.query});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController textController = TextEditingController();
  // SearchModel searchObject=SearchModel();
  // bool searchObjectbool = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.amber,
        // toolbarHeight: 70,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const BackButton(),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.4,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    onSubmitted: (value) {
                      setState(() {
                        widget.query = textController.text;
                      
                        // searchObjectbool =true;
                      });
                    },
                    controller: textController,
                    decoration: InputDecoration(
                        disabledBorder: InputBorder.none,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        suffixIcon: const Icon(Icons.search),
                        fillColor: Colors.grey.shade800,
                        filled: true),
                  ),
                ),
              ),
              // Gap(20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                  Text('UserName'),
                ],
              )
            ],
          ),
        ),
      ),
      body: FutureBuilder(
          future: SearchCallApi(widget.query),
          builder: (context, data) {
            if (data.hasData) {
              var searchObject = data.data as SearchModel; //items[index].title
              return Container(
                child: Row(
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        color: Colors.grey.shade900,
                        height: MediaQuery.sizeOf(context).height,
                        width: MediaQuery.sizeOf(context).width * 0.3,
                        child: ListView.builder(
                          itemCount: history.length,
                          itemBuilder: (context,index)
                          {
                            return ListTile(
                              trailing: GestureDetector(
                                onTap: (){
                                  setState(() {
                                  history.remove(history[index]);
                                  });
                                },
                                child: const Icon(Icons.close)),
                                title: Text(history[index]),
                            );
                          }
                          ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: SizedBox(
                        // color: Colors.red,
                        height: MediaQuery.sizeOf(context).height,
                        width: MediaQuery.sizeOf(context).width * 0.7,
                        child: GridView.builder(
                            shrinkWrap: true,
                            itemCount: searchObject.contents!.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    // mainAxisSpacing: 1,
                                    // crossAxisSpacing: 1,
                                    mainAxisExtent: 325),
                            itemBuilder: (context, index) {
                              print(searchObject.query);
                              return CustomListViewTile(
                                id: '${searchObject.contents![index].id}',
                                  imageUrl:
                                      searchObject.contents![index].posterPath!,
                                  title: searchObject.contents![index].title!,
                                  year:"",
                                  contentType: "movie",);
                            }),
                      ),
                    ),
                  ],
                ),
              );
            } else if (data.hasError) {
              return Center(
                        child: SizedBox(
                            height: MediaQuery.sizeOf(context).height,
                            width: MediaQuery.sizeOf(context).width,
                            child: LottieBuilder.asset(
                                'assets/images/error_animation.json')
                                )
                            );
            } else {
              return Center(
                        child: SizedBox(
                            height: MediaQuery.sizeOf(context).height,
                            width: MediaQuery.sizeOf(context).width,
                            child: LottieBuilder.asset(
                                'assets/images/loading_animation.json')
                                )
                            );
            }
          }),
    );
  }
}


// Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             height: 250,
//                             width: 180,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(5),
//                                 image: DecorationImage(
//                                   image: NetworkImage(
//                                     // object[index].posterPath!,
//                                     'assets/images/profile.jpg',
//                                   ),
//                                   fit: BoxFit.cover,
//                                 )),
//                           ),
//                           Gap(10),
//                           Text(
//                             // object[index].title!,
//                             'Batman',
//                             // maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                           Text('2024'), //'${object[index].releaseDate?.year}'
//                         ],
//                       );
