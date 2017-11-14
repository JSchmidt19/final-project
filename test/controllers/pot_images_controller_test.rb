require 'test_helper'

class PotImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pot_image = pot_images(:one)
  end

  test "should get index" do
    get pot_images_url
    assert_response :success
  end

  test "should get new" do
    get new_pot_image_url
    assert_response :success
  end

  test "should create pot_image" do
    assert_difference('PotImage.count') do
      post pot_images_url, params: { pot_image: { image_url: @pot_image.image_url, pot_id: @pot_image.pot_id } }
    end

    assert_redirected_to pot_image_url(PotImage.last)
  end

  test "should show pot_image" do
    get pot_image_url(@pot_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_pot_image_url(@pot_image)
    assert_response :success
  end

  test "should update pot_image" do
    patch pot_image_url(@pot_image), params: { pot_image: { image_url: @pot_image.image_url, pot_id: @pot_image.pot_id } }
    assert_redirected_to pot_image_url(@pot_image)
  end

  test "should destroy pot_image" do
    assert_difference('PotImage.count', -1) do
      delete pot_image_url(@pot_image)
    end

    assert_redirected_to pot_images_url
  end
end
