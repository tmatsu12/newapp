require 'rails_helper'

describe 'test0' do
  describe 'top_view' do
    before do
      visit root_path
    end
    
    context 'confirmation' do
      it 'correct URL' do
        expect(current_path).to eq '/'
      end
    end
  end
end