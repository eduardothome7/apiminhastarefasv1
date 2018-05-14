# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)"

Category.destroy_all
Project.destroy_all
Status.destroy_all
Task.destroy_all

@team  = Team.create(name: "Pós-Senac")
@team2 = Team.create(name: "Estúdio SIS")
@team3 = Team.create(name: "Freelance")

@desenvolvimento = Category.create(name: 'Desenvolvimento')
@ajustes 		 = Category.create(name: 'Ajustes')
@instalacao 	 = Category.create(name: 'Instalação')

@projeto1 = Project.create(name:'Tarefas - API Rails', team_id: @team2)
@projeto2 = Project.create(name:'Tarefas - App Ionic', team_id: @team1)
@projeto3 = Project.create(name:'Trabalho Final Pós Senac', team_id: @team2)

@opened = Status.create(id:1, name: 'aberta')
@closed = Status.create(id:2, name: 'entregue')

Task.create([{title: 'Liberar acesso API',category_id: @desenvolvimento.id,project_id: @projeto1.id,start_at: DateTime.now + 1.day, status_id:@closed.id, estimate_at: DateTime.now + 1.days, 
				estimate_min: 1.0,priority: 1,description: "Declarar no arquivo tasks_controller.rb o skip validation token, para liberar o acesso"},
   			{title: 'Criar model history_task',category_id: @desenvolvimento.id,project_id: @projeto1.id,start_at: DateTime.now + 1.day, status_id:@opened.id, estimate_at: DateTime.now + 1.days, 
				estimate_min: 1.0,priority: 2,description: "criar modelo com os campos task_id:integer, played:boolean"},
			{title: 'Criar método play/pause',category_id: @desenvolvimento.id,project_id: @projeto1.id,start_at: DateTime.now + 1.day, status_id:@opened.id, estimate_at: DateTime.now + 1.days, 
				estimate_min: 40,priority: 3,description: "Criar método que cria um history de acordo com o ultimo status do history anterior, permitindo apenas em tarefas abertas"},
			{title: 'Declarar método PUT play_pause',category_id: @desenvolvimento.id,project_id: @projeto1.id,start_at: DateTime.now + 1.day, status_id:@opened.id, estimate_at: DateTime.now + 1.days, 
				estimate_min: 120,priority: 4,description: "Declarar no routes.rb a rota PUT play_pause, além do método no controller e no model task.rb"},
			{title: 'Criar fake para exibição de listagem ao carregar',category_id: @desenvolvimento.id, project_id: @projeto3.id,start_at: DateTime.now + 4.day, status_id:@opened.id, estimate_at: DateTime.now + 5.days, 
				estimate_min: 120,priority: 4,description: "Incluir html no pages/tasks a div fake"}])




