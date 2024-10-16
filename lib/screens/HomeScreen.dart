import 'package:flutter/material.dart';

//Flutter plugins
import 'package:draggable_home/draggable_home.dart'; // for AppBar

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      leading: const Icon(Icons.arrow_back_ios),
      title: const Text("Draggable Home"),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
      ],
      headerWidget: headerWidget(context),
      // headerBottomBar: headerBottomBarWidget(),
      body: [
        
        //listView(),
      ],
      fullyStretchable: false,
      expandedBody: ExpandedBodyWidget(context),
      backgroundColor: Colors.white,
      appBarColor: Colors.teal,
    );
  }

  Widget dragScroll() {
    return Stack(
      children: [
        Center(
          child: Text('Основной контент'),
        ),
        DraggableScrollableSheet(
          initialChildSize: 0.1, // Начальный размер (10% от экрана)
          minChildSize: 0.1, // Минимальный размер (10% от экрана)
          maxChildSize: 0.5, // Максимальный размер (50% от экрана)
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: ListView.builder(
                controller: scrollController,
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Элемент $index'),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }

  Widget headerWidget(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text(
          "Title",
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Colors.white70),
        ),
      ),
    );
  }

  Widget ExpandedBodyWidget(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text(
          "Title",
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Colors.white70),
        ),
      ),
    );
  }

  ListView listView() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 0),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 20,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white70,
        child: ListTile(
          leading: CircleAvatar(
            child: Text("$index"),
          ),
          title: const Text("Title"),
          subtitle: const Text("Subtitle"),
        ),
      ),
    );
  }
}
