# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


blocks = Block.create([{ date: '09:00:00', description: ''}, { date: '10:00:00', description: ''}, 
		{ date: '11:00:00', description: ''}, { date: '12:00:00', description: ''}, { date: '13:00:00', description: ''},
        { date: '15:00:00', description: ''}, { date: '16:00:00', description: ''}, { date: '17:00:00', description: ''},
        { date: '18:00:00', description: ''}, { date: '19:00:00', description: ''}])

doctors = Doctor.create([{ email: 'doctor1@uc.cl', first_name: 'Alexis Sanchez', password: '123456', cel_number: '+56966682210' },
                         { email: 'doctor2@uc.cl', first_name: 'Arturo Vidal', password: '123456', cel_number: '+56966682210' },
                         { email: 'doctor3@uc.cl', first_name: 'Charles Aranguiz', password: '123456', cel_number: '+56966682210' },])


clients = Client.create([{ email: 'achadwick@uc.cl', password: '123456', rut: '19234231', first_name: 'Alberto', last_name: 'Chadwick', cel_number: '+56999363418'}])
clients = Client.create([{ email: 'vramos1@uc.cl', password: '123456', rut: '19234232', first_name: 'Vicente', last_name: 'Ramos', cel_number: '+56992532462'}])
clients = Client.create([{ email: 'agarciadelahuerta2@uc.cl', password: '123456', rut: '19234233', first_name: 'Andres', last_name: 'Garcia de la Huerta', cel_number: '+56968415284'}])
clients = Client.create([{ email: 'fjlarach@uc.cl', password: '123456', rut: '19234234', first_name: 'Francisco', last_name: 'Larach', cel_number: '+56995912983'}])
clients = Client.create([{ email: 'ftvannievelt@uc.cl', password: '123456', rut: '19234235', first_name: 'Francisco', last_name: 'Van Nievelt', cel_number: '+56966682210'}])
