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
        title: 'Brief description / raising steps',
        hintText:
            'Try to describe your app\'s functionality in 1-2 sentences - if you can\'t do that, you\'re doing something very complete and you should consider simplifying it a bit.');

    var question2 = new QuestionModel(
        id: 2,
        title: 'What problem will your application solve?',
        hintText:
            'The most popular apps (unless they\'re strictly for entertainment purposes) are the ones that solve a real problem that smartphone users currently have. What will solve your problem?');

    var question3 = new QuestionModel(
        id: 3,
        title: 'Which target market will your app focus on?',
        hintText:
            'What would your app appeal to your target audience? Example: Mothers between 20 and 40 years old who are plugged into new technologies.');

    var question4 = new QuestionModel(
        id: 4,
        title: 'Are there already apps to compete with yours out there?',
        hintText:
            'If your app were brought to market, which existing apps already do something similar? What would you be competing for attention with? You may think that your application is unique and completely original, but there is always something to put, even if it is only remotely related.');

    var question5 = new QuestionModel(
        id: 5,
        title: 'What is your app’s monetization strategy?',
        hintText:
            'How do you plan to make money from the app? will you charge right away (in which case it is harder to get users), or will you sell in-app purchases or other updates once users download the app for free? These are just two options out of many ...');

    var question6 = new QuestionModel(
        id: 6,
        title: 'What is the most important resource for monetization?',
        hintText:
            'Which feature makes your app worth paying for? What is the main reason for the user to buy your app, or buy an update within the app? (depending on your monetization strategy).');

    var question7 = new QuestionModel(
        id: 7,
        title:
            'What is the specificity of your idea\'s platform, and can its scalability be affected?',
        hintText:
            'Is your idea feasible only on the iphone? Or only on Android devices? An ideal product for smartphones will be scalable to as many different platforms as the consumer demands.');

    var question8 = new QuestionModel(
        id: 8,
        title:
            'What 3 screens do you need to sketch and / or \'prototype\' to be able to get feedback from potential users?',
        hintText:
            'The best way to get feedback on your idea is to show your target users an outline or mockup of what your app will look like. What are the three screens that are vital that depict the purpose of your app that you can show off to get an idea of ​​how it can or cannot use such a product?');

    var item = CategoryModel(id: 1, title: 'App', questions: [
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
        id: 9,
        title: 'How is this related to competition?',
        hintText: '');
    var question2 = new QuestionModel(
        id: 10, title: 'How do you get your customers?', hintText: '');
    var question3 =
        new QuestionModel(id: 11, title: 'Who is your client?', hintText: '');
    var item = CategoryModel(id: 2, title: 'Business', questions: [
      question,
      question2,
      question3,
    ]);

    return item;
  }

  CategoryModel _mockRealizacao() {
    var question = new QuestionModel(
        id: 12, title: 'What will be the first step?', hintText: '');
    var question2 = new QuestionModel(
        id: 13, title: 'What will be the first test?', hintText: '');
    var question3 =
        new QuestionModel(id: 14, title: 'When you start?', hintText: '');
    var question4 =
        new QuestionModel(id: 15, title: 'Who can help you?', hintText: '');
    var item = CategoryModel(id: 3, title: 'Realization', questions: [
      question,
      question2,
      question3,
      question4,
    ]);

    return item;
  }

  CategoryModel _mockPessoal() {
    var question =
        new QuestionModel(id: 16, title: 'Why do you want that?', hintText: '');
    var question2 = new QuestionModel(
        id: 17, title: 'What can you learn from this idea?', hintText: '');
    var question3 = new QuestionModel(
        id: 18, title: 'Will it be fun to work on it?', hintText: '');
    var item = CategoryModel(id: 4, title: 'Personal', questions: [
      question,
      question2,
      question3,
    ]);

    return item;
  }

  CategoryModel _mockTolice() {
    var question = new QuestionModel(
        id: 19,
        title:
            'Describe your ideal in such a way that the competition would think you are incompetent',
        hintText: '');
    var question2 = new QuestionModel(
        id: 20,
        title:
            'How can you seduce a local politician to accidentally promote your idea?',
        hintText: '');
    var question3 = new QuestionModel(
        id: 21,
        title: 'Invent three buzzwords to promote your idea',
        hintText: '');
    var question4 = new QuestionModel(
        id: 22,
        title:
            'Write a 6-line poem about your idea and email it to people who would be most confused about it. Put the poem and the answer here.',
        hintText: '');
    var question5 = new QuestionModel(
        id: 23,
        title: 'If you were going to be a sound, how loud would you play?',
        hintText: '');
    var question6 = new QuestionModel(
        id: 24,
        title:
            'If your idea would be an animal, what would be your favorite food?',
        hintText: '');
    var item = CategoryModel(id: 5, title: 'Foolishness', questions: [
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
        new QuestionModel(id: 25, title: 'Who will benefit?', hintText: '');
    var question2 =
        new QuestionModel(id: 26, title: 'Who will pay?', hintText: '');
    var question3 = new QuestionModel(
        id: 27, title: 'When is it considered a success?', hintText: '');
    var item = CategoryModel(id: 6, title: 'Society', questions: [
      question,
      question2,
      question3,
    ]);

    return item;
  }

  CategoryModel _mockStartup() {
    var question = new QuestionModel(
        id: 28,
        title: 'What problem will your startup solve?',
        hintText:
            'Explain the pain points of what people are suffering from.');
    var question2 = new QuestionModel(
        id: 29,
        title: 'What is your solution to this problem?',
        hintText: 'Briefly describe how your idea works.');
    var question3 = new QuestionModel(
        id: 30,
        title: 'What is the business model?',
        hintText:
            'Share your thoughts on how it can generate revenue and make your idea generate money.');
    var question4 = new QuestionModel(
        id: 31,
        title: 'How big is the target market?',
        hintText:
            'Calculate the financial opportunity for your idea. Think about how many customers have the problem you are solving, how many times they would use your solution, and how much they would pay for it.');
    var question5 = new QuestionModel(
        id: 32,
        title:
            'How do you go about marketing your product / service to customers?',
        hintText:
            'Suppose you have a first completed version of your product. Think of some ways that your customers can learn about it.');
    var question6 = new QuestionModel(
        id: 33,
        title: 'Are there other companies that do something similar?',
        hintText:
            'Describe how the problem is being solved today by others and by whom. Explain why current solutions are not good enough and why yours is better. Don\'t worry if there is no competition. Apple and Google were not the first to make smartphones.');
    var question7 = new QuestionModel(
        id: 34,
        title: 'Skills and Team',
        hintText:
            'Think of the skills you need to make your idea a reality. Describe what you can contribute and what you still need. Tip: Check out Found2be if you are looking for a co-confused and some help.');
    var question8 = new QuestionModel(
        id: 35,
        title: 'Lifting step',
        hintText:
            'You are in an elevator and a potential investor you wanted to find has long since entered. You have 30 seconds to convince him about your startup. Go! :)');
    var item = CategoryModel(id: 7, title: 'Startup', questions: [
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
