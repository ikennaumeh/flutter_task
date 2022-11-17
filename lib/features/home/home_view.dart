import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/size_mg.dart';
import 'package:flutter_task/features/home/widgets/post_tile.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:stacked/stacked.dart';
import 'view_model/home_vm.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sports News Headlines",
          style: TextStyle(
            fontSize: SizeMg.text(20),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,

      ),
      body: ViewModelBuilder<HomeVM>.reactive(
        viewModelBuilder: () => HomeVM(),
        onModelReady: (model) => model.fetchNews(),
        builder: (_, model, __){

          ///busy state
          if(model.isBusy){
            return const Center(child: CircularProgressIndicator.adaptive(),);
          }

          ///error state
          if (model.hasError && !model.isBusy){
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${model.errorMessage}"),
                  SizedBox(height: SizeMg.height(10),),
                  ElevatedButton(onPressed: model.fetchNews, child: const Text("Reload")),
                ],
              ),
            );
          }

          /// empty state
          if(model.articles!.isEmpty && !model.isBusy){
            return const Center(child: Text("No articles to read at this time"));
          }

          ///loaded state
          return LiquidPullToRefresh(
            onRefresh: model.fetchNews,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: model.articles!.length,
              itemBuilder: (c,i){
                final post = model.articles?.elementAt(i);
                return PostTile(post: post);
              },
              separatorBuilder: (c,i){
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: SizeMg.height(10)),
                  child: const Divider(),
                );
              },
            ),
          );
        },

      ),
    );
  }
}


