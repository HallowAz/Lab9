require 'rails_helper'

RSpec.describe "Labs", type: :request do
  describe "GET /" do
    before { get root_path }
    
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it 'renders input template' do
      expect(response).to render_template(:input)
    end

    it 'responds with html' do
      expect(response.content_type).to match(%r{text/html})
    end
  end

  describe 'GET /result' do
    context 'when params are invalid' do
      before { post result_path, xhr: true }

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders result templates' do
        expect(response).to render_template(:result)
        expect(response).to render_template(:_result_message)
      end

      it 'responds with turbo stream' do
        expect(response.content_type).to match(%r{text/vnd.turbo-stream.html})
      end

      it 'assigns invalid model object' do
        expect(assigns(:res).valid?).to be false
      end
    end
  end

  context 'when params are ok' do
    before { post result_path, params: {numb: 100}, xhr: true }
    
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders result templates' do
      expect(response).to render_template(:result)
      expect(response).to render_template(:_result_message)
    end

    it 'responds with turbo stream' do
      expect(response.content_type).to match(%r{text/vnd.turbo-stream.html})
    end

    it 'assigns valid model object' do
      expect(assigns(:res).valid?).to be true
    end
  end

end
