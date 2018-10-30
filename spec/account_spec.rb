require './lib/account.rb'

describe Account do
    let(:person) {instance_double('Person', name: 'Thomas')}
    subject { described_class.new({owner: person}) }

    it 'check length of pin number' do
        expect(subject.pin_code.digits.count).to eq 4
    end

    it 'is expected to have an expiry date on initialize' do
        expected_date = Date.today.next_year(5).strftime("%m/%y")
        expect(subject.exp_date).to eq expected_date
    end
    
    it 'is expected to have active status on initialize' do
        expect(subject.account_status).to eq :active
    end
    
    it 'is expected to disable the account when deactivated' do
        expect(subject.deactivate).to eq :disabled
    end

    it 'is expected to have an owner' do
        expect(subject.owner).to eq person
    end
end
