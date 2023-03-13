class MyObject {
  String title;
  int contentRemaining;
  bool unlocked;
  List<String> description;
  int color;

  MyObject({
    required this.title,
    required this.contentRemaining,
    required this.unlocked,
    required this.description,
    required this.color,
  });
}

List<MyObject> choicelist = [
  MyObject(
    title: "What in the world is ChatGPT",
    contentRemaining: 2,
    unlocked: true,
    description: [
      "ChatGPT? GPT-3... What is AI?",
      "ChatGPT a friend or foe?",
    ],
    color: 0xAAF5D1D1,
  ),
  MyObject(
    title: "Game Development (Chat GPT)",
    contentRemaining: 2,
    unlocked: true,
    description: [
      "ChatGPT can be used to generate dynamic and realistic dialogues for NPCs in games, enhancing the overall gaming experience.",
      "ChatGPT can be used to generate dynamic worlds in games by generating unique and diverse descriptions of environments, characters, and objects, making the game world more immersive and engaging for players.",
    ],
    color: 0xAAD1EFF5,
  ),
  MyObject(
    title: "Web and App Development (Chat GPT)",
    contentRemaining: 1,
    unlocked: true,
    description: [
      "Chat GPT can assist developers to build faster by automating the process of generating natural language text, such as documentation, customer support responses, and chatbot interactions.",
      "Chat GPT is a powerful tool for generating natural language text quickly, but its output should be carefully evaluated and used in combination with human-generated text.",
    ],
    color: 0xAAD1F5DF,
  ),
  MyObject(
    title: "Dall E (Stable Diffiusion)",
    contentRemaining: 2,
    unlocked: true,
    description: [
      "What is Stable Diffusion and how does it work?",
      "Research advancements and ethical concerns of the AI with stealing the work of artists",
    ],
    color: 0xAAF5EBD1,
  ),
  MyObject(
    title: "Chat GPT (Tips And Tricks)",
    contentRemaining: 1,
    unlocked: true,
    description: [
      "How to use ChatGPT to send emails, construct essays, frame questions",
      "How to make use of ChatGPT to generate blog posts, fan fiction",
    ],
    color: 0xAAD1DFF5,
  ),
];
