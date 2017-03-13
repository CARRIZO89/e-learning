puts 'Creating Provinces...'
provinces = Province.create([{name: 'Tucumán'}, {name: 'Buenos Aires'}, {name: 'Salta'}, {name: 'Jujuy'}, {name: 'Santa Fe'}, {name: 'Corrientes'}, {name: 'Catamarca'}, {name: 'Formosa'}, {name: 'Chaco'}, {name: 'Entre Rios'}, {name: 'Santiago del Estero'}, {name: 'Córdoba'}, {name: 'Misiones'}, {name: 'La Pampa'}, {name: 'San Juan'}, {name: 'Mendoza'}, {name: 'San Luis'}])

Person.create([{first_name: 'TeacherName', last_name: 'TeacherLastName', province_id: 2, type: "Teacher", dni: "22222222"},
            {first_name: 'StudentName', last_name: 'StudentLastName', province_id: 3, type: "Student", dni: "33333333"}])
puts 'Creating Roles...'
roles = Role.create([{name: 'Teacher'}, {name: 'Student'}, {name: 'Guest'}])
puts 'Creating Modalities...'
Modality.create([{name: 'Informe'}, {name: 'Multiple Choice'}, {name: 'Cuestionario Abierto'}, {name: 'No tiene'}])
puts 'Creating Users...'
User.create([{email: 'teacher@example.com', password: 'teacher123', role_id: 1, person_id: 1},
            {email: 'student@example.com', password: 'student123', role_id: 2, person_id: 2}])
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
puts 'Done!'