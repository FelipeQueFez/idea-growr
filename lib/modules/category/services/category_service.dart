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
      _mockRealizacao(),
      _mockPessoal(),
      _mockTolice(),
      _mockSociedade(),
      _mockStartup(),
    ];
  }

  CategoryModel _mockAplicativo() {
    var question = new QuestionModel(1, 'Breve descrição / elevar passos',
        'Tente descrever a funcionalidade do seu aplicativo em 1-2 frases - se você não puder fazer isso, você está fazendo algo muito completo e você deve considerar simplificar um pouco.');

    var question2 = new QuestionModel(
        1,
        'Qual problema seu aplicativo vai resolver?',
        'Os aplicativos mais populares (a menos que eles que são estritamente feitos para fins de entretenimento) são os que resolvem um problema real que os usuários de smartphones têm atualmente. O que vai resolver o seu problema?');

    var question3 = new QuestionModel(
        1,
        'Qual mercado-alvo seu aplicativo irá focar?',
        'Qual seria o apelo do seu aplicativo ao seu público-alvo? Exemplo:Mães entre 20 e 40 anos que estão plugadas em novas tecnologias.');

    var question4 = new QuestionModel(
        1,
        'Já existem aplicativos para competir com o seu por aí?',
        'Se o seu aplicativo fosse levado ao mercado, quais aplicativos existentes já fazem algo similar? Com que coê estaria competindo por atenção? Você pode pensar que seu aplicativo é único e completamente original, mas há sempre algo para se colocar, mesmo que seja apenas remotamente relacionado.');

    var question5 = new QuestionModel(
        1,
        'Qual é a estratégia de monetização do seu aplicativo?',
        'Como você pretende ganhar dinheiro com o aplicativo? você vai cobrar logo de cara (caso em que é mais difícil de obter usuários), ou você vai vender compras dentro do aplicativo ou outras atualizações uma vez que usuários baixar o aplicativo de graça? Estas são apenas duas opções de muitas ...');

    var question6 = new QuestionModel(
        1,
        'Qual é o recurso é mais importante para a monetização?',
        'Qual recurso faz com que o seu aplicativo valha a pena pagar? Qual é a principal razão para que o usuário compre o seu aplicativo, ou compre uma atualização dentro do aplicativo? (dependendo da sua estratéfia de monetização) .');

    var question7 = new QuestionModel(
        1,
        'Qual é a especificidade da plataforma da sua ideia, e sua escalabilidade pode ser afetada?',
        'A sua ideia é viável apenas no iphone? Ou somente em dispositivos Android? Um produto ideal para smartphones vai ser escalável para tantas plataformas difrentes como o consumidor demanda.');

    var question8 = new QuestionModel(
        1,
        'Quais 3 telas que você precisa para esboçar e/ou \'prototipar\' para ser capaz de obter feedback dos usuários em potencial?',
        'A melhor maneira de obter feedback sobre a sua ideia é mostrar a seus usuários-alvo um esboço ou mockup de como será seu aplicativo. Quais são as três telas que sãos vitais que retratam o propósito do seu aplicativo que você pode mostrar para ter uma ideia de como ele pode ou não usar tal produto?');

    var item = CategoryModel(1, 'Aplicativo', [
      question,
      question2,
      question3,
      question4,
      question5,
      question6,
      question7,
      question8,
    ]);

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
