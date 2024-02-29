


import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'AppBarButton.dart';

class EndOfSite extends StatelessWidget {
  const EndOfSite({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          children: [
            const Gap(70),
            const Divider(),
            const Gap(40),
            const Row(
              children: [
                Icon(Icons.public_sharp),
                Gap(5),
                Text('2023'),
                Spacer(),
                Text('Country/Languages'),
                Gap(5),
                DropdownMenu(
                  width: 250,
                  label: Text('Choose Language'),
                  enableFilter: true,     
                  dropdownMenuEntries:[
                    DropdownMenuEntry(value: 'English', label: 'English'),
                    DropdownMenuEntry(value: 'English', label: 'Hindi'),
                    DropdownMenuEntry(value: 'English', label: 'Spanish'),
                    DropdownMenuEntry(value: 'English', label: 'Italian'),
                    DropdownMenuEntry(value: 'English', label: 'Mexican'),
                  ] 
                  ),
                Gap(5),
                DropdownMenu(
                  width: 250,
                  label: Text('Choose Language'),
                  enableFilter: true,     
                  dropdownMenuEntries:[
                    DropdownMenuEntry(value: 'English', label: 'English'),
                    DropdownMenuEntry(value: 'English', label: 'Hindi'),
                    DropdownMenuEntry(value: 'English', label: 'Spanish'),
                    DropdownMenuEntry(value: 'English', label: 'Italian'),
                    DropdownMenuEntry(value: 'English', label: 'Mexican'),
                  ] 
                  ),
                Gap(20),
                
              
              ],
            ),
            Row(
              children: [
                Text('Utilities'),
                Text('Category'),
                Text('Following Links'),
                Text('Follow Netflix'),
                Text('Update'),
                Text('News'),
                Text('Innovation'),
              ],
            ),
            const Divider(),
            SizedBox(
              height: 100,
              width: MediaQuery.sizeOf(context).width,
              child: Image.asset('assets/images/Netflix_Logo_RGB.png'),
            )
          ],
        ),
      ),
    );
  }
}

