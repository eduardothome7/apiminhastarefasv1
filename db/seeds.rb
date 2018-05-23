# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)"
User.destroy_all
Category.destroy_all
Project.destroy_all
Status.destroy_all
# Task.destroy_all
Team.destroy_all

@team  = Team.create(name: "Pós-Senac")
@team2 = Team.create(name: "Estúdio SIS")
@team3 = Team.create(name: "Freelance")

@desenvolvimento = Category.create(name: 'Desenvolvimento')
@ajustes 		 = Category.create(name: 'Ajustes')
@instalacao 	 = Category.create(name: 'Instalação')

@projeto1 = Project.create(name:'Tarefas - API Rails', team_id: @team2.id)
@projeto2 = Project.create(name:'Tarefas - App Ionic', team_id: @team.id)
@projeto3 = Project.create(name:'Trabalho Final Pós Senac', team_id: @team2.id)
@projeto4 = Project.create(name:'Ganha pão', team_id: @team2.id)

@opened = Status.create(name: 'aberta')
@closed = Status.create(name: 'entregue')

@eduardo = User.create(name:'Eduardo Thomé', nickname:'ethome47', email:'eduardo@hotmail.com', password:'wqew12345')
@user = User.create(email: 'user@example.com', nickname: 'UOne', name: 'User One', password: "monkey67")
# @lucas = User.create(name:'Lucas', last_name:'Seixas', email:'lucas@hotmail.com', picture:'', password:'4153543534')
# @diorgenes = User.create(name:'Diórgenes', last_name:'Eugênio', email:'diorgeneseugenio@hotmail.com', picture:'', password:'43254123123')
# @arthur = User.create(name:'Arthur', last_name:'Melo', email:'arthur@hotmail.com', picture:'', password:'4325452123')
# @renato = User.create(name:'Renato', last_name:'Portaluppi', email:'renato@gmail.com', picture:'', password:'4325452123')


TeamUser.create([{user_id: @eduardo.id, team_id: @team.id},
				 {user_id: @eduardo.id, team_id: @team2.id},
				 {user_id: @eduardo.id, team_id: @team3.id}])

# TeamUser.create([{user_id: @lucas.id, team_id: @team2.id},
# 				 {user_id: @diorgenes.id, team_id: @team2.id}])

# TeamUser.create([{user_id: @arthur.id, team_id: @team.id},
# 				 {user_id: @renato.id, team_id: @team.id}])


Task.create([{title: 'Liberar acesso API',category_id: @desenvolvimento.id,project_id: @projeto1.id,start_at: DateTime.now + 1.day, status_id:@closed.id, estimate_at: DateTime.now + 1.days, 
				estimate_min: 1.0,priority: 1, user_id:@eduardo.id, description: "Declarar no arquivo tasks_controller.rb o skip validation token, para liberar o acesso"},
   			{title: 'Criar model history_task',category_id: @desenvolvimento.id,project_id: @projeto1.id,start_at: DateTime.now + 1.day, status_id:@opened.id, estimate_at: DateTime.now + 1.days, 
				estimate_min: 1.0,priority: 2, user_id:@eduardo.id, description: "criar modelo com os campos task_id:integer, played:boolean"},
			{title: 'Criar método play/pause',category_id: @desenvolvimento.id,project_id: @projeto1.id,start_at: DateTime.now + 1.day, status_id:@opened.id, estimate_at: DateTime.now + 1.days, 
				estimate_min: 40,priority: 3,user_id: @eduardo.id, description: "Criar método que cria um history de acordo com o ultimo status do history anterior, permitindo apenas em tarefas abertas"},
			{title: 'Declarar método PUT play_pause',category_id: @desenvolvimento.id,project_id: @projeto1.id,start_at: DateTime.now + 1.day, status_id:@opened.id, estimate_at: DateTime.now + 1.days, 
				estimate_min: 120,priority: 4,user_id: @eduardo.id, description: "Declarar no routes.rb a rota PUT play_pause, além do método no controller e no model task.rb"},
			{title: 'Ajustes Veja',category_id: @eduardo.id, project_id: @projeto4.id,start_at: DateTime.now + 4.day, status_id:@opened.id, estimate_at: DateTime.now + 5.days, 
				estimate_min: 120,priority: 4,user_id: @eduardo.id, description: "Incluir html no pages/tasks a div fake"}])

