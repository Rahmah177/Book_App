import 'package:flutter/material.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  TextEditingController titleControlLer = TextEditingController();
  TextEditingController autherControlLer = TextEditingController();
  TextEditingController coverControlLer = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Available Books',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            height: 20,
          ),
          itemBuilder: (context, index) {
            return Row(
              children: [
                Container(
                  height: 160,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.network(
                    'https://thumbs.dreamstime.com/b/stack-books-isolated-white-background-34637153.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Flutter book',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Author : uncle bob',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete_forever,
                      size: 32,
                    ))
              ],
            );
          },
          itemCount: 10,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => Padding(
                    padding: const EdgeInsets.all(24.0).copyWith(
                      bottom: MediaQuery.of(context).viewInsets.bottom + 24,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(hintText: 'Title'),
                          controller: titleControlLer,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(hintText: 'author'),
                          controller: autherControlLer,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              hintText: 'Image cover url'),
                          controller: coverControlLer,
                        ),
                        const SizedBox(height: 25),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            minimumSize: const Size(
                              double.infinity,
                              50,
                            ),
                          ),
                          child: const Text(
                            'Save',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ));
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
