Feature: Integra��o do sistema Openredu e Inovaula Steps
    As a Usu�rio do Openredu
    I want to poder associar os conte�dos da disciplina que estou estudando no OpenRedu � 
    conte�dos de mesma �rea presentes no Inovaula 
    So that poder linkar esses conte�dos relacionados a uma disciplina.
    
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

    Scenario: Editar link presente em uma disciplina no OpenRedu que redireciona para conte�dos do inovaula
        Given Estou logado como �administrador� da disciplina  
        And Estou na pagina de �configura��es� da disciplina
        And o link para disciplina no inovaula � especificado como "http://inovaula.com.br/planos/f�sica/grandezas-e-unidades/aula1"
        When seleciono a op��o �Editar� no menu
        And altero o link "http://inovaula.com.br/planos/f�sica/grandezas-e-unidades/aula1" para "http://inovaula.com.br/planos/f�sica/grandezas-e-unidades/aula2"
        Then � exibida uma mensagem de confirma��o
        And o link � alterado.
  
     Scenario: Remover link presente em uma disciplina no OpenRedu que redireciona para conte�dos do inovaula.
        Given Estou logado como �administrador� da disciplina "Grandezas e Unidades"
        And Estou na pagina de �configura��es�
        When eu clicar no bot�o Remover
        Then o link � removido da disciplina.
  
    Scenario: Remo��o de links sem estar logado como administrador da disciplina
        Given Eu estou logado como "Usuario"
        When eu clico na op��o de configura��es da disciplina no OpenRedu
        Then � exibida uma mensagem de erro �Voc� n�o tem as permiss�es necess�rias para realizar esta a��o�
  
    Scenario:  Clicar na op��o �Conte�dos�
        Given  Estou na pagina da disciplina �Grandezas e Unidades�
        When eu clico na op��o �Conte�dos auxiliares�
        Then Uma nova guia � aberta no navegador
        And � exibida a pagina de conte�dos do inovaula relacionados a disciplina.