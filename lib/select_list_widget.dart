import 'package:flutter/material.dart';
import 'package:selection_item/button.dart';
import 'package:selection_item/model/box_decoration.dart';
import 'package:selection_item/model/modal_decoration.dart';

class ListSelection<T> extends StatefulWidget {
  String title;
  String hint;
  List<T> items;
  SelectionBoxDecoration? boxDecoration;
  SelectionModalDecoration ?modalDecoration;
  List<T>? selectedItems;
  Widget Function(T item, bool isSelected) itemBuilder;
  Function(List<T> itemsSelected) selectCallBack;

  ListSelection({
    Key? key,
    this.selectedItems,
    this.boxDecoration,
    this.modalDecoration,
    required this.title,
    required this.hint,
    required this.itemBuilder,
    required this.selectCallBack,
    required this.items,
  }) : super(key: key);

  @override
  State<ListSelection<T>> createState() =>
      _ListSelectionState<T>();
}

class _ListSelectionState<T> extends State<ListSelection<T>> {
  List<T> _selectedItems = [];
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    widget.modalDecoration ??= SelectionModalDecoration();
    widget.boxDecoration ??= SelectionBoxDecoration();
    if (widget.selectedItems != null) {
      _selectedItems = widget.selectedItems!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        showModalBottomSheet<dynamic>(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
          builder: (context1) {
            return StatefulBuilder(
              builder: (BuildContext context,
                      void Function(void Function()) setStateModal) =>
                  Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.remove,
                    size: 20,
                    color: Colors.black87,
                  ),
                  Text(
                    widget.title.replaceAll('*', ''),
                    style: widget.modalDecoration!.titleStyle,
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 25),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * .5),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: RawScrollbar(
                          controller: scrollController,
                          thumbColor: Colors.grey,
                          radius: const Radius.circular(20),
                          thickness: 5,
                          thumbVisibility: true,
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                for (var item in widget.items)
                                  GestureDetector(
                                      onTap: () {
                                        print(_selectedItems.indexWhere(
                                            (element) => element == item));
                                        int index = _selectedItems.indexWhere(
                                            (element) => element == item);
                                        if (index != -1) {
                                          _selectedItems.removeAt(index);
                                        } else {
                                          _selectedItems.add(item);
                                        }
                                        widget.selectCallBack(_selectedItems);
                                        setStateModal(() {});
                                        setState(() {});
                                      },
                                      child: widget.itemBuilder(
                                          item,
                                          _selectedItems.indexWhere(
                                                  (element) => element == item) !=
                                              -1)),
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Button(
                    change: () => Navigator.of(context).pop(),
                    title: widget.modalDecoration!.btnText,
                    color:widget.modalDecoration!.btnBackGroundColor,
                    radios: widget.modalDecoration!.btnRadios,
                    textColor: widget.modalDecoration!.btnTextColor,
                  )
                ],
              ),
            );
          },
          backgroundColor: Colors.white,
          elevation: 2,
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: Colors.black12,
          width: 1,
        ))),
        child: Row(
          children: [
            Text(
              widget.title,
              style: widget.boxDecoration!.titleStyle,
            ),
            const Spacer(),
            Text(
              _selectedItems.isNotEmpty
                  ? '${_selectedItems.length} items '
                  : widget.hint,
              style:widget.boxDecoration!.hintStyle,
            ),
          ],
        ),
      ),
    );
  }
}
