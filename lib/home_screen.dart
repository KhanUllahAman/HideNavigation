import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedBuilder(
        animation: scrollController,
        builder: (BuildContext context, Widget? child) {
          return AnimatedContainer(
            color: const Color.fromARGB(255, 0, 0, 0),
            duration: const Duration(milliseconds: 400),
            height: scrollController.position.userScrollDirection ==
                    ScrollDirection.reverse
                ? 0
                : 80,
            child: child,
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.home, color: Colors.white,),
            Icon(Icons.shopping_bag, color: Colors.white,),
            Icon(Icons.favorite, color: Colors.white,),
            Icon(Icons.person, color: Colors.white,),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 33, 83, 247),
              Color.fromARGB(255, 85, 114, 233),
            ],
          ),
        ),
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              const SizedBox(height: 100),
              const Text(
                "Hide On Scroll",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                itemCount: 50,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(10),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemBuilder: (context, index) => Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      index.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}