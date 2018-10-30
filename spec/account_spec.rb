require './lib/account.rb'

describe Account do
    it 'check length of pin number' do
        expect(subject.pin_code.digits.count).to eq 4
    end

    it 'is expected to have an expiry date on initialize' do
        expected_date = Date.today.next_year(5).strftime("%m/%y")
        expect(subject.exp_date).to eq expected_date
    end
end
