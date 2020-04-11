import 'package:idea_growr/modules/category/models/category_model.dart';
import 'package:idea_growr/modules/category/models/question_model.dart';

class CategoryService {
  List<CategoryModel> getCategories() {
    //TODO:in development
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
    var question = new QuestionModel(
        id: 1,
        title: 'Breve descrição / elevar passos',
        hintText:
            'Tente descrever a funcionalidade do seu aplicativo em 1-2 frases - se você não puder fazer isso, você está fazendo algo muito completo e você deve considerar simplificar um pouco.');

    var question2 = new QuestionModel(
        id: 1,
        title: 'Qual problema seu aplicativo vai resolver?',
        hintText:
            'Os aplicativos mais populares (a menos que eles que são estritamente feitos para fins de entretenimento) são os que resolvem um problema real que os usuários de smartphones têm atualmente. O que vai resolver o seu problema?');

    var question3 = new QuestionModel(
        id: 1,
        title: 'Qual mercado-alvo seu aplicativo irá focar?',
        hintText:
            'Qual seria o apelo do seu aplicativo ao seu público-alvo? Exemplo:Mães entre 20 e 40 anos que estão plugadas em novas tecnologias.');

    var question4 = new QuestionModel(
        id: 1,
        title: 'Já existem aplicativos para competir com o seu por aí?',
        hintText:
            'Se o seu aplicativo fosse levado ao mercado, quais aplicativos existentes já fazem algo similar? Com que coê estaria competindo por atenção? Você pode pensar que seu aplicativo é único e completamente original, mas há sempre algo para se colocar, mesmo que seja apenas remotamente relacionado.');

    var question5 = new QuestionModel(
        id: 1,
        title: 'Qual é a estratégia de monetização do seu aplicativo?',
        hintText:
            'Como você pretende ganhar dinheiro com o aplicativo? você vai cobrar logo de cara (caso em que é mais difícil de obter usuários), ou você vai vender compras dentro do aplicativo ou outras atualizações uma vez que usuários baixar o aplicativo de graça? Estas são apenas duas opções de muitas ...');

    var question6 = new QuestionModel(
        id: 1,
        title: 'Qual é o recurso é mais importante para a monetização?',
        hintText:
            'Qual recurso faz com que o seu aplicativo valha a pena pagar? Qual é a principal razão para que o usuário compre o seu aplicativo, ou compre uma atualização dentro do aplicativo? (dependendo da sua estratéfia de monetização) .');

    var question7 = new QuestionModel(
        id: 1,
        title:
            'Qual é a especificidade da plataforma da sua ideia, e sua escalabilidade pode ser afetada?',
        hintText:
            'A sua ideia é viável apenas no iphone? Ou somente em dispositivos Android? Um produto ideal para smartphones vai ser escalável para tantas plataformas difrentes como o consumidor demanda.');

    var question8 = new QuestionModel(
        id: 1,
        title:
            'Quais 3 telas que você precisa para esboçar e/ou \'prototipar\' para ser capaz de obter feedback dos usuários em potencial?',
        hintText:
            'A melhor maneira de obter feedback sobre a sua ideia é mostrar a seus usuários-alvo um esboço ou mockup de como será seu aplicativo. Quais são as três telas que sãos vitais que retratam o propósito do seu aplicativo que você pode mostrar para ter uma ideia de como ele pode ou não usar tal produto?');

    var item = CategoryModel(id: 1, title: 'Aplicativo', questions: [
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
    var question = new QuestionModel(
        id: 1,
        title: 'Como isso está relacionado a concorrência?',
        hintText: '');
    var question2 = new QuestionModel(
        id: 1, title: 'Como você consegue os seus clientes?', hintText: '');
    var question3 =
        new QuestionModel(id: 1, title: 'Quem é o seu cliente?', hintText: '');
    var item = CategoryModel(id: 1, title: 'Negocios', questions: [
      question,
      question2,
      question3,
    ]);

    return item;
  }

  CategoryModel _mockRealizacao() {
    var question = new QuestionModel(
        id: 1, title: 'Qual será o primeiro passo?', hintText: '');
    var question2 = new QuestionModel(
        id: 1, title: 'Qual será o primeiro teste?', hintText: '');
    var question3 =
        new QuestionModel(id: 1, title: 'Quando você começa?', hintText: '');
    var question4 =
        new QuestionModel(id: 1, title: 'Quem pode te ajudar?', hintText: '');
    var item = CategoryModel(id: 1, title: 'Realização', questions: [
      question,
      question2,
      question3,
      question4,
    ]);

    return item;
  }

  CategoryModel _mockPessoal() {
    var question =
        new QuestionModel(id: 1, title: 'Porque você quer isso?', hintText: '');
    var question2 = new QuestionModel(
        id: 1, title: 'O que você pode aprender com essa ideia?', hintText: '');
    var question3 = new QuestionModel(
        id: 1, title: 'Será divertido trabalhar nisso?', hintText: '');
    var item = CategoryModel(id: 1, title: 'Pessoal', questions: [
      question,
      question2,
      question3,
    ]);

    return item;
  }

  CategoryModel _mockTolice() {
    var question = new QuestionModel(
        id: 1,
        title:
            'Descreva a sua ideial de tal forma que a concorrência iria pensar que você é incompenente',
        hintText: '');
    var question2 = new QuestionModel(
        id: 1,
        title:
            'Como você pode seduzir um político local para promover acidentalmente sua ideia?',
        hintText: '');
    var question3 = new QuestionModel(
        id: 1,
        title: 'Invente três buzzwords para promover sua ideia',
        hintText: '');
    var question4 = new QuestionModel(
        id: 1,
        title:
            'Escrever um poema de 6 linhas sobre sua ideia e e-mail para as pessoas que seriam mais confuso sobre isso. Coloque o poema e a resposta aqui.',
        hintText: '');
    var question5 = new QuestionModel(
        id: 1,
        title: 'Se você ideial seria um som, como alto jogaria?',
        hintText: '');
    var question6 = new QuestionModel(
        id: 1,
        title:
            'Se a sua ideia seria um animal, qual seria a sua comida favorita?',
        hintText: '');
    var item = CategoryModel(id: 1, title: 'Tolice', questions: [
      question,
      question2,
      question3,
      question4,
      question5,
      question6,
    ]);

    return item;
  }

  CategoryModel _mockSociedade() {
    var question =
        new QuestionModel(id: 1, title: 'Quem será beneficiado?', hintText: '');
    var question2 =
        new QuestionModel(id: 1, title: 'Quem vai pagar?', hintText: '');
    var question3 = new QuestionModel(
        id: 1, title: 'Quando é considerado um sucesso?', hintText: '');
    var item = CategoryModel(id: 1, title: 'Sociedade', questions: [
      question,
      question2,
      question3,
    ]);

    return item;
  }

  CategoryModel _mockStartup() {
    var question = new QuestionModel(
        id: 1,
        title: 'Qual problema sua startup vai resolver?',
        hintText:
            'Explique os pontos de dor do que as pessoas estão sofrendo.');
    var question2 = new QuestionModel(
        id: 1,
        title: 'Qual é a sua solução para este problema?',
        hintText: 'Descreva em poucas palavras como a sua ideia funciona.');
    var question3 = new QuestionModel(
        id: 1,
        title: 'Qual é o modelo de negócio?',
        hintText:
            'Compartilhe seus pensamentos sobre como isso pode gerar receita e fazer sua ideia gerar dinheiro.');
    var question4 = new QuestionModel(
        id: 1,
        title: 'Quão grande é o mercado-alvo?',
        hintText:
            'Calcule a oportunidade financeira para sua ideia. Pense em quantos clientes possuem o problema que você está resolvendo, quantas vezes eles usariam sua solução, e quanto eles pagariam por isso.');
    var question5 = new QuestionModel(
        id: 1,
        title:
            'Como você vai a comercialização de seu produto/serviço para os clientes?',
        hintText:
            'Suponha que você tenha uma primeira versão finalizada do seu produto. Pense em algumas maneiras que os seus clientes podem aprender sobre ele.');
    var question6 = new QuestionModel(
        id: 1,
        title: 'Existem outras empresas que façam algo semelhante?',
        hintText:
            'Descreva como o problema está sendo resolvido hoje pelos outros e por quem. Explique por que as soluções atuais não são boas o suficiente e por que a sua é melhor. Não se preocupe se não há concorrência. Apple e Google não foram as primeiras a fazer smartphones.');
    var question7 = new QuestionModel(
        id: 1,
        title: 'Habilidades e Equipe',
        hintText:
            'Pense nas habilidades que você precisa para transformar sua ideia em realidade. Descreva o que você pode contribuir e o que você ainda precisa. Dica: Confira Found2be se você estiver procurando por um co-confudados e alguma ajuda.');
    var question8 = new QuestionModel(
        id: 1,
        title: 'Passo de elevação',
        hintText:
            'Você está em um elevador e um potencial investidor que você queria encontrar há muito tempo entrou. Você tem 30 segundos para convencer ele sobre a sua startup. Vai! :)');
    var item = CategoryModel(id: 1, title: 'Startup', questions: [
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
}
