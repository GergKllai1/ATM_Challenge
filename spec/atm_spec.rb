require './lib/atm.rb'

describe Atm do
  it 'has 1000$ on initialize' do
    expect(subject.funds).to eq 1000
  end
<<<<<<< HEAD
=======
  it 'funds are reduced at withdraw' do
    subject.withdraw 50
    expect(subject.funds).to eq 950 
  end
>>>>>>> adfe4ea9f6588e04b687409530e2a7b757176e99
end