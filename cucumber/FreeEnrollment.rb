Given(/^que um curso "([^"]*)" tem assinatura gratuita $/) do |nome_curso|
	curso = Course.find(:name => nome_curso)
	assert_equal(curso.enrollment_type, 'free')
end

When(/^o curso "([^"]*)" é alterado para assinatura mensal$/) do |nome_curso|
	curso = Course.find(:name => nome_curso)
	assert_equal(curso.enrollment_type, 'monthly')
end

Then(/^bloqueia o acesso de todos os usuários cadastrados no curso "([^"]*)"$/) do |nome_curso|
	curso = Course.find(:name => nome_curso)
	curso.course_enrollments.each do |assinatura|
		assinatura.state = "waiting"
		assinatura.save
	end
end

And(/^notifica todos os usuários cadastrados no curso "([^"]*)" sobre a modificação da assinatura$/) do |nome_curso|
	curso = Course.find(:name => nome_curso)
	curso.course_enrollments.each do |assinatura|
		assinatura.notify_about_change
	end
end




Given(/^estou me cadastrando no curso "([^"]*)"$/) do |nome_curso|
	curso = Course.find(:name => nome_curso)
	assert_equal(current_page, 'course_enrollment')
	assert_equal(course_id, curso.id)
end

And(/^o curso "([^"]*)" foi cadastrado como “Gratuito”$/) do |nome_curso|
	curso = Course.find(:name => nome_curso)
	assert_equal(curso.enrollment_type, 'free')
end

When(/^eu confirmo minha inscrição no curso "([^"]*)"$/) do |nome_curso|
	curso = Course.find(:name = nome_curso)
	curso.join my_user
end

Then(/^minha inscrição no curso "([^"]*)" é automaticamente aprovada$/) do |nome_curso|
	curso = Course.find(:name = nome_curso)
	curso.join! my_user
end