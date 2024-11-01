require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }
  let(:valid_attributes) { attributes_for(:user) }
  let(:invalid_attributes) { { first_name: nil, email: :invalid } }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    context 'with valid id' do
      it 'returns a success response' do
        get :show, params: { id: user.id }
        expect(response).to be_successful
      end
    end

    context 'with invalid id' do
      it 'returns a not found response' do
        get :show, params: { id: 9999 }
        expect(response).to redirect_to(users_path)
      end
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new User' do
        expect {
          post :create, params: { user: valid_attributes }
        }.to change(User, :count).by(1)
      end

      it 'returns a created status' do
        post :create, params: { user: valid_attributes }
        expect(response).to redirect_to(users_path)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new User' do
        expect {
          post :create, params: { user: invalid_attributes }
        }.not_to change(User, :count)
      end

      it 'returns an unprocessable entity response' do
        post :create, params: { user: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH #update' do
    let(:new_attributes) { { first_name: 'update first name' } }

    context 'with valid parameters' do
      it 'updates the requested user' do
        patch :update, params: { id: user.id, user: new_attributes }
        user.reload
        expect(user.first_name).to eq('update first name')
      end

      it 'returns a success response' do
        patch :update, params: { id: user.id, user: new_attributes }
        expect(response).to redirect_to(users_path)
      end
    end

    context 'with invalid parameters' do
      it 'does not update the user' do
        patch :update, params: { id: user.id, user: invalid_attributes }
        user.reload
        expect(user.first_name).not_to be_nil
      end

      it 'returns an unprocessable entity response' do
        patch :update, params: { id: user.id, user: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested user' do
      user = create(:user)
      expect {
        delete :destroy, params: { id: user.id }
      }.to change(User, :count).by(-1)
    end

    it 'returns a no content response' do
      delete :destroy, params: { id: user.id }
      expect(response).to redirect_to(users_path)
    end
  end
end
