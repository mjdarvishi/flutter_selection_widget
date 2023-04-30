class ModelTest{
  String title;
  String des;
  int otherOption;

  ModelTest(this.title, this.des, this.otherOption);
}



List<ModelTest>get  getTestModel{
  return [
    ModelTest('title', 'des', 1),
    ModelTest('title2', 'des2', 2),
    ModelTest('title3', 'des4', 4)
  ];
}