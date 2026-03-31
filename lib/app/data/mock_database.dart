class MockDatabase {
  // Singleton: Garante que a lista de usuários seja a mesma no app todo
  static final MockDatabase _instance = MockDatabase._internal();
  factory MockDatabase() => _instance;
  MockDatabase._internal();

  // Lista que guardará os usuários na memória (Enquanto o app estiver aberto)
  final List<Map<String, String>> _users = [
    {"email": "admin@admin.com", "senha": "123456"} // Usuário padrão para teste
  ];

  // Função para cadastrar novo usuário
  void registerUser(String email, String senha) {
    _users.add({"email": email, "senha": senha});
  }

  // Função para validar o login
  bool login(String email, String senha) {
    return _users.any((user) => user["email"] == email && user["senha"] == senha);
  }
}