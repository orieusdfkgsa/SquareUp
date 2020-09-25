defmodule SquareUp.V2.BreakTypes do
  import Norm
  import SquareUp.Client, only: [call: 2]

  @spec list(%SquareUp.Client{}, %{location_id: binary(), limit: integer(), cursor: binary()}) ::
          SquareUp.Client.response()
  def list(client, params \\ %{}) do
    norm_spec =
      schema(%{
        location_id: spec(is_binary()),
        limit: spec(is_integer()),
        cursor: spec(is_binary())
      })

    call(client, %{
      method: :get,
      params: params,
      spec: norm_spec,
      path: "/v2/labor/break-types"
    })
  end
end