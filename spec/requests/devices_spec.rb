require 'rails_helper'


RSpec.describe "/devices", type: :request do

  let(:valid_attributes) {
    user = User.create( email: "ar@gmail.com", password: "123456")
    valid_attributes= {name: "Test Device", description: "Test Description", user_id: user.id, images: [{url: "https://www.google.com/search?q=image&client=ubuntu&hs=GjT&channel=fs&sxsrf=ALeKk03E7N6mGpLbskPjfe5GEj382CboWg:1627562491348&tbm=isch&source=iu&ictx=1&fir=nH5liarSz56duM%252C0JWe7yDOKrVFAM%252C_&vet=1&usg=AI4_-kTwdcaxC3EyM3cAymsAi7Y_Y1GC8Q&sa=X&ved=2ahUKEwiQp5XhpojyAhXBgP0HHWYuAV0Q9QF6BAgKEAE#imgrc=nH5liarSz56duM"}] }
  }

  let(:invalid_attributes) {
    user = User.create( email: "ari@gmail.com", password: "123456")
    invalid_attributes= {name: "Test Device", description: "Test Description", user_id: user.id, images: [{url: "https://www.google.com/search?q=image&client=ubuntu&hs=GjT&channel=fs&sxsrf=ALeKk03E7N6mGpLbskPjfe5GEj382CboWg:1627562491348&tbm=isch&source=iu&ictx=1&fir=nH5liarSz56duM%252C0JWe7yDOKrVFAM%252C_&vet=1&usg=AI4_-kTwdcaxC3EyM3cAymsAi7Y_Y1GC8Q&sa=X&ved=2ahUKEwiQp5XhpojyAhXBgP0HHWYuAV0Q9QF6BAgKEAE#imgrc=nH5liarSz56duM"}] }
  }

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Device.create! valid_attributes
      get devices_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      device = Device.create! valid_attributes
      get device_url(device), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Device" do
        expect {
          post devices_url,
               params: { device: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Device, :count).by(0)
      end

      it "renders a JSON response with the new device" do
        post devices_url,
             params: { device: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Device" do
        expect {
          post devices_url,
               params: { device: invalid_attributes }, as: :json
        }.to change(Device, :count).by(0)
      end

      it "renders a JSON response with errors for the new device" do
        post devices_url,
             params: { device: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "PATCH /update" do
    
    context "with invalid parameters" do
      it "renders a JSON response with errors for the device" do
        device = Device.create! valid_attributes
        patch device_url(device),
              params: { device: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested device" do
      device = Device.create! valid_attributes
      expect {
        delete device_url(device), headers: valid_headers, as: :json
      }.to change(Device, :count).by(-1)
    end
  end
end
