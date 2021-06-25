defmodule ElhexDelivery.PostalCode.DataParser do
  @postal_codes_filepath "data/2016_Gaz_zcta_national.txt"

  def parse_data do
    [_header | data_rows] = File.read!(@postal_codes_filepath) |> String.split("\n")

    data_rows
    |> Enum.map(&(String.split(&1, "\n")))
    |> Enum.filter(&data_row?(&1))
    |> Enum.map(fn row ->
      # get the values we want from the filtered row
      [postal_code, _, _, _, _, latitude, longitude] = row
      [postal_code, latitude, longitude]
    end)
    |> Enum.map(fn row ->
      [postal_code, latitude, longitude] = row

      latitude = latitude |> String.replace(" ", "") |> String.to_float
      longitude = longitude |> String.replace(" ", "") |> String.to_float

      {postal_code, {longitude, latitude}}
    end)
    |> Enum.into(%{}) # finally converting all to a map
  end

  defp data_row?(row) do
    # filter out only the rows that have that particular pattern
    case row do
      [postal_code, _, _, _, _, latitude, longitude] -> true
      _ -> false
    end
  end
end
