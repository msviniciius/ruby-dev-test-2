require 'rails_helper'

RSpec.describe Player, type: :model do
  it { is_expected.to have_and_belong_to_many(:albums) }
  it { is_expected.to validate_presence_of(:name) }

  it 'permite que um álbum tenha múltiplos artistas' do
    madonna = Player.create(name: 'Madonna')
    shakira = Player.create(name: 'Shakira')
    album = Album.create(name: 'Greatest Hits')

    album.players << madonna
    album.players << shakira

    expect(album.players).to contain_exactly(madonna, shakira)
    expect(madonna.albums).to include(album)
    expect(shakira.albums).to include(album)
  end
end