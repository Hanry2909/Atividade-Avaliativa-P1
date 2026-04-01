#  Atividade Avaliativa P1 - Desenvolvimento de Dispositivos Móveis

Este projeto é uma aplicação Flutter desenvolvida para a avaliação P1, focada em autenticação, navegação e organização de código seguindo padrões de arquitetura modernos.

##  Funcionalidades Demonstradas
O fluxo completo da aplicação abrange:
- **Cadastro de Usuários:** Criação de novas credenciais armazenadas em um banco de dados mockado.
- **Autenticação (Login):** Validação de credenciais para acesso ao sistema.
- **Fluxo de Retorno:** Navegação inteligente entre telas de Login e Cadastro.
- **Home Page:** Dashboard com layout em Grid contendo menus de Perfil, Relatórios, Alertas e Configurações.

---

##  Arquitetura Adotada: MVVM (Model-View-ViewModel)

A arquitetura escolhida para este projeto foi o **MVVM**, visando a separação de responsabilidades e facilidade de manutenção:

1.  **Model:** Representa os dados e a lógica de negócio (ex: `UserModel` e `MockDatabase`).
2.  **View (UI):** Telas construídas em Flutter que observam as mudanças e reagem às interações do usuário.
3.  **ViewModel:** Atua como ponte, processando a lógica das telas (como a validação de login) e mantendo o estado da interface limpo.

> **Destaque Técnico:** Foi utilizado o padrão **Singleton** para o `MockDatabase`, garantindo que os dados cadastrados persistam na memória enquanto o aplicativo estiver em execução.

---

## Tecnologias Utilizadas
- **Linguagem:** Dart
- **Framework:** Flutter
- **Gerenciamento de Rotas:** Rotas nomeadas centralizadas.
- **Ícones:** Material Design Icons.

---

**Nome:** Hanry de Sousa
**RA:** 24001865
**Repositório:** [Hanry2909/Atividade-Avaliativa-P1](https://github.com/Hanry2909/Atividade-Avaliativa-P1)
