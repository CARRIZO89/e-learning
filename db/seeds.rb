puts 'Creating Provinces...'
Province.create([{name: 'Buenos Aires' }, {name: 'Catamarca' }, {name: 'Chaco' },
                     {name: 'Chubut' }, {name: 'Ciudad Autónoma de Buenos Aires' }, {name: 'Córdoba' },
                     {name: 'Corrientes' }, {name: 'Entre Ríos' }, {name: 'Formosa' }, {name: 'Jujuy' },
                     {name: 'La Pampa' }, {name: 'La Rioja' }, {name: 'Mendoza' }, {name: 'Misiones' },
                     {name: 'Neuquén' }, {name: 'Río Negro' }, {name: 'Salta' }, {name: 'San Juan' },
                     {name: 'San Luis' }, {name: 'Santa Cruz' }, {name: 'Santa Fe' },
                     {name: 'Santiago del Estero' }, {name: 'Tierra del Fuego' }, {name: 'Tucumán' }])

Person.create([{first_name: 'TeacherName', last_name: 'TeacherLastName', province_id: 2, type: "Teacher", dni: "22222222"},
            {first_name: 'StudentName', last_name: 'StudentLastName', province_id: 3, type: "Student", dni: "33333333"}])
puts 'Creating Roles...'
Role.create([{name: 'Teacher'}, {name: 'Student'}, {name: 'Guest'}])
puts 'Creating Modalities...'
Modality.create([{name: 'Informe'}, {name: 'Multiple Choice'}, {name: 'Cuestionario Abierto'}, {name: 'No tiene'}])
puts 'Creating Users...'
User.create([{email: 'teacher@example.com', password: 'teacher123', role_id: 1, person_id: 1},
            {email: 'student@example.com', password: 'student123', role_id: 2, person_id: 2}])
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
puts 'Done!'