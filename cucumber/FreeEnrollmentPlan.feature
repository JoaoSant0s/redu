@i9n
	Feature: configuração de assinatura gratuita

	As a administrador de curso
	I want to disponibilizar cursos de forma gratuita
	So that os usuários podem consumir conteúdo sem custo o conteúdo do curso

	# === CONTROLLER ===

	Scenario: configuração do modo de pagamento do curso
	Given estou cadastrando um novo curso 
	And estou na fase de escolha do valor da assinatura
	When eu escolho a opção “Gratuito”
	Then a opção de pagamento do curso é salva como “Gratuito”

	Scenario: cadastro de um curso com preço zero
	Given estou cadastrando um novo curso 
	And estou na fase de escolha do valor da assinatura
	And eu escolho a opção “Assinatura mensal”
	When eu digito o preço como zero
	Then a opção de pagamento do curso é salva como “Gratuito”

	Scenario: Modificar assinatura de curso de “Mensal” para “Gratuita”
	Given estou na página de configurações da assinatura de um curso
	When eu seleciono a opção de assinatura do curso para “Gratuito”
	Then o curso é alterado para “Assinatura Gratuita”

	Scenario: Modificar assinatura de curso de “Mensal” para “Gratuita”, dado que escolheu preço zero
	Given estou na página de configurações da assinatura de um curso
	When eu preencho com "0" o valor do curso
	Then o curso é alterado para “Assinatura Gratuita”

	Scenario: Modificar assinatura de um curso que possui “Assinatura Gratuita” para “Assinatura Mensal”
	Given estou na pagina de configurações de assinatura de um curso
	When eu seleciono a opção assinatura mensal
	And eu preencho o valor do curso
	Then o curso é alterado para “Assinatura Mensal”

	Scenario: Avisa aos usuários cadastrados em um curso que possui “Assinatura Mensal”, que seu curso agora possui uma “Assinatura Gratuita”
	Given que um curso tem Assinatura Mensal
	When o curso é alterado para “Assinatura Gratuita”
	Then notifica todos os usuários cadastrados naquele curso sobre a modificação da assinatura

	
	Scenario: Avisa aos usuários cadastrados em um curso que possui “Assinatura Gratuita”, que seu curso agora possui uma “Assinatura Mensal”
	Given que um curso tem assinatura gratuita
	When o curso é alterado para assinatura mensual
	Then boqueia o acesso de todos os usuários cadastrados naquele curso
	And notifica todos os usuários cadastrados naquele curso sobre a modificação da assinatura

	Scenario: opção de tornar o curso com “Assinatura Mensal” para “Assinatura Gratuita” para todos os usuários cadastrados no curso
	# See my comment in the english version
	Given eu estou nas configurações de assinatura do curso
	When eu seleciono a opção "Adicionar Bolsistas"
	And seleciono a opção "Selecionar todos os alunos"
	Then todos os alunos matriculados no curso agora possuem uma "Assinatura Gratuita" no mesmo

	# === GUI ===

	Scenario: cadastro de um curso com opção de pagamento “Gratuito”
	Given estou cadastrando um novo curso 
	And estou na fase de escolha do valor da assinatura
	When eu escolho a opção “Assinatura mensal”
	Then um campo para informar o preço é exibido

	Scenario: cadastro de um curso com opção de pagamento “Assinatura Mensal”
	Given estou cadastrando um novo curso 
	And estou na fase de escolha do valor da assinatura
	When eu escolho a opção “Gratuito”
	Then o campo para informar o preço é escondido

	Scenario: Criar curso sem tipo de assinatura
	Given estou cadastrando um novo curso
	And estou na fase de escolha da assinatura
	When eu tento avançar na criação do curso sem escolher a assinatura
	Then eu não consigo avançar

	Scenario: mudança de assinatura
	Given estou na pagina de configuraçao do curso
	And estou trocando a opçao de assinatura
	When eu confirmo o troco
	Then uma notificaçao confirma o troco
	# not sure about how to write this haha
