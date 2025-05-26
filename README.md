# Refactoring de relacionamento

> A Madonna resolveu lançar um album em parceria com a Shakira! E agora?!

Nosso PO jamais iria esperar que um album pudesse ter mais de um artista. Transforme a relacão 1 para N entre Player e Album em uma relação N para N. Precisamos de testes senão o chato do agilista vai brigar conosco!

---

🔁 Refatoração de Relacionamento: Player x Album

🎯 Cenário
Originalmente, cada álbum pertencia a um único artista (Player). Porém, surgiu a necessidade de suportar álbuns colaborativos com múltiplos artistas (por exemplo, Madonna e Shakira lançando um álbum juntas). Isso exigiu a conversão do relacionamento 1:N em um relacionamento N:N entre Player e Album.

🛠️ Solução Adotada
A abordagem escolhida foi utilizar uma tabela de junção (albums_players) para modelar esse relacionamento N:N utilizando has_and_belongs_to_many.

✅ Passos aplicados
1. Remoção da coluna antiga player_id da tabela albums
2. Criação da tabela de junção albums_players
3. Atualização dos models

---

# ruby-dev-test-2

Este projeto utiliza **Ruby 2.4.1** e **Rails 5.2.0**, conforme solicitado no desafio. Durante a instalação e execução do ambiente, foram encontrados alguns problemas de compatibilidade com gems modernas. Este documento explica os erros enfrentados e as soluções aplicadas para resolvê-los com sucesso.

---

## 📌 Versões utilizadas

- **Ruby**: 2.4.1
- **Rails**: 5.2.0
- **SQLite3**: 1.3.13

---

## ⚠️ Problemas enfrentados e soluções

### 1. `rails: command not found`

#### Problema
Mesmo após configurar o Ruby 2.4.1 com `rbenv`, o comando `rails` não funcionava.

#### Causa
A gem `rails` ainda não havia sido instalada para essa versão específica do Ruby.

#### Solução
Instalar a versão correta do Rails com:

```bash
gem install rails -v 5.2.0
```

> Obs: Rails 5.2.0 depende de gems que também devem ser compatíveis com Ruby 2.4.1 (ver próximos itens).

---

### 2. `racc requires Ruby version >= 2.5.`

#### Problema
Ao tentar instalar a gem `rails`, a instalação falhou com o erro:

```
racc requires Ruby version >= 2.5
```

#### Causa
Gems como `racc` (parser usado por Rails internamente) foram atualizadas e deixaram de suportar Ruby < 2.5.

#### Solução
Fixar a versão do `racc` compatível com Ruby 2.4.1. Isso pode ser feito adicionando ao `Gemfile`:

```ruby
gem 'racc', '< 1.5'
```

---

### 3. `sqlite3 requires Ruby version >= 2.7`

#### Problema
Ao rodar `bundle install`, a gem `sqlite3` falha com a mensagem:

```
sqlite3-1.6.9-x86_64-linux requires ruby version < 3.3.dev, >= 2.7
```

#### Causa
As versões mais novas da gem `sqlite3` são incompatíveis com Ruby 2.4.1.

#### Solução
Usar a versão **antiga e compatível** do `sqlite3`, com o seguinte trecho no `Gemfile`:

```ruby
gem 'sqlite3', '~> 1.3.13'
```

Essa versão foi amplamente usada com o Rails 5.2 na época.

---

## ✅ Resultado final no `Gemfile`

```ruby
source 'https://rubygems.org'
ruby '2.4.1'

gem 'rails', '~> 5.2.0'
gem 'sqlite3', '~> 1.3.13'
gem 'racc', '< 1.5'
```

---

## 🛠 Comandos para preparar o ambiente

```bash
# Certifique-se de estar com Ruby 2.4.1
rbenv local 2.4.1

# Instale bundler se necessário
gem install bundler

# Instale as dependências
bundle install

# Crie o banco de dados
rails db:create
rails db:migrate
```

---

## ⚠️ Erro uninitialized constant Nokogiri::HTML4

#### Causa
Algumas versões recentes da gem loofah utilizam Nokogiri::HTML4, que não está disponível em versões 
antigas do nokogiri compatíveis com Ruby 2.4.1.

#### Solução
Travar a versão da gem loofah para uma versão compatível com Nokogiri antigo:

```ruby
gem 'loofah', '~> 2.19.0'
```

## 💡 Dica para evitar erros

Sempre que estiver usando uma versão antiga do Ruby ou Rails, pode ser necessário **fixar versões compatíveis de gems** no `Gemfile`. Isso ajuda a evitar erros causados por atualizações incompatíveis que ocorrem ao longo do tempo.

---

## 📚 Referências

- https://guides.rubyonrails.org/v5.2/
- https://github.com/rbenv/rbenv
- https://rubygems.org/gems/sqli




