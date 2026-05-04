import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_reel_page/core/state_status.dart';
import 'package:instagram_reel_page/features/reel/view-model/reel_bloc.dart';
import 'package:instagram_reel_page/features/reel/view/widgets/single_reel_ui.dart';

class ReelPage extends StatefulWidget {
  const ReelPage({super.key});

  @override
  State<ReelPage> createState() => _ReelPageState();
}

class _ReelPageState extends State<ReelPage> {
  @override
  void initState() {
    context.read<ReelBloc>().add(FetchReel());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ReelBloc, ReelState>(
        builder: (context, state) {
          if (state.stateStatus == StateStatus.loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state.stateStatus == StateStatus.success) {
            // For videos we need a stateful widget that hold controller for every video
            // unlike images that's how it work.
            return PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                final reel = state.data[index];
                return SingleReelItem(
                  video: reel.video,
                  likeCount: reel.likeCount,
                  commentCount: reel.commentCount,
                  saveCount: reel.saves,
                  discription: reel.description,
                );
              },
            );
          }

          return Center(child: Text('There is something wrong'));
        },
      ),
    );
  }
}
