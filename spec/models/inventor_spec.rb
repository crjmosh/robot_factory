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

end
