require 'test_helper'

class VendasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @venda = vendas(:one)
  end

  test "should get index" do
    get vendas_url, as: :json
    assert_response :success
  end

  test "should create venda" do
    assert_difference('Venda.count') do
      post vendas_url, params: { venda: { item_id: @venda.item_id, nome_cliente: @venda.nome_cliente } }, as: :json
    end

    assert_response 201
  end

  test "should show venda" do
    get venda_url(@venda), as: :json
    assert_response :success
  end

  test "should update venda" do
    patch venda_url(@venda), params: { venda: { item_id: @venda.item_id, nome_cliente: @venda.nome_cliente } }, as: :json
    assert_response 200
  end

  test "should destroy venda" do
    assert_difference('Venda.count', -1) do
      delete venda_url(@venda), as: :json
    end

    assert_response 204
  end
end
