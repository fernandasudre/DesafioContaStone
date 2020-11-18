# Desafio Conta Stone
## O Desafio
O desafio consiste em construir uma pequena aplicação que consome dados da API dos fatos do Chuck Norris voltada para iOS, permitindo que o usuário pesquise por Chuck Norris Facts via API e compartilhe eles com amigos.

Para obter os fatos da API é necessário fazer uma requisição ```GET``` na URL 
> https://api.chucknorris.io/jokes/search?query={query}

onde ```{query}``` será substituído pela pesquisa a ser feita.

Os valores a serem utilizados são:
- Valor - Texto do fato
- Categoria - que pode ou não ter um valor
- Id - String que irá possibilitar o compartilhamento do fato

Após a obtenção dos fatos, eles serão exibidos em uma table view na tela principal do aplicativo.


A documentação da API pode ser encontrada em:
> https://api.chucknorris.io/


## Critérios de Avaliação 
- SOLID e Clean Code
- Dependency Injection 
- Exercite o código em suas múltiplas formas de uso/fluxo com testes automatizados, nos níves de unidade, integração e aceitação
- Programação reativa funcional (RxSwift / RxJava) 
- Arquitetura de responsabilidades bem definida (MVC, MVVM, VIPER, etc)
- Faça o uso correto de um setup de Continous Integration e está pronto para Continuous Delivery
- User interface otimizada e que faz uso das técnicas mais modernas relacionadas aos toolkits de UI nativos
- Mecanismos para lógica de divisão de tarefas, bem como de tracking de execução das mesmas
- Uso de Git
- Documentação 

## Requisitos
- A tela principal da aplicação mostra a lista com os fatos do Chuck Norris. No primeiro acesso do app, essa tela está vazia
- Essa tela oferece um link acionável que direciona o usuário para a tela onde ele pode pesquisar por fatos.
- Ao pesquisar com sucesso um fato, os resultados são exibidos na tela principal da aplicação
- Utilizar a abordagem de UI mais aderente à plataforma para 
	- exibir a listagem
	- chamar a tela de pesquisa
- Cada entrada na lista deve ser acionável, no sentido de permitir que o usuário compartilhe a URL do Chuck Norris Fact
- As entradas da lista podem variar muito com o tamanho do fato em si : para isso, é necessário adotar dois tamanhos de fonte diferentes de acordo com o número de caracteres do Chuck Norris Fact. Usar 80 caracteres como critério de decisão. Essa lógica de front-end deve ser testável.
- Nem todos os fatos podem ter uma categoria associada. Nesse caso, um label UNCATEGORIZED deve ser associado à entrada na lista. Essa lógica de front-end deve ser testável.
- Essa lista não é paginada e nem atualizável por pull-to- refresh ou similares
- A lógica deve ser robusta o suficiente para informar ao usuário não apenas os resultados de pesquisa bem sucedida, mas também estados de erro de interesse
- Oferecer estados e implementações de UI e ações distintas para erros de conexão e erros de REST
- Todas as possíveis saídas da tela devem estar testadas de forma automatizada em nível de integração, e prefencialmente em nível funcional de aceitação via testes de UI
