require 'test_helper'

class FactTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fact_tag = fact_tags(:one)
  end

  test "should get index" do
    get fact_tags_url
    assert_response :success
  end

  test "should get new" do
    get new_fact_tag_url
    assert_response :success
  end

  test "should create fact_tag" do
    assert_difference('FactTag.count') do
      post fact_tags_url, params: { fact_tag: { fact_id: @fact_tag.fact_id, tag_id: @fact_tag.tag_id } }
    end

    assert_redirected_to fact_tag_url(FactTag.last)
  end

  test "should show fact_tag" do
    get fact_tag_url(@fact_tag)
    assert_response :success
  end

  test "should get edit" do
    get edit_fact_tag_url(@fact_tag)
    assert_response :success
  end

  test "should update fact_tag" do
    patch fact_tag_url(@fact_tag), params: { fact_tag: { fact_id: @fact_tag.fact_id, tag_id: @fact_tag.tag_id } }
    assert_redirected_to fact_tag_url(@fact_tag)
  end

  test "should destroy fact_tag" do
    assert_difference('FactTag.count', -1) do
      delete fact_tag_url(@fact_tag)
    end

    assert_redirected_to fact_tags_url
  end
end
