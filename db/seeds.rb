# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Planer.create([
                  { day: 'Hétfő' },
                  { day: 'Kedd'},
                  { day: 'Szerda'},
                  { day: 'Csütörtök'},
                  { day: 'Péntek'},
                  { day: 'Szombat'},
                  { day: 'Vasárnap'}
              ])
Size.create([
                { unit: 'kg'},
                { unit: 'liter'},
                { unit: 'darab'},
                { unit: 'zacskó'},
                { unit: 'csomag'}
            ])

ReceptType.create([
                { name: 'Leves'},                       
                { name: 'Második'}, 
                { name: 'Sütemény'},                          
                { name: 'Egytálétel'}                                                                 
            ])
Recept.create([
                { name: 'Almaleves', recept_type_id: '1'},
                { name: 'Húsleves', recept_type_id: '1'},
                { name: 'Krumplileves', recept_type_id: '1'},
                { name: 'Rizskoch', recept_type_id: '2'},
                { name: 'Székelykáposzta', recept_type_id: '4'}
            ])
MaterialCategory.create([
                { name: 'Zöldség'},                        
                { name: 'Gyümölcs'},                          
                { name: 'Tejtermék'},                          
                { name: 'Hús'},                                                          
                { name: 'Tartós'}
            ])
Material.create([
                { name: 'Cukor', material_category_id: '4'},
                { name: 'Alma', material_category_id: '1'},                         
                { name: 'Tejszín', material_category_id: '2'},
                { name: 'Darálthús', material_category_id: '3'}
            ])
