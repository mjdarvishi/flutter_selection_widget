This package is helping you to show a list of custom object and let user pick one or multiple items form it.

<h2>There are 2 type of widget that you can use:</h2>
<b>1-ListSelection</b></br>
<b>2-SingleSelection</b></br>

In the first one user is able to select more than one item and in the second one user can just select one item.
# Getting started

<p>For using this package you just to need add it to your pubspec.yaml file.</p>
<b>
selection :last version </b>
  <br><br/>
After that import it where ever you want to use it.

<b>`import 'package:selection/selection.dart;`</b>

And finally like the blow codes use it to show user selection list to user.</br>
<b>ListSelection</b>

```dart
 ListSelection<String>(
//custom style for hint
boxDecoration: SelectionBoxDecoration(
hintStyle: const TextStyle(color: Colors.red)),
//custom style for modal
modalDecoration:
SelectionModalDecoration(btnBackGroundColor: Colors.red),
//the title of your selection box
title: 'Select multiple number',
//hint text that shows in selection box
hint: 'choose',
// these are the items that will be shown in modal
itemBuilder: (item, isSelected) =>
Text(
item,
style: TextStyle(
color: isSelected ? Colors.red : Colors.black),
),
//selection callback
selectCallBack: (itemsSelected) {},
//your items
items: const ['1', '2', '3', '4']);
```
<br>

<b>SingleSelection</b>
```dart
 //show simple string
SingleSelection<String>(
//custom style for hint
boxDecoration: SelectionBoxDecoration(
hintStyle: const TextStyle(color: Colors.red)),
//the title of your selection box
title: 'Select one number',
//hint text that shows in selection box
hint: 'choose',
//when user choose this item will be shown in hint text. it must be string
showItemSelection: (item) => item,
// these are the items that will be shown in modal
itemBuilder: (item) => Text(item),
//selection callback
selectCallBack: (itemSelected) {},
//your items
items: const ['1', '2', '3', '4']);


SingleSelection<ModelTest>(
//custom style for hint
boxDecoration: SelectionBoxDecoration(
hintStyle: const TextStyle(color: Colors.red)),
//the title of your selection box
title: 'Select one number',
//hint text that shows in selection box
hint: 'choose',
//when user choose this item will be shown in hint text. it must be string
showItemSelection: (item) => item.title,
// these are the items that will be shown in modal
itemBuilder: (item) => Text(item.title),
//selection callback
selectCallBack: (itemSelected) {},
//your items
items:getTestModel);
```

You can contribute on github https://github.com/mjdarvishi
