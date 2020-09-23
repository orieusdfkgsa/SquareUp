defmodule SquareUp.Employee do
  import SquareUp.Client, only: [call: 2]

  def retrieve(client, params) do
    call(client, %{
      method: :get,
      params: params,
      path: "/v1/me/employees/#{Map.get(params, "employee_id")}"
    })
  end

  def update(client, params) do
    call(client, %{
      method: :put,
      params: params,
      path: "/v1/me/employees/#{Map.get(params, "employee_id")}"
    })
  end

  def create(client, params) do
    call(client, %{
      method: :post,
      params: params,
      path: "/v1/me/employees"
    })
  end
end
