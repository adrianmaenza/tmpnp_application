import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        title: const Text("Category Name"),
      ),

      // body
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            // search bar
            TextField(
              decoration: InputDecoration(
                  hintText: 'Search products',
                  prefixIcon: const Icon(Icons.search),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade300
              ),
            ),

            // grid of products
            const SizedBox(height: 20),

            // Filter and sorting options
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return SizedBox(
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10),
                  
                                    // Drag indicator
                                    Container(
                                      width: 50,
                                      height: 5,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[400],
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                  
                                    const SizedBox(height: 20,),

                                    // show sort/filter options
                  
                                  ],
                                ),
                              );
                            }
                        );
                      },
                  
                  
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.sort, size: 18,),
                          Text("Sort")
                        ],
                      )
                  ),
                ),

                const SizedBox(width: 20,),

                Expanded(
                  child: OutlinedButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return SizedBox(
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10),

                                    // Drag indicator
                                    Container(
                                      width: 50,
                                      height: 5,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[400],
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),

                                    const SizedBox(height: 20,),

                                    // show sort/filter options

                                  ],
                                ),
                              );
                            }
                        );
                      },


                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.filter_alt_outlined, size: 18,),
                          Text("Filter")
                        ],
                      )
                  ),
                ),
                
                
                
              ],
            ),

          ],
        ),
      ),
    );
  }
}
