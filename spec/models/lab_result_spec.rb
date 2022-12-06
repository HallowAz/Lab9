# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LabResult, type: :model do
    
    describe 'validations' do
        it { should validate_presence_of(:numb).with_message('не может быть пустым')}

        context 'when numb are not digit' do 
            it { should_not allow_value(Faker::Lorem.word).for(:numb)}
        end
        context 'when numb are digit' do 
            it { should allow_value(Faker::Number.number).for(:numb)}
        end
    end

    describe '#result' do
        let(:params) { { numb: 100} }
        
        subject { described_class.new(params) }

        it 'should return 101 values' do
          expect(subject.result).to eq([100, '101'])
        end

    end

end