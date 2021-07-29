require "test_helper"

class DeviceAttachmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @device_attachment = device_attachments(:one)
  end

  test "should get index" do
    get device_attachments_url, as: :json
    assert_response :success
  end

  test "should create device_attachment" do
    assert_difference('DeviceAttachment.count') do
      post device_attachments_url, params: { device_attachment: { avatar: @device_attachment.avatar, device_id: @device_attachment.device_id } }, as: :json
    end

    assert_response 201
  end

  test "should show device_attachment" do
    get device_attachment_url(@device_attachment), as: :json
    assert_response :success
  end

  test "should update device_attachment" do
    patch device_attachment_url(@device_attachment), params: { device_attachment: { avatar: @device_attachment.avatar, device_id: @device_attachment.device_id } }, as: :json
    assert_response 200
  end

  test "should destroy device_attachment" do
    assert_difference('DeviceAttachment.count', -1) do
      delete device_attachment_url(@device_attachment), as: :json
    end

    assert_response 204
  end
end
