import 'package:flutter/material.dart';
import 'package:habit_note/DesignSystem/Components/BottomNavigationBar/bottom_nav_bar.dart';
import 'package:habit_note/DesignSystem/Components/BottomNavigationBar/bottom_nav_bar_view_model.dart';
import 'package:habit_note/DesignSystem/Shared/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> originalNotes = [
    {
      'title': 'UI concepts worth exsisting',
      'description': 'Description for Note 1',
      'color': Colors.red,
      'date': DateTime.now(),
      'type': 'note',
    },
    {
      'title': 'Book Review : The Design of Everyday Things by Don Norman',
      'description': 'Description for Note 2',
      'color': Colors.blue,
      'date': DateTime.now().subtract(const Duration(days: 1)),
      'type': 'note',
    },
    {
      'title': 'Animes produced by Wit Studio',
      'description': 'Description for Note 3',
      'color': Colors.green,
      'date': DateTime.now().subtract(const Duration(days: 2)),
      'type': 'note',
    },
    {
      'title': 'Mangas planned to read',
      'description': 'Description for Note 1',
      'tasks': [
        {
          'id': 'task1',
          'title': 'Task 1',
          'completed': false
        },
        {
          'id': 'task2',
          'title': 'Task 2',
          'completed': false
        },
        {
          'id': 'task3',
          'title': 'Task 3',
          'completed': false
        }
      ],
      'color': Colors.red,
      'date': DateTime.now(),
      'type': 'todo',
    },
    {
      'title': 'Awesome tweets collection',
      'description': 'Description for Note 2',
      'color': Colors.blue,
      'date': DateTime.now().subtract(const Duration(days: 1)),
      'type': 'note',
    },
    {
      'title': 'List of free & open source apps',
      'description': 'Description for Note 3',
      'tasks': [
        {
          'id': 'task1',
          'title': 'Task 1',
          'completed': false
        },
        {
          'id': 'task2',
          'title': 'Task 2',
          'completed': false
        },
        {
          'id': 'task3',
          'title': 'Task 3',
          'completed': false
        }
      ],
      'color': Colors.green,
      'date': DateTime.now().subtract(const Duration(days: 2)),
      'type': 'todo',
    },
    {
      'title': 'Animes produced by Wit Studio',
      'description': 'Description for Note 3',
      'color': Colors.green,
      'date': DateTime.now().subtract(const Duration(days: 2)),
      'type': 'note',
    },
  ];

  List<Map<String, dynamic>> filteredNotes = [];
  bool isGridView = false;

  @override
  void initState() {
    super.initState();
    filteredNotes = List.from(originalNotes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notes",
          style: TextStyle(
            color: textColor,
            fontSize: 36,
            fontWeight: FontWeight.bold
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.palette, color: textColor,),
            onPressed: showColorFilterDialog,
          ),
          IconButton(
            icon: Icon(isGridView ? Icons.view_stream : Icons.grid_view, color: textColor,),
            onPressed: () {
              setState(() {
                isGridView = !isGridView;
              });
            },
          ),
        ],
      ),
      body: isGridView ? buildGridView() : buildListView(),
      bottomNavigationBar: BottomNavBar.instantiate(
        viewModel: BottomNavBarViewModel(
          bottomTabs: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.sticky_note_2_outlined),
              label: "Notes",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.image_search),
              label: "OCR",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.help_outline),
              label: "Help",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: "Me",
            )
          ],
        ),
        currentIndex: 0
      ),
    );
  }

  Widget buildListView() {
    return ListView.builder(
      itemCount: filteredNotes.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: filteredNotes[index]['type'] == 'note' ?
          Card(
            color: filteredNotes[index]['color'],
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        filteredNotes[index]['title'],
                        style: const TextStyle(
                          color: textColor,
                          fontSize: 24
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '${filteredNotes[index]['date'].toLocal()}'.split(' ')[0]
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ),
            ),
          ) :
          Card(
            color: filteredNotes[index]['color'],
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Column(
                  children: filteredNotes[index]['tasks'] != null
                  ? List.generate(filteredNotes[index]['tasks'].length, (taskIndex) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Row(
                            children: [
                              Icon(
                                filteredNotes[index]['tasks'][taskIndex]['completed']
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                                color: textColor,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                filteredNotes[index]['tasks'][taskIndex]['title'],
                                style: const TextStyle(
                                color: textColor,
                                fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }): [],
                ),
              ),
            ),
          )
        );
      },
    );
  }

  Widget buildGridView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
      ),
      padding: const EdgeInsets.all(10),
      itemCount: filteredNotes.length,
      itemBuilder: (context, index) {
        return Card(
          color: filteredNotes[index]['color'],
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        filteredNotes[index]['title'],
                        style: const TextStyle(
                          color: textColor,
                          fontSize: 24
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: 
                        Text(
                          '${filteredNotes[index]['date'].toLocal()}'.split(' ')[0]
                        ),
                      ),
                    ],
                  );
                }
              )
            ),
          ),
        );
      },
    );
  }

  void filterNotesByColor(Color color) {
    setState(() {
      filteredNotes = originalNotes.where((note) => note['color'] == color).toList();
    });
  }

  void resetFilter() {
    setState(() {
      filteredNotes = List.from(originalNotes);
    });
  }

  void showColorFilterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Filter by Colour'),
          content: SingleChildScrollView(
            child: SizedBox(
              width: 340,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      resetFilter();
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(color: textColor),
                    ),
                    child: const Text(
                      'Reset',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 18
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: 16,
                    runSpacing: 24,
                    children: [
                      GestureDetector(
                        onTap: () {
                          filterNotesByColor(Colors.red);
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          filterNotesByColor(Colors.blue);
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          filterNotesByColor(Colors.green);
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
