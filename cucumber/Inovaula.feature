Feature: Integração do sistema Openredu e Inovaula Steps
    As a Usuário do Openredu
    I want to poder associar os conteúdos da disciplina que estou estudando no OpenRedu à 
    conteúdos de mesma área presentes no Inovaula 
    So that poder linkar esses conteúdos relacionados a uma disciplina.
    
    Scenario: Link accounts
        Given I am a "Teacher" with an account on Inovaula
	And I am logged in Redu as a "Teacher"
	Then I should be able to link my accounts

    Scenario: Unlink account
	Given I am a "Teacher" with a linked account on Inovaula
	And I am logged in Redu as a "Teacher"
	And I have no "Class" "in progress"
	Then I should be able to unlink my account

    Scenario: List contents available on Inovaula
	Given I am a "Student"
	And I am in a class about "Physics"
	Then I should be able to answer exams on the subject from Inovaula
	But I should not be able to get the answers

    Scenario: Find a teacher for a class
	Given I am interested in an unavailable "Class"
	Given that exists a "Teacher" with material on the subject on Inovaula
	Then I should be able to fire a class planning notification to a "Teacher"

    Scenario: Editar link presente em uma disciplina no OpenRedu que redireciona para conteúdos do inovaula
        Given Estou logado como “administrador” da disciplina  
        And Estou na pagina de “configurações” da disciplina
        And o link para disciplina no inovaula é especificado como "http://inovaula.com.br/planos/física/grandezas-e-unidades/aula1"
        When seleciono a opção “Editar” no menu
        And altero o link "http://inovaula.com.br/planos/física/grandezas-e-unidades/aula1" para "http://inovaula.com.br/planos/física/grandezas-e-unidades/aula2"
        Then é exibida uma mensagem de confirmação
        And o link é alterado.
  
     Scenario: Remover link presente em uma disciplina no OpenRedu que redireciona para conteúdos do inovaula.
        Given Estou logado como “administrador” da disciplina "Grandezas e Unidades"
        And Estou na pagina de “configurações”
        When eu clicar no botão Remover
        Then o link é removido da disciplina.
  
    Scenario: Remoção de links sem estar logado como administrador da disciplina
        Given Eu estou logado como "Usuario"
        When eu clico na opção de configurações da disciplina no OpenRedu
        Then é exibida uma mensagem de erro “Você não tem as permissões necessárias para realizar esta ação”
  
    Scenario:  Clicar na opção “Conteúdos”
        Given  Estou na pagina da disciplina “Grandezas e Unidades”
        When eu clico na opção “Conteúdos auxiliares”
        Then Uma nova guia é aberta no navegador
        And é exibida a pagina de conteúdos do inovaula relacionados a disciplina.