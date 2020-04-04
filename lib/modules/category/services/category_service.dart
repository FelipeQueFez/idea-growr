import 'package:idea_growr/modules/category/models/category_model.dart';
import 'package:idea_growr/modules/category/models/question_model.dart';

class CategoryService {
  List<CategoryModel> getCategories() {
    //TODO:in deveopment
    return _getMock();
  }

  List<CategoryModel> _getMock() {
    return [
      _mockAplicativo(),
      _mockNegocios(),
      _mockPessoal(),
      _mockRealizacao(),
      _mockSociedade(),
      _mockStartup(),
      _mockTolice(),
    ];
  }

  CategoryModel _mockAplicativo() {
    var question = new QuestionModel(1, '', '');
    var item = CategoryModel(1, 'Aplicativo', [question]);

    return item;
  }

  CategoryModel _mockNegocios() {
    var question = new QuestionModel(1, '', '');
    var item = CategoryModel(1, 'Negocios', [question]);

    return item;
  }

  CategoryModel _mockRealizacao() {
    var question = new QuestionModel(1, '', '');
    var item = CategoryModel(1, 'Realização', [question]);

    return item;
  }

  CategoryModel _mockPessoal() {
    var question = new QuestionModel(1, '', '');
    var item = CategoryModel(1, 'Pessoal', [question]);

    return item;
  }

  CategoryModel _mockTolice() {
    var question = new QuestionModel(1, '', '');
    var item = CategoryModel(1, 'Tolice', [question]);

    return item;
  }

  CategoryModel _mockSociedade() {
    var question = new QuestionModel(1, '', '');
    var item = CategoryModel(1, 'Sociedade', [question]);

    return item;
  }

  CategoryModel _mockStartup() {
    var question = new QuestionModel(1, '', '');
    var item = CategoryModel(1, 'Startup', [question]);

    return item;
  }
}
