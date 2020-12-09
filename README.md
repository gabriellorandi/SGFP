## SGFP

O Sistema de Gerenciamento da Folha de Pagamento (SGFP) é uma API Web focado exclusivamente no gerenciamento e automação da folha de pagamento dos funcionários com base na quantidade de dias trabalhados.

## Objetivo

Demonstrar os conhecimentos de Dart no banco de dados Mongo, utilizando conhecimentos como Clean Code e MVC. 

## Tecnológias utilizadas

- [Dart](https://dart.dev/) 

- [Mongo](https://www.mongodb.com/).

## Install

### Linux

<b>Instale usando apt-get (única vez)<b><br/>
 
 ```shell
 sudo apt-get update
 sudo apt-get install apt-transport-https
 sudo sh -c 'wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
 sudo sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list' 
 ```

<b>Instale Dart SDK <b><br/>
 
 ```shell
 sudo apt-get update
 sudo apt-get install dart
 ```
 
## Exemplo de código

```Dart
  Future<List<Funcionario>> getFuncioncarios() 
    async => await funcionarioDB.find().map((f) => Funcionario.fromJson(f) ).toList();

  Future<Funcionario>  addFuncionario(var json ) async {
    Funcionario funcionario = Funcionario.fromJson(json);
    await funcionarioDB.save( json );
    return funcionario;
  }
```

## contribuidores

[Gabriel Lorandi](https://www.linkedin.com/in/gabriel-lorandi/)
[Jeiferson de Almeida](https://github.com/jeifersonalmeida)

 
