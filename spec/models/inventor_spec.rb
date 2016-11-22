require 'rails_helper'

RSpec.describe Inventor, type: :model do

	describe 'associations' do
		it { should have_many :robots }
	end

	describe 'validations' do
		it { should validate_presence_of (:name) }
		it { should validate_presence_of (:hire_date) }

		it do
			should validate_inclusion_of(:speciality).
			in_array(['software', 'hardware', 'education', 'mad', nil])
		end
	end

	describe 'class methods' do
		describe '.by_name' do
			it 'returns inventors ordered by name' do
				i1 = Inventor.create(name: 'Jeffrey', hire_date: '2016-11-15')
				i2 = Inventor.create(name: 'Cole', hire_date: '2016-11-15')
				i3 = Inventor.create(name: 'Zed', hire_date: '2016-11-15')

				by_name = Inventor.all.by_name
				expect(by_name[0].name).to eq(i2.name)
				expect(by_name[1].name).to eq(i1.name)
				expect(by_name[2].name).to eq(i3.name)
			end
		end
	end

end
