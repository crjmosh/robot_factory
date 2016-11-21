require 'rails_helper'

RSpec.describe Robot, type: :model do

	describe 'associations' do
		it { should have_many :parts }
		it { should belong_to :inventor }
	end

	describe 'validations' do
		it { should validate_presence_of(:name) }
		it { should validate_presence_of(:serial_number) }
		it { should validate_uniqueness_of(:name) }
		it { should validate_uniqueness_of(:serial_number) }

		it do
			should validate_inclusion_of(:industry).
			in_array(['education', 'war', 'service', 'novelty', nil])
		end
	end

end