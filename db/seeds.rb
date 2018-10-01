# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create(title: 'Star Wars Episode IV DVD', price: 20.00, isBlueray: false)
Product.create(title: 'Star Wars Episode V DVD', price: 20.00, isBlueray: false)
Product.create(title: 'Star Wars Episode VI DVD', price: 20.00, isBlueray: false)
Product.create(title: 'Star Wars Episode IV Blu-Ray', price: 25.00, isBlueray: true)
Product.create(title: 'Star Wars Episode V Blu-Ray', price: 25.00, isBlueray: true)
Product.create(title: 'Star Wars Episode VI Blu-Ray', price: 25.00, isBlueray: true)
