@i9n

#Controle

Feature: Respostas das Questões Argumentativas
    As a usuário esteja logado no sistema
    I want listar e adicionar respostas e  listar questões
    So that possa responder e analisar as questões dissertativas
  
Scenario: listar questões respondidas 
    Given que o sistema tenha a questão respondida "Faça um cenário"
    And o usuário esteja logado como aluno
    When ele ver a sua lista de questões 
    Then a lista irá conter "Faça um cenário"

Scenario: listar questoes que não foram respondidas  
    Given que o sistema tenha a questão não respondida "Faça uma feature"
    And o usuário esteja logado como aluno
    When ele ver a sua lista de questões 
    Then a lista irá conter "Faça uma feature"

Scenario: responder logado como professor
    Given que as questões só podem ser respondidas pelos alunos
    And o professor esteja logado
    When estiver na página de questões dissertativas
    Then não irá aparecer as questões para serem respondidas

#GUI

Scenario: aparecer questoes para responder 
    Given que esteja logado como aluno
    And esteja no menu de questões dissertativas
    And a questao "Criar um feature" não foi respondida
    Then a questão "Criar um feature" irá aparecer na tela

Scenario: listar questoes respondidas  
    Given que o aluno esteja logado
    And o sistema contenha a questão respondida "Como criar seu GitHub"
    And esteja no menu de questões dissertativas
    When selecionar a aba de questões respondidas
    Then a lista irá conter "Como criar seu GitHub"

Scenario: listar respostas dos alunos
    Given que o professor esteja logado
    And esteja no menu de questões dissertativas
    And seleciona a aba de questões respondidas
    When seleciona a opção de ver as respostas dos alunos
    Then a lista contem todas as respostas dos alunos

#Controle
Scenario: adicionar uma resposta 
	Given que o aluno esteja logado no sistema
	And tenha quest�es dissertativas para serem respondidas 
	When ele adicionar uma resposta para a quest�o
	Then a resposta ser� salva no sistema 

Scenario: listar respostas dos alunos
	Given que o professor esteja logado no sistema 
	And a quest�o "O que � Branch ?" j� foi respondida 
	When professor vizualizar a lista 
	Then ir� conter na lista a resposta da quest�o "O que � 	Branch?"
#GUI
Scenario: responder quest�es
	Given aluno esteja logado no sistema
	And esteja na aba de quest�es n�o respondidas
	When o aluno preencher a resposta da quest�o 
	And selecionar o bot�o de enviar 
	Then a resposta ser� armazendada no sistema

Scenario: listar quest�es n�o respondidas 
	Given aluno esteja logado no sistema
	And est� no menu de quest�es dissertativas
	When ele seleciona a aba de quest�es n�o respondidas
	Then ver� a lista de todas as quest�es n�o respondidas

#Erro
Scerario: enviar resposta em branco 
	Given aluno respondeu uma quest�o
	And deixa todo o campo de resposta em branco 
	When aluno tenta enviar quest�o
	Then quest�o n�o ser� salva no sistema


   