# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

recept_types = ReceptType.create([
                                    {name: 'Test recept type 1'},
                                    {name: 'Test recept type 2'},
                                    {name: 'Test recept type 3'}
                                ])

recepts = Recept.create([
                            {name: 'Recept1', recept_type: recept_types.first},
                            {name: 'Recept2', recept_type: recept_types.last}])

Planer.create([
                  { day: 'Hétfő', recepts: recepts },
                  { day: 'Kedd'},
                  { day: 'Szerda'},
                  { day: 'Csütörtök'},
                  { day: 'Péntek'},
                  { day: 'Szombat'},
                  { day: 'Vasárnap'}
              ])
