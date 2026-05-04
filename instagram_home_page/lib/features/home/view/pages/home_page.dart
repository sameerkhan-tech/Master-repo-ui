import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_home_page/features/home/view-model/home_page_bloc.dart';
import 'package:instagram_home_page/state_status_enum.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomePageBloc>().add(FetchStories());
    context.read<HomePageBloc>().add(FetchFeeds());
  }

  // include note about how you use bloc consumer inside sliver why not place scroll view inside bloc builder.
  // how you handle extra story index
  // combine repo in view model, combine datasource in repo rule
  // use bloc widget at body then return custom scroll view
  // then write conditioned widget with ternary operator

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
        centerTitle: true,
        title: Text('Instagram'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border_outlined),
          ),
        ],
      ),
      body: BlocConsumer<HomePageBloc, HomeState>(
        builder: (context, state) {
          if (state.isInitialLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return CustomScrollView(
            slivers:
                /*  [
             state.homeStates.map((i){
            if(i is x){
            return y; }

            if(i is y){
            return z ;}
            })
             ] 
            */
                [
                  SliverToBoxAdapter(
                    child: Builder(
                      builder: (context) {
                        if (state.storyState.data.isEmpty &&
                            state.storyState.stateStatus ==
                                StateStatus.loading) {
                          return Center(child: CircularProgressIndicator());
                        }

                        if (state.storyState.data.isNotEmpty) {
                          return SizedBox(
                            height: 120,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                if (index == 0) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    spacing: 4,
                                    children: [
                                      Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Container(
                                            height: 80,
                                            width: 80,
                                            padding: EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              border: Border.all(
                                                color: Colors.deepOrange,
                                                width: 3,
                                              ),
                                            ),
                                            child: ClipOval(
                                              child: Image.asset(
                                                'assets/stories/people.png',
                                                color: Colors.blueGrey,
                                              ),
                                            ),
                                          ),

                                          Positioned(
                                            bottom: -2,
                                            right: -2,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: Colors.black54,
                                                  width: 2,
                                                ),
                                              ),
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text('Your story'),
                                    ],
                                  );
                                }
                                final story = state.storyState.data[index - 1];
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  spacing: 4,
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 80,
                                      padding: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          100,
                                        ),
                                        border: Border.all(
                                          color: Colors.deepOrange,
                                          width: 3,
                                        ),
                                      ),
                                      child: ClipOval(
                                        child: Image.asset(
                                          story.thumbnailPicture,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Text(story.userName),
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  SizedBox(width: 4),
                              itemCount: state.storyState.data.length + 1,
                            ),
                          );
                        }
                        return Center(child: Text('Hello world'));
                      },
                    ),
                  ),
                  (state.feedState.stateStatus == StateStatus.success &&
                          state.feedState.data.isNotEmpty)
                      ? SliverList.separated(
                          itemBuilder: (context, index) {
                            final feed = state.feedState.data[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  child: Row(
                                    spacing: 4,
                                    children: [
                                      ClipOval(
                                        child: Image.asset(
                                          feed.userProfilePhoto,
                                          fit: BoxFit.cover,
                                          height: 40,
                                          width: 40,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            feed.userName,
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          Text('24 april'),
                                        ],
                                      ),
                                      Spacer(),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.more_vert),
                                      ),
                                    ],
                                  ),
                                ),
                                Image.asset(
                                  feed.feedImage,
                                  height: 400,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),

                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.favorite_outline),
                                    ),
                                    Text(feed.likeCount.toString()),
                                    Spacer(),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.comment_outlined),
                                    ),
                                    Text(feed.commentCount.toString()),
                                    Spacer(),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.ios_share_outlined),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  child: Text.rich(
                                    TextSpan(
                                      text: '${feed.userName} ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: feed.feedDescription,
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 16);
                          },
                          itemCount: state.feedState.data.length,
                        )
                      : (state.feedState.stateStatus == StateStatus.loading &&
                            state.feedState.data.isEmpty)
                      ? SliverFillRemaining(
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : SliverFillRemaining(
                          child: Center(
                            child: Text('There is something wrong'),
                          ),
                        ),
                ],
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}

//       body: CustomScrollView(
//         slivers: [
//           SliverToBoxAdapter(
//             child: BlocConsumer<HomePageBloc, HomeState>(
//               builder: (context, state) {
//                 print(state);
//                 if (state.storyState.data.isEmpty &&
//                     state.storyState.stateStatus == StateStatus.loading) {
//                   return Center(child: CircularProgressIndicator());
//                 }

//                 if (state.storyState.data.isNotEmpty) {
//                   return SizedBox(
//                     height: 120,
//                     child: ListView.separated(
//                       scrollDirection: Axis.horizontal,
//                       itemBuilder: (context, index) {
//                         if (index == 0) {
//                           return Column(
//                             mainAxisSize: MainAxisSize.min,
//                             spacing: 4,
//                             children: [
//                               Stack(
//                                 clipBehavior: Clip.none,
//                                 children: [
//                                   Container(
//                                     height: 80,
//                                     width: 80,
//                                     padding: EdgeInsets.all(2),
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(100),
//                                       border: Border.all(
//                                         color: Colors.deepOrange,
//                                         width: 3,
//                                       ),
//                                     ),
//                                     child: ClipOval(
//                                       child: Image.asset(
//                                         'assets/stories/people.png',
//                                         color: Colors.blueGrey,
//                                       ),
//                                     ),
//                                   ),

//                                   Positioned(
//                                     bottom: -2,
//                                     right: -2,
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         shape: BoxShape.circle,
//                                         border: Border.all(
//                                           color: Colors.black54,
//                                           width: 2,
//                                         ),
//                                       ),
//                                       child: Icon(
//                                         Icons.add,
//                                         color: Colors.black54,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Text('Your story'),
//                             ],
//                           );
//                         }
//                         final story = state.storyState.data[index - 1];
//                         return Column(
//                           mainAxisSize: MainAxisSize.min,
//                           spacing: 4,
//                           children: [
//                             Container(
//                               height: 80,
//                               width: 80,
//                               padding: EdgeInsets.all(2),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(100),
//                                 border: Border.all(
//                                   color: Colors.deepOrange,
//                                   width: 3,
//                                 ),
//                               ),
//                               child: ClipOval(
//                                 child: Image.asset(
//                                   story.thumbnailPicture,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             Text(story.userName),
//                           ],
//                         );
//                       },
//                       separatorBuilder: (context, index) => SizedBox(width: 4),
//                       itemCount: state.storyState.data.length + 1,
//                     ),
//                   );
//                 }
//                 return Center(child: Text('Hello world'));
//               },
//               listener: (context, state) {},
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: BlocConsumer<HomePageBloc, HomeState>(
//               builder: (context, state) {
//                 if (state.feedState.stateStatus == StateStatus.success &&
//                     state.feedState.data.isNotEmpty) {
//                   return ListView.separated(

//                     itemBuilder: (context, index) {
//                       return Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [Row(children: [])],
//                       );
//                     },
//                     separatorBuilder: (context, index) {
//                       return SizedBox(height: 8);
//                     },
//                     itemCount: state.feedState.data.length,
//                   );
//                 }

//                 return Center(child: Text('there is something wrong'));
//               },
//               listener: (context, state) {},
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
