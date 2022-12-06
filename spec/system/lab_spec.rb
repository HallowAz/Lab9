require 'rails_helper'

RSpec.describe 'Static content', type: :system do

    scenario 'correct values' do
        visit root_path

        fill_in :numb, with: 100

        find('#check_button').click
        
        expect(find("#val_1")).to have_text '100'
        expect(find("#val_2")).to have_text '101'
        expect(find('#result-container')).to have_text 'Для числа 100 гипотеза подтверждена'
    end

    scenario 'do not fill any values in form and click submit' do
        visit root_path 
    
        find('#check_button').click 
    
        LabResult.new.errors.messages.each do |message|
          expect(find('#result-container')).to have_text(message)
        end
    end
end