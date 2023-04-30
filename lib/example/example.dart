import 'package:flutter/material.dart';
import 'package:selection_item/example/test_model.dart';
import 'package:selection_item/selection.dart';

void showSimpleString() {
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
  //show simple string

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
}
void showComlexObject(){
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
}
