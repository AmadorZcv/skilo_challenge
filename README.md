# SkiloChallenge

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

# Style Guide
Style guide utilizado no desafio

https://github.com/lexmag/elixir-style-guide

# Money

Para evitar futuros problemas utilizei a biblioteca [Money](https://github.com/elixirmoney/money) para lidar com os valores, assumindo todos como BRL porém com possibilida de expansão

# Absinthe

Utilizei o [Absinthe](https://github.com/absinthe-graphql/absinthe) para fazer a implementação do GraphQL.
Os padroes foram todos com os códigos dele

# Validações

Todas as validações das restrições(balanço sempre positivo, transação somente para outras contas) foram feitas com constraints no banco
