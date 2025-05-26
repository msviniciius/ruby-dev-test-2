puts "Limpando dados antigos..."
Player.destroy_all
Album.destroy_all

puts "Criando jogadores..."
madonna = Player.create(name: 'Madonna')
shakira = Player.create(name: 'Shakira')
beyonce = Player.create(name: 'Beyoncé')
adele = Player.create(name: 'Adele')

puts "Criando álbuns..."
album1 = Album.create(name: 'Super Colab Hits')
album2 = Album.create(name: 'Greatest Hits')
album3 = Album.create(name: 'Pop Divas Unite')

puts "Associando jogadores aos álbuns..."
album1.players << [madonna, shakira]
album2.players << [madonna, beyonce]
album3.players << [shakira, adele]

puts "Dados criados com sucesso!"
