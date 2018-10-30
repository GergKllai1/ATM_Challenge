require './lib/account.rb'

describe Account do
    it 'check length of pin number' do
        expect(subject.pin_code.digits.count).to eq 4
    end
end
